# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create! phone: 1020304050, password: 1020304050, password_confirmation: 1020304050 if Admin.first.nil?

#Specialty create 
%w[urologist neurologist psychiatrist otolaryngologist surgeon dentist geneticist].each do |specialty|
  Specialty.create! name: specialty
end if Specialty.first.nil?

#Doctor create
index = 0
Specialty.all.each do |specialty|
  Doctor.create! specialty: specialty, phone: 1020304050+index, password: 1020304050+index, password_confirmation: 1020304050+index
  index += 1
end if Doctor.first.nil?

Patient.create! phone: 1020304050, password: 1020304050, password_confirmation: 1020304050 if Patient.first.nil?

Reception.create! doctor: Doctor.first, patient: Patient.first, time: Time.now + 1.week if Reception.first.nil?
