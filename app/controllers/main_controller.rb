class MainController < ApplicationController
  def index
    @user = if current_patient
      'patient'
    elsif current_doctor
      'doctor'
    elsif current_admin
      redirect_to manager_doctors_path
    end
    redirect_to new_patient_session_path if !@user
  end
end
