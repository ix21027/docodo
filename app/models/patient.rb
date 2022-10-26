# == Schema Information
#
# Table name: patients
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  phone                  :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_patients_on_phone                 (phone) UNIQUE
#  index_patients_on_reset_password_token  (reset_password_token) UNIQUE
#
class Patient < ApplicationRecord
  include Devisable
  has_many :receptions
  has_many :doctors, through: :receptions 
  has_many :recommendations, through: :receptions
end
