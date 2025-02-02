class JobApplications::RemindInAWeek < ApplicationJob
  queue_as :default

  def perform(job_application_id:)
    job_application = JobApplication.find_by(id: job_application_id)

    raise "JobApplication #{job_application_id} NotFound" unless job_application

    puts 'Sending Email!'
  end
end
