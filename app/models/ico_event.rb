# == Schema Information
#
# Table name: ico_events
#
#  id           :integer          not null, primary key
#  ico_token_id :integer
#  begin_at     :datetime
#  end_at       :datetime
#  sale_limit   :float
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class IcoEvent < ApplicationRecord
end
