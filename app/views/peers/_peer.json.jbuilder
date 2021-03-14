json.extract! peer, :id, :name, :allowed_ips, :dns, :created_at, :updated_at
json.url peer_url(peer, format: :json)
