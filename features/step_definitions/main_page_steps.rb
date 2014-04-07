Given(/^I am on the toptal main page$/) do
  @browser.goto 'https://staging.toptal.com'
  @browser.title.should == 'Login | Toptal'
end

When(/^I am log in to toptal$/) do
  @login_page = LoginPage.new(@browser)
  @login_page.login('test', 'test')
  @login_page.title.should == 'Toptal: Exclusive access to top developers'
end

When(/^Fullfill form for new job$/)do
  @company_page = CompanyPage.new(@browser)
  @company_page.add_new_job
  @company_page.type_job_desc('test1', 'test2')
end





