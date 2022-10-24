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
class Specialty < ApplicationRecord
  has_many :doctors
  validates_uniqueness_of :name
  before_save { self.name.capitalize! }
end
