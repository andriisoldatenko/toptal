class CompanyPage
  include Watirsome

  button :add_new_job, text: 'Add New Job'

  button :submit_job_description, text: 'Next — Job Details'
  text_field :job_title, id: 'new_job_title'
  textarea :job_description, id: 'new_job_description'

  def type_job_desc(job_title, job_description)
    self.job_title = job_title
    self.job_description = job_description
    submit_job_description
  end

  new_job_languages

end