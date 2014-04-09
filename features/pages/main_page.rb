class MainPage
  include Watirsome

  def goto_login_page
    LoginPage.new(@browser)
  end
end