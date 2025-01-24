class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email, null: false, index: { unique: true }
      t.string :password, null: false
      t.boolean :is_public, default: false
      t.integer :goal_per_week, default: 1
      t.string :timezone, null: false

      t.timestamps
    end
  end
end
