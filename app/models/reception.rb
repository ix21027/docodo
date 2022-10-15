class Reception < ApplicationRecord
  MAX_OPEN_RECEPTIONS = 10
  belongs_to :doctor
  belongs_to :patient
  has_one :recommendation 
  validate :check_limit_for_open_receptions, on: :create

  def check_limit_for_open_receptions
    if self.doctor.receptions.where(open: true).size > MAX_OPEN_RECEPTIONS
      errors.add(:limit_for_open_receptions, "is reached")
    end
  end
end
