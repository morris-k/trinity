# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


def create_data
	create_users
	create_events
end

def create_users
	puts "CREATING USERS"
	User.create!(:email => "test@example.com", :password => 'example12')
	User.create!(:email => "admin@example.com", :password => 'example12', :admin => true)
end

def create_events
	Event.create!(:title => "Bible Study", :date => Date.parse("21-8-2016"), :start_time => Time.parse('17:00'),
		:location => "Trinity Baptist Church")
end

User.delete_all
User.reset_pk_sequence
Event.delete_all
Event.reset_pk_sequence
create_data