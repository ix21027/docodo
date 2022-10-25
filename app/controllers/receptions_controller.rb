class ReceptionsController < ApplicationController
  before_action :authenticate_patient!
  
  def index
    @receptions = Reception.active
  end

  def new
    @reception = Reception.new doctor_id: params[:doctor_id]
  end

  def create
    Reception.create! reception_params.merge(patient_id: current_patient.id)
    redirect_to receptions_path
  end

  private
  def reception_params
    params.require(:reception).permit(:doctor_id, :time)
  end
end
