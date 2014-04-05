class AddNameAndNumberToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :first_name, :string
    add_column :players, :last_name, :string
    add_column :players, :jersey_number, :string
  end
end
