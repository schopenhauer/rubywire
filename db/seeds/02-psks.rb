include WgHelper

for i in 1..5
  Psk.find_or_create_by(
    name: "psk-#{i}",
    description: "Test PSK ##{i}",
    psk: wg_genpsk()
  )
end
