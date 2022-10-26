# == Schema Information
#
# Table name: specialties
#
#  id   :bigint           not null, primary key
#  name :string
#
# Indexes
#
#  index_specialties_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :specialty do
    name { "specialty_#{rand()}" }
  end
end
