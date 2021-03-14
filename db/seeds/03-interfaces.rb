for i in 1..5
  Interface.find_or_create_by(
    name: "wg#{i}",
    address: "10.8.2.#{i}/24",
    key: Key.find(i),
    psk: Psk.find(i)
  )
end
