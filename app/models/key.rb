class Key < ApplicationRecord
  has_many :interfaces, dependent: :destroy
  has_many :peers, dependent: :destroy

  validates :publickey, presence: true, length: { is: 44 }
  validates :privatekey, presence: true, length: { is: 44 }

  paginates_per 10

  def pretty_privatekey
    "#{name} — #{privatekey}"
  end

  def pretty_publickey
    "#{name} — #{publickey}"
  end

  def short_privatekey
    privatekey.truncate(15, omission: '...')
  end

  def short_publickey
    publickey.truncate(15, omission: '...')
  end

end
