# == Schema Information
#
# Table name: doctors
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  phone                  :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  specialty_id           :integer          not null
#
# Indexes
#
#  index_doctors_on_phone                 (phone) UNIQUE
#  index_doctors_on_reset_password_token  (reset_password_token) UNIQUE
#  index_doctors_on_specialty_id          (specialty_id)
#
# Foreign Keys
#
#  specialty_id  (specialty_id => specialties.id)
#
FactoryBot.define do
  factory :doctor do
    phone    { 10_00000000 + rand(0..100) }
    password { 'password' }
    specialty
  end
end
