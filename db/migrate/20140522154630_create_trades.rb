class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.string :description
      t.string :email
      t.string :price
      t.string :location
      t.integer :user_id

      t.timestamps
    end
  end
end
