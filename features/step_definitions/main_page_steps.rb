# encoding: utf-8
Given(/^I am on the toptal main page$/) do
  @login_page = MainPage.new(@browser).goto_login_page
  @login_page.page_title.should == 'Login | Toptal'
end

Given(/^I am logged in with (.*) and (.*)$/) do |username, password|
  @dashboard_page = @login_page.login(username, password)
  @dashboard_page.page_title.should == 'Toptal: Exclusive access to top developers'
end

Then(/^I click on 'add new job' button$/) do
  @company_page = @dashboard_page.add_new_job
end

When(/^I fill job description with (.*) and (.*)$/)do |name, description|
  @company_page.type_job_desc(name, description)
end

When(/^I fill job details with (.*), (.*), (.*), (.*)$/)do |work_type, commitment, start_date, es_length|
  @company_page.work_type(work_type)
  @company_page.job_commitment = commitment
  @company_page.job_start_date = start_date, :escape
  @company_page.job_estimated_length = es_length
end

When(/^I goto required skills$/)do
  @company_page.submit_required_skills
end

When(/^I fill required skills (.*) and (.*)$/)do |languages, frameworks|
  languages.split(', ').each {|lang| @company_page.languages = lang, :return}
  frameworks.split(', ').each {|f| @company_page.frameworks = f, :return}
end

When(/^I goto confirmation$/)do
  @company_page.submit_confirmation
end

When(/^I confirm all agreements$/)do
  @company_page.job_accept_review = true
  @company_page.job_accept_notice = true
  @company_page.job_accept_deposit = true
end

When(/^I submit and see what\'s next$/)do
  @company_page.submit_see_what_next
end

When(/^I check message$/)do
  @company_page.wizard_complete.should == "Congratulations — you\'ve just added a new job!"
end