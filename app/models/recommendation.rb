# == Schema Information
#
# Table name: recommendations
#
#  id           :integer          not null, primary key
#  text         :text             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  reception_id :integer          not null
#
# Indexes
#
#  index_recommendations_on_reception_id  (reception_id)
#
# Foreign Keys
#
#  reception_id  (reception_id => receptions.id)
#
class Recommendation < ApplicationRecord
  belongs_to :reception
  after_create { self.reception.update(open: false) }
end
