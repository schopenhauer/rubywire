require 'open3'
require 'ipaddr'

module WgHelper

  # TODO
  def valid_config?(interface, peer)
    #i1 = interface # Interface.find(interface)
    i2 = Interface.find_by(key_id: peer.key_id)
    #p1 = Peer.where('key_id = ? or interface_id = ?', interface.key_id, interface.id)
    #p "i1: #{i1.key.privatekey}"
    #p "i2: #{i2.key.privatekey}"
    #p "p1: #{p1[0].key.privatekey}"
    #p1
    i2
  end

  def subnet?(ip, subnet)
    IPAddr.new(subnet).include? ip
  end

  def wg?
    command?('wg')
  end

  def wg_version
    wg? ? `wg --version`.split(' - ')[0] : nil
  end

  def wg_genkey
    wg? ? Open3.capture2('wg genkey')[0].strip : nil
  end

  def wg_genpsk
    wg? ? Open3.capture2('wg genpsk')[0].strip : nil
  end

  def wg_pubkey(key)
    wg? ? Open3.capture2('wg pubkey', stdin_data: key)[0].strip : nil
  end

  private

  def command?(command)
    system("which #{command} > /dev/null 2>&1")
  end

end
