class AddNameColumnToCar < ActiveRecord::Migration
  def change
    add_column :cars, :name, :string, null: false
  end
end
