class AddKeyToHosts < ActiveRecord::Migration[6.1]
  def change
    add_column :hosts, :key, :string
  end
end
