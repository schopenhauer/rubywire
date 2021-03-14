class AddPathToHosts < ActiveRecord::Migration[6.1]
  def change
    add_column :hosts, :path, :string
  end
end
