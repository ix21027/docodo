class SpecialtiesController < ApplicationController
  before_action :authenticate_patient!
  
  def index
    @specialties = Specialty.all
  end
end
