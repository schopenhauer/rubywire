class CreatePsks < ActiveRecord::Migration[6.1]
  def change
    create_table :psks do |t|
      t.text :name
      t.text :psk
      t.text :description
      #t.references :interface
      #t.references :peers

      t.timestamps
    end
  end
end
