# == Schema Information
#
# Table name: doctors
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
#  specialty_id           :bigint           not null
#
# Indexes
#
#  index_doctors_on_phone                 (phone) UNIQUE
#  index_doctors_on_reset_password_token  (reset_password_token) UNIQUE
#  index_doctors_on_specialty_id          (specialty_id)
#
# Foreign Keys
#
#  fk_rails_...  (specialty_id => specialties.id)
#
class Doctor < ApplicationRecord
  include Devisable
  belongs_to :specialty
  has_many :receptions
  has_many :patients, through: :receptions, dependent: :destroy
  has_many :recommendations, through: :receptions
end
