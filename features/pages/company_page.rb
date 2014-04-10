# encoding: utf-8
Watirsome.clickable << :radio

class CompanyPage
  include Watirsome

  link :cancel, text: 'Cancel'
  link :jump_to_job, text: 'Jump to Job'

  button :submit_job_description, text: 'Next — Job Details'
  button :_submit_required_skills, text: 'Next — Required Skills'
  button :_submit_confirmation, text: 'Next — Confirmation'
  button :_submit_see_what_next, text: 'Submit and See What\'s Next'

  text_field :job_title, id: 'new_job_title'
  text_field :job_start_date, id: 'new_job_start_date'
  text_field :languages, id: 'job_2_skill_sets'
  text_field :frameworks, id: 'job_3_skill_sets'
  textarea :job_description, id: 'new_job_description'

  radio :work_type, ->(value) { @browser.radio(:value => value) }
  radio :time_zone_preference, ->(value) { @browser.radio(:value => value) }

  select_list :job_commitment, id: 'new_job_commitment'
  select_list :job_estimated_length, id: 'new_job_estimated_length'

  checkbox :job_accept_review, id: 'new_job_accept_review'
  checkbox :job_accept_notice, id: 'new_job_accept_notice'
  checkbox :job_accept_deposit, id: 'new_job_accept_deposit'

  div :wizard_complete, class: 'wizard_complete__title'

  def type_job_desc(job_title, job_description)
    self.job_title = job_title
    self.job_description = job_description
    submit_job_description
    Watir::Wait.until { @browser.text.include? 'Follow this steps to add new job' }
  end

  def submit_required_skills
    _submit_required_skills
    Watir::Wait.until { self.languages_text_field.visible? }
  end

  def submit_confirmation
    _submit_confirmation
    Watir::Wait.until { self.job_accept_review_checkbox.visible? }
  end

  def submit_see_what_next
    _submit_see_what_next
    Watir::Wait.until { self.wizard_complete != '' }
  end
end