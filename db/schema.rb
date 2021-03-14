# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_14_175624) do

  create_table "hosts", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "hostname"
    t.integer "port"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "path"
    t.string "key"
  end

  create_table "interfaces", force: :cascade do |t|
    t.text "name"
    t.text "address"
    t.integer "port"
    t.text "postup"
    t.text "postdown"
    t.text "dns"
    t.integer "key_id"
    t.integer "psk_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["key_id"], name: "index_interfaces_on_key_id"
    t.index ["psk_id"], name: "index_interfaces_on_psk_id"
  end

  create_table "keys", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.text "publickey"
    t.text "privatekey"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "peers", force: :cascade do |t|
    t.text "description"
    t.text "allowed_ips"
    t.text "endpoint"
    t.integer "keepalive"
    t.integer "interface_id"
    t.integer "key_id"
    t.integer "psk_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["interface_id"], name: "index_peers_on_interface_id"
    t.index ["key_id"], name: "index_peers_on_key_id"
    t.index ["psk_id"], name: "index_peers_on_psk_id"
  end

  create_table "psks", force: :cascade do |t|
    t.text "name"
    t.text "psk"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
