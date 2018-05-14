# == Schema Information
#
# Table name: ico_tokens
#
#  id         :integer          not null, primary key
#  name       :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class IcoToken < ApplicationRecord
end
