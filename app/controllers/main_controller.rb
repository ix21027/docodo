class MainController < ApplicationController
  def index
    # if    current_patient then current_patient.recommendations
    # elsif current_doctor then current_doctor.receptions.includes(:patient).map { |r| [r.time, r.patient.phone] }
    # elsif current_admin then redirect_to manager_doctors_path
    # else                    redirect_to new_patient_session_path
    # end

    case current_user_type
    when 'patient' then redirect_to specialties_index_path #patient_profile_index_path
    when 'doctor' then redirect_to doctor_profile_index_path
    when 'admin' then redirect_to manager_doctors_path
    else redirect_to new_patient_session_path
    end
  end
end
