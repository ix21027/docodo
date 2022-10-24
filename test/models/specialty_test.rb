# == Schema Information
#
# Table name: specialties
#
#  id   :integer          not null, primary key
#  name :string
#
# Indexes
#
#  index_specialties_on_name  (name) UNIQUE
#
require "test_helper"

class SpecialtyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
