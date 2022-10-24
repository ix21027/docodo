class DoctorProfileController < ApplicationController
  def index
    @patients_phones = current_doctor.patients.distinct.pluck(:phone)
  end
end
