class Psk < ApplicationRecord
  has_many :interfaces
  has_many :peers

  validates :psk, presence: true, length: { is: 44 }

  paginates_per 10

  def pretty_name
    "#{name} &mdash; #{psk}".html_safe
  end

  def short_psk
    psk.truncate(15, omission: '...')
  end

end
