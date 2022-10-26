# == Schema Information
#
# Table name: doctors
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  phone                  :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  specialty_id           :integer          not null
#
# Indexes
#
#  index_doctors_on_phone                 (phone) UNIQUE
#  index_doctors_on_reset_password_token  (reset_password_token) UNIQUE
#  index_doctors_on_specialty_id          (specialty_id)
#
# Foreign Keys
#
#  specialty_id  (specialty_id => specialties.id)
#
require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe "phone validation" do
    let(:valid_phone_with_10_nums) { 10_00000000 }
    let(:valid_phone_with_14_nums) { 14_000000000000 }

    let(:invalid_phone_9_nums) { 9_00000000 }
    let(:invalid_phone_16_nums) { 16_00000000000000 }
    
    context "with valid phone number" do
      it { expect(build(:doctor, phone: valid_phone_with_10_nums)).to be_valid }
      it { expect(build(:doctor, phone: valid_phone_with_14_nums)).to be_valid }
    end

    context "with invalid phone number" do
      it { expect(build(:doctor, phone: invalid_phone_9_nums)).not_to be_valid }
      it { expect(build(:doctor, phone: invalid_phone_16_nums)).not_to be_valid }
    end
  end
end
