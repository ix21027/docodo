# == Schema Information
#
# Table name: receptions
#
#  id         :bigint           not null, primary key
#  open       :boolean          default(TRUE), not null
#  time       :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  doctor_id  :bigint           not null
#  patient_id :bigint           not null
#
# Indexes
#
#  index_receptions_on_doctor_id   (doctor_id)
#  index_receptions_on_patient_id  (patient_id)
#
# Foreign Keys
#
#  fk_rails_...  (doctor_id => doctors.id)
#  fk_rails_...  (patient_id => patients.id)
#
FactoryBot.define do
  factory :reception do
    time { Time.now + 1.day}
    doctor
    patient
  end
end
