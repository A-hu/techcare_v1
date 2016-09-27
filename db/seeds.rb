# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times {
	u = User.create(first_name: Faker::Name.first_name,
							last_name:  Faker::Name.last_name,
							cell_phone_number: Faker::PhoneNumber.cell_phone,
							email: Faker::Internet.free_email,
							password: "123123"
							)
	u.create_caregiver(introduction: Faker::Lorem.sentence,
										experience: Faker::Lorem.sentence,
										skill: Faker::Pokemon.name,
										licence_number: Faker::Number.number(10),
										licence_offdate: Faker::Date.forward(500),
										training: Faker::Pokemon.location
										)
				}

20.times {
	u = User.create(first_name: Faker::Name.first_name,
									last_name:  Faker::Name.last_name,
									cell_phone_number: Faker::PhoneNumber.cell_phone,
									email: Faker::Internet.free_email,
									password: "123123"
							)
	u.create_requester(address: Faker::Address.street_address,
										condition_description: Faker::Lorem.sentence,
										)
				}