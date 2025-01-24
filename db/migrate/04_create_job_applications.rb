class CreateJobApplications < ActiveRecord::Migration[7.2]
  def change
    create_table :job_applications, id: :uuid do |t|
      t.uuid :user_id, null: false

      t.string    :company_name, null: false
      t.string    :position_name, null: false
      t.integer   :interest_level, null: false
      t.string    :company_url
      t.string    :position_url
      t.string    :glassdoor_url
      t.datetime  :applied_on, null: false
      t.string    :contact_name
      t.integer   :current_status, default: :havent_applied
      t.text      :note

      t.timestamps
    end
  end
end
