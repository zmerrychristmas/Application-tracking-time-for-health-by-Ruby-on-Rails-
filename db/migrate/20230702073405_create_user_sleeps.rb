class CreateUserSleeps < ActiveRecord::Migration[6.1]
  def change
    create_table :user_sleeps do |t|
      t.datetime :sleep_in
      t.datetime :wake_up
      t.date :date
      t.integer :duration
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
