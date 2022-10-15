class Patient < ApplicationRecord
  include Devisable
  has_many :recommendations
  has_many :receptions
  has_many :doctors, through: :receptions 
end
