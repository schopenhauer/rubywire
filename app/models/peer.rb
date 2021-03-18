class Peer < ApplicationRecord
  include PeersHelper

  belongs_to :key
  belongs_to :interface
  belongs_to :psk, optional: true

  validates :key, presence: true
  validates :interface, presence: true
  validates :psk, presence: false
  validates :allowed_ips, presence: false
  validates :endpoint, presence: false

  after_save :auto_assign_psk

  paginates_per 15

  private

  def auto_assign_psk
    reciprocal = reciprocal_peer(self)
    unless reciprocal.nil?
      reciprocal.update_columns(psk_id: psk_id)
    end
  end

end
