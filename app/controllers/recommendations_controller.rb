class RecommendationsController < ApplicationController
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
