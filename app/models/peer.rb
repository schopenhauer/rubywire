class Peer < ApplicationRecord
  belongs_to :key
  belongs_to :interface
  belongs_to :psk, optional: true

  validates :key, presence: true
  validates :interface, presence: true
  validates :psk, presence: false
  validates :allowed_ips, presence: false
  validates :endpoint, presence: false

  paginates_per 15

end
