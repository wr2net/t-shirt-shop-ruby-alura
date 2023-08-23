class AddDepartamentIdToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :departament_id, :integer
  end
end
