require 'open3'
require 'ipaddr'

module WgHelper

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
