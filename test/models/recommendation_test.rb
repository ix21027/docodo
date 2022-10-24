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
require "test_helper"

class RecommendationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
