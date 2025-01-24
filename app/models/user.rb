class User < ApplicationRecord
  has_one :session
  has_many :job_applications

  TIMEZONES = ActiveSupport::TimeZone.all.map(&:name).freeze

  def login!
    session&.destroy

    Session.create!(user_id: id)
  end
end
