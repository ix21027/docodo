class Specialty < ApplicationRecord
  has_many :doctors
  validates_uniqueness_of :name
  before_save { self.name.capitalize! }
end
