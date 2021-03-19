class Interface < ApplicationRecord
  belongs_to :key
  belongs_to :psk, optional: true
  has_many :peers, dependent: :destroy

  validates :name, presence: true
  validates :key, presence: true
  validates :address, presence: true
  validates :port, presence: false, length: { minimum: 0, maximum: 65_353 }, allow_blank: true

  # before_validation :default_values
  # after_save :auto_assign_psk

  paginates_per 10

  def pretty_name
    "#{key.name} | #{name}.conf — #{key.privatekey}"
  end

  def config_file
    <<~CONFIG
    # Config file generated at #{Time.now}\n
    #{config_interface}
    #{config_peers}
    CONFIG
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
    self.port ||= 51_820
  end

  # def auto_assign_psk
  #   peers.each do |peer|
  #     peer.psk_id = psk_id
  #     peer.save
  #   end
  # end

end
