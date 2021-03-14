class CreatePeers < ActiveRecord::Migration[6.1]
  def change
    create_table :peers do |t|
      t.text :description
      t.text :allowed_ips
      t.text :endpoint
      t.integer :keepalive
      t.references :interface
      t.references :key
      t.references :psk

      t.timestamps
    end
  end
end
