class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.references :user, index: true, foreign_key: true
      t.references :user_friend, index: true, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
