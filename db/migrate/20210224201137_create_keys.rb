class CreateKeys < ActiveRecord::Migration[6.1]
  def change
    create_table :keys do |t|
      t.text :name
      t.text :description
      t.text :publickey
      t.text :privatekey
      #t.references :key

      t.timestamps
    end
  end
end
