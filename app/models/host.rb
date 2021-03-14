class Host < ApplicationRecord
  validates :name, presence: true
  validates :username, presence: true
  validates :hostname, presence: true
  validates :port, presence: true, length: { minimum: 0, maximum: 65353 }
  validates :path, presence: true

  before_validation :default_values

  paginates_per 10

  def default_values
    self.port ||= 22
    self.path ||= '/etc/wireguard'
  end

end
