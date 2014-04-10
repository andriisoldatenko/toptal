Before do
  @browser = Watir::Browser.start 'https://toptal:staging@staging.toptal.com/users/login'
end

After do
  @browser.close
end