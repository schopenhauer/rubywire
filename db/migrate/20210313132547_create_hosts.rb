class CreateHosts < ActiveRecord::Migration[6.1]
  def change
    create_table :hosts do |t|
      t.string :name
      t.string :username
      t.string :hostname
      t.integer :port

      t.timestamps
    end
  end
end
