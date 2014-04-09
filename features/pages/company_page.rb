# encoding: utf-8
Watirsome.clickable << :radio

class CompanyPage
  include Watirsome


  link :cancel, text: 'Cancel'
  link :jump_to_job, text: 'Jump to Job'


  button :submit_job_description, text: 'Next — Job Details'
  button :submit_required_skills, text: 'Next — Required Skills'
  button :submit_confirmation, text: 'Next — Confirmation'
  button :submit_see_what_next, text: 'Submit and See What\'s Next'

  text_field :job_title, id: 'new_job_title'
  textarea :job_description, id: 'new_job_description'
  text_field :job_start_date, id: 'new_job_start_date'

  radio :work_type, ->(value) { @browser.radio(:value => value) }
  select_list :job_commitment, id: 'new_job_commitment'

  radio :time_zone_preference, ->(value) { @browser.radio(:value => value) }
  select_list :job_estimated_length, id: 'new_job_estimated_length'

  text_field :languages, id: 'job_2_skill_sets'
  text_field :frameworks, id: 'job_3_skill_sets'

  checkbox :job_accept_review, id: 'new_job_accept_review'
  checkbox :job_accept_notice, id: 'new_job_accept_notice'
  checkbox :job_accept_deposit, id: 'new_job_accept_deposit'

  def type_job_desc(job_title, job_description)
    self.job_title = job_title
    self.job_description = job_description
    submit_job_description
    Watir::Wait.until { @browser.text.include? 'Follow this steps to add new job' }
  end
end