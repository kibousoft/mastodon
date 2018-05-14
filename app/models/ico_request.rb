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
#

class IcoRequest < ApplicationRecord
end
