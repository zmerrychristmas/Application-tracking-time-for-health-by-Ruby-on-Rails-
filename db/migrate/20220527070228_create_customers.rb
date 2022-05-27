class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :number
      t.datetime :date
      t.text :description

      t.timestamps
    end
  end
end
