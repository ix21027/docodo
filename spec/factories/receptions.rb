# == Schema Information
#
# Table name: receptions
#
#  id         :integer          not null, primary key
#  open       :boolean          default(TRUE), not null
#  time       :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  doctor_id  :integer          not null
#  patient_id :integer          not null
#
# Indexes
#
#  index_receptions_on_doctor_id   (doctor_id)
#  index_receptions_on_patient_id  (patient_id)
#
# Foreign Keys
#
#  doctor_id   (doctor_id => doctors.id)
#  patient_id  (patient_id => patients.id)
#
FactoryBot.define do
  factory :reception do
    time { Time.now + 1.day}
    doctor
    patient
  end
end
