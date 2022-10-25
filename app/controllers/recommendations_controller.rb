class RecommendationsController < ApplicationController
  before_action :authenticate_doctor!, only: [:new, :create]
  before_action :authenticate_patient!, only: :index, unless: -> { current_doctor || current_patient }

  # before_action only: :index do
  #   redirect_to new_patient_session_path unless current_doctor || current_patient
  # end

  def index
    @recommendations = current_patient.recommendations if current_patient
    @recommendations = current_doctor.recommendations if current_doctor
  end
  
  def new
    @recommendation = Recommendation.new
  end

  def create
    Recommendation.create!(recommendation_params)
    redirect_to recommendations_path
  rescue 
    render :new, status: :unprocessable_entity
  end

  private
  
  def recommendation_params
    params.require(:recommendation).permit(:text, :reception_id)
  end
end
