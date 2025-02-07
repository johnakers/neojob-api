class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users, id: :uuid do |t|
      t.string   :display_name, null: false
      t.string   :email, null: false, index: { unique: true }
      t.string   :password, null: false
      t.boolean  :is_public, default: false, null: false
      t.integer  :applications_per_week_goal, default: 1, null: false
      t.string   :timezone, null: false

      t.timestamps
    end
  end
end
