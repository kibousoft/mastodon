# == Schema Information
#
# Table name: ico_requests
#
#  id                   :integer          not null, primary key
#  user_id              :integer
#  ico_event_id         :integer
#  amount               :float
#  email                :string
#  eth_wallet_address   :string
#  token_wallet_address :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  campaign_name        :string(100)
#  language             :string(10)
#

class IcoRequest < ApplicationRecord
  belongs_to :user, optional: true

  validates :amount, presence: true, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000000}
  validates :email, presence: true
  validates :eth_wallet_address, presence: true
end
