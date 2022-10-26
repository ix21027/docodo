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
class Reception < ApplicationRecord
  MAX_OPEN_RECEPTIONS = 10
  belongs_to :doctor
  belongs_to :patient
  has_one :recommendation 
  validate :check_limit_for_open_receptions, on: :create
  scope :opens, -> { where(open: true) }

  def check_limit_for_open_receptions
    if Reception.where(open: true, doctor: self.doctor).size > MAX_OPEN_RECEPTIONS
      errors.add(:limit_for_open_receptions, "is reached")
    end
  end
end
