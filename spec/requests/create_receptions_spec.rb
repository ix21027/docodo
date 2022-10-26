require 'rails_helper'

RSpec.describe "CreateReceptions", type: :request do
  let(:patient) { create :patient }
  let(:doctor) { create :doctor }
  let(:params) { { reception: { doctor_id: doctor.id, time: (Time.now + 1.hour), patient_id: patient.id } } }
  
  describe "POST /receptions" do
    before do
      sign_in patient
      post '/receptions', params: params
    end
  
    it { expect(response).to redirect_to(receptions_path) } 

  end
end
