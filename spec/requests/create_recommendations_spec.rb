require 'rails_helper'

RSpec.describe "CreateRecommendations", type: :request do
  let(:reception) { create :reception }
  let(:doctor) { create :doctor }
  let(:params) { { recommendation: { reception_id: reception.id, text: 'Test recommendation' } } }
  
  describe "POST /recommendations" do
    before do
      sign_in doctor
      post '/recommendations', params: params
    end
  
    it { expect(response).to redirect_to(recommendations_path) } 

  end
end
