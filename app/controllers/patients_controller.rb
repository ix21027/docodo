class PatientsController < ApplicationController
  before_action :authenticate_doctor!
  def index
    @patients_phones = current_doctor.patients.distinct.pluck(:phone)
    @any_receptions = current_doctor.receptions.opens.any?
  end
end
