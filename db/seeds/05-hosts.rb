for i in 1..3
   Host.find_or_create_by(
     name: "demo#{i}",
     hostname: "demo#{i}.example.com",
     username: "root"
   )
end
