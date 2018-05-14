# == Schema Information
#
# Table name: ico_requests
#
#  id                   :bigint(8)        not null, primary key
#  user_id              :integer
#  ico_event_id         :integer
#  amount               :float
#  email                :string
#  eth_wallet_address   :string
#  token_wallet_address :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class IcoRequest < ApplicationRecord
  belongs_to :user
  belongs_to :ico_event

  validates :amount, presence: true, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 2147483647}
  validates :email, presence: true
  validates :eth_wallet_address, presence: true
end
