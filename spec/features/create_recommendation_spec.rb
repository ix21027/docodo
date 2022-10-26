require 'rails_helper'

RSpec.feature "CreateRecommendations", type: :feature do
  describe "the signin process", type: :feature do
    let(:text) { 'Text of the recommendation' }
    let!(:doctor)    { create :doctor }
    let!(:reception) { create :reception, doctor: doctor}

    before { sign_in doctor }

    it "signs me in" do
      visit '/recommendations/new'
      find("option[value='#{reception.id}']").select_option
      fill_in 'recommendation[text]', with: text
      click_button 'Create'
      expect(page).to have_content text
    end

  end
end
