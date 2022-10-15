class Doctor < ApplicationRecord
  include Devisable
  belongs_to :specialty
  has_many :recommendations
  has_many :receptions
  has_many :patients, through: :receptions, dependent: :destroy
end
