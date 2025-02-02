class JobApplication < ApplicationRecord
  belongs_to :user

  enum current_status: {
    pending: 'pending',
    referred: 'referred',
    applied: 'applied',
    intervinewing: 'interviewing',
    rejected: 'rejected',
    declined: 'declined'
  }

  validates :interest_level, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5,
    only_integer: true
  }

  after_create :remind_in_a_week!

  private

  def remind_in_a_week!
    JobApplications::RemindInAWeek.perform_now(job_application_id: id)
  end
end
