Given(/^I am on the toptal main page$/) do
  @browser.title.should == 'Login | Toptal'
end

When(/^I am log in to toptal$/) do
  @login_page = LoginPage.new(@browser)
  @login_page.login('test', 'test')
  @login_page.page_title.should == 'Toptal: Exclusive access to top developers'
end

When(/^Fullfill form for new job$/)do
  @company_page = CompanyPage.new(@browser)
  @company_page.add_new_job
  @company_page.type_job_desc('test1', 'test2')

  Watir::Wait.until { @browser.text.include? 'Follow this steps to add new job' }

  @company_page.work_type('onsite')
  @company_page.job_commitment = 'Hourly (no restrictions)'
  @company_page.time_zone_preference('no')
  @company_page.job_start_date = '11/11/11', :escape
  @company_page.job_estimated_length = 'Unknown'
  @company_page.submit_required_skills

  Watir::Wait.until { @browser.label(:text => 'Languages').exists? }
  @company_page.languages = 'Python', :return
  @company_page.frameworks = 'Django', :return
  @company_page.submit_confirmation
end