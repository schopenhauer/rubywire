module PeersHelper

  def valid_peering?(peer)
    !reciprocal_peer(peer).nil?
  end

  def reciprocal_peer(peer)
    Peer.where(key: peer.interface.key).find_by(interface_id: peer.key.interfaces.ids)
  end

end
