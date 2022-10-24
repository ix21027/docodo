class DoctorsController < ApplicationController
  def index
    @doctors = Specialty.find_by_name(params[:name]).doctors
  end
end
