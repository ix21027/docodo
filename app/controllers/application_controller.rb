class ApplicationController < ActionController::Base
  # before_action :authenticate
  protected

  def current_user
    @current_user ||= current_admin || current_patient || current_doctor
  end

  def current_user_type
    current_user.class.name.downcase if current_user
  end

  # def authenticate
  #   case current_user_type
  #   when 'patient' then redirect_to patient_profile_index_path
  #   when 'doctor' then redirect_to doctor_profile_index_path
  #   when 'admin' then redirect_to manager_doctors_path
  #   else redirect_to new_patient_session_path
  #   end
  # end
end
