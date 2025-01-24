class CreateSessions < ActiveRecord::Migration[7.2]
  def change
    create_table :sessions, id: :uuid do |t|
      t.uuid :user_id, null: false
      t.timestamps
    end
  end
end
