class LoginPage
  include Watirsome

  text_field :username, id: 'user_email'
  text_field :password, id: 'user_password'
  button :submit_login, text: 'Login'
  title :page

  def login(username, password)
    self.username = username
    self.password = password
    submit_login
  end
end
