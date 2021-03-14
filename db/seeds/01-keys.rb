include WgHelper

for i in 1..5
  privatekey = wg_genkey()
  publickey = wg_pubkey(privatekey)
  Key.find_or_create_by(
    name: "key-#{i}",
    description: "Test key ##{i}",
    publickey: publickey,
    privatekey: privatekey
  )
end
