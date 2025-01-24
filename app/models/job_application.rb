class JobApplication < ApplicationRecord
  belongs_to :user

  enum current_status: {
    havent_applied: "Haven't Applied",
    applied: 'Applied',
    referred: 'Referred',
    rejected: 'Rejected',
    turned_down: 'Turned Down'
  }

  validates :interest_level, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5,
    only_integer: true
  }
end
