# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


def create_data
	qarr = [
		{
			content: 'Then Jesus came to them and said, “All authority in heaven and on earth has been given to me. Therefore go and make disciples of all nations, baptizing them in the name of the Father and of the Son and of the Holy Spirit, and teaching them to obey everything I have commanded you. And surely I am with you always, to the very end of the age.”',
			citation: "Matthew 28:18-20",
			section: "vision"
		},
		{ 
			content: "O come, let us worship and bow down: let us kneel           
      		before the Lord our maker.",
      	 	citation: "Psalms 95:6 ",
      	 	section: "home"
      	 },
      	{
      		content: "O worship the Lord in the beauty of holiness: fear
      before him, all the earth.",   
      		citation: "Psalms 96:9",
      		section: "home"    
      	 }, 
      	 {
      	 	content: '"So we, being many, are one body in Christ, and every one members one of another."',
      	 	citation: "Romans 12:5",
      	 	section: "simple_terms"
      	 }
	]

	create_users
	create_events
	create_quotes(qarr)
end

def create_users
	puts "CREATING USERS"
	User.create!(:email => "test@example.com", :password => 'password')
	User.create!(:email => "admin@example.com", :password => 'password', :admin => true)
end

def create_events
	Event.create!(:title => "Bible Study", :date => Date.parse("28-8-2016"), :start_time => Time.parse('17:00'),
		:location => "Trinity Baptist Church")
end

def create_quotes(qarr)
	qarr.each do |q|
		Bquote.create!(q)
	end
	
end

User.delete_all
User.reset_pk_sequence
Event.delete_all
Event.reset_pk_sequence
Bquote.delete_all
Bquote.reset_pk_sequence
create_data