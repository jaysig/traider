class AddEmailToPins < ActiveRecord::Migration
  def change
    add_column :pins, :email, :string
  end
end
