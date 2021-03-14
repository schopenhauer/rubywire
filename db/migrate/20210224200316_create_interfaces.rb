class CreateInterfaces < ActiveRecord::Migration[6.1]
  def change
    create_table :interfaces do |t|
      t.text :name
      t.text :address
      t.integer :port
      t.text :postup
      t.text :postdown
      t.text :dns
      t.references :key
      t.references :psk

      t.timestamps
    end
  end
end
