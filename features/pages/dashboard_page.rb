class DashboardPage
  include Watirsome

  link :new_job, text: 'Add New Job'
  title :page

  def add_new_job
    new_job
    CompanyPage.new(@browser)
  end

end