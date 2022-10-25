class DoctorsController < ApplicationController
  before_action :authenticate_patient!
  def index
    @doctors = Specialty.find_by_name(params[:name])&.doctors || []
  end
end
