class ReceptionsController < ApplicationController
  before_action :authenticate_patient!
  
  def index
    @receptions = Reception.opens
  end

  def new
    @reception = Reception.new doctor_id: params[:doctor_id]
  end

  def create
    reception = Reception.create(reception_params.merge(patient_id: current_patient.id))
    if reception.valid?
      redirect_to receptions_path
    else
      redirect_to new_reception_path(doctor_id: reception_params[:doctor_id]),
        alert: "error: #{reception.errors.full_messages.join('; ')}"
    end
  end

  private
  
  def reception_params
    params.require(:reception).permit(:doctor_id, :time)
  end
end
