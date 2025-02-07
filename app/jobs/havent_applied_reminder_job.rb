class HaventAppliedReminderJob < ApplicationJob
  def perform(job_application_id:)
    app = JobApplication.find(job_application_id)
    binding.pry
  end
end
