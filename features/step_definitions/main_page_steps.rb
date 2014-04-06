Given(/^I am on the toptal main page$/) do
  @browser.goto 'https://toptal.com/users/login'
  @browser.title.should == 'Login | Toptal'
end

When(/^I am log in to toptal$/) do
  page = LoginPage.new(@browser)
  page.login('test', 'test')
  @browser.title.should == 'Toptal: Exclusive access to top developers'
end