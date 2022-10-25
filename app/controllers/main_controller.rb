class MainController < ApplicationController
  def index
    current_user_type = current_user.class.name.downcase if current_user

    case current_user_type
    when 'patient' then redirect_to specialties_path
    when 'doctor' then redirect_to patients_path
    when 'admin' then redirect_to manager_doctors_path
    else redirect_to new_patient_session_path
    end
  end

  private
  def current_user
    @current_user ||= current_admin || current_patient || current_doctor
  end
end
