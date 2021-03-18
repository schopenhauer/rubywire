class Interface < ApplicationRecord
  belongs_to :key
  belongs_to :psk, optional: true
  has_many :peers, dependent: :destroy

  validates :name, presence: true
  validates :key, presence: true
  validates :address, presence: true
  validates :port, presence: false, length: { minimum: 0, maximum: 65353 }, allow_blank: true

  before_validation :assign_psk, :default_values

  paginates_per 10

  def pretty_name
    "#{key.name} | #{name}.conf &mdash; #{key.privatekey}".html_safe
  end

  def config_file
    <<~config
    # Config file generated at #{Time.now}\n
    #{config_interface}
    #{config_peers}
    config
  end

  def config_interface
    str = "[Interface]\n"
    str << "# #{key.name}\n"
    str << "PrivateKey = #{key.privatekey}\n"
    str << "Address = #{address}\n"
    str << "PostUp = #{postup}\n" if postup?
    str << "PostDown = #{postdown}\n" if postdown?
    str << "ListenPort = #{port}\n" if port?
    str << "DNS = #{dns}\n" if dns?
    str
  end

  def config_peers
    str = ''
    peers.each do |peer|
      str << "[Peer]\n"
      str << "# #{peer.key.name}\n"
      str << "PublicKey = #{peer.key.publickey}\n"
      str << "PresharedKey = #{peer.psk.psk}\n" unless peer.psk.nil?
      str << "AllowedIPs = #{peer.allowed_ips}\n" if peer.allowed_ips?
      str << "Endpoint = #{peer.endpoint}\n" if peer.endpoint?
      str << "PersistentKeepalive = #{peer.keepalive}\n" if peer.keepalive?
      str << "\n"
    end
    str
  end

  private

  def default_values
    #self.port ||= 51820
  end

  def assign_psk
    peers.each do |peer|
      peer.psk_id = psk_id
      peer.save
      #TODO: set psk @ peer and apply to reciprocal_peer? (instead of interface)
      #reciprocal_peer(peer).psk_id = psk_id
      #reciprocal_peer(peer).save
    end
  end

end
