class RecommendationsController < ApplicationController
  before_action :authenticate_patient!, only: :index, unless: -> { current_doctor || current_patient }
  before_action :authenticate_doctor!, only: [:new, :create]

  def index
    @recommendations = current_patient.recommendations if current_patient
    @recommendations = current_doctor.recommendations if current_doctor
  end
  
  def new
    @recommendation = Recommendation.new
  end

  def create
    recommendation = Recommendation.create(recommendation_params)
    if recommendation.valid?
      redirect_to recommendations_path
    else
      redirect_to new_recommendation_path, alert: "error: #{recommendation.errors.full_messages.join('; ')}"
    end
  end

  private
  
  def recommendation_params
    params.require(:recommendation).permit(:text, :reception_id)
  end
end
