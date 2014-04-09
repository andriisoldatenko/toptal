Given(/^I am on the toptal main page$/) do
  @login_page = MainPage.new(@browser).goto_login_page
  @login_page.page_title.should == 'Login | Toptal'
end

When(/^I am log in to toptal with username: (.*) password: (.*)$/) do |username, password|
  @dashboard_page = @login_page.login(username, password)
  @dashboard_page.page_title.should == 'Toptal: Exclusive access to top developers'
end

When(/^I add new job$/)do
  @company_page = @dashboard_page.add_new_job
end

When(/^I fullfill fields in step one:$/)do |table|
  h = table.hashes
  p h
  @company_page.type_job_desc(h['name'], h['desc'])
end


When(/^I fullfill fields in step two:$/)do |table|
  h = table.hashes
  p h
  @company_page.work_type = ('onsite')
  @company_page.job_commitment = 'Hourly (no restrictions)'
  @company_page.time_zone_preference('no')
  @company_page.job_start_date = '11/11/11', :escape
  @company_page.job_estimated_length = 'Unknown'
  @company_page.submit_required_skills
end

When(/^I fullfill fields in step three:$/)do |table|
  Watir::Wait.until { @company_page.languages_text_field.visible? }
  @company_page.languages = 'Python', :return
  @company_page.frameworks = 'Django', :return
  @company_page.submit_confirmation
  Watir::Wait.until { @company_page.job_accept_review_checkbox.visible? }
  @company_page.job_accept_review = true
  @company_page.job_accept_notice = true
  @company_page.job_accept_deposit = true
  @company_page.submit_see_what_next
end