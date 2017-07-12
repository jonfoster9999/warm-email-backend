# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Template.create(:name => "Flatiron Introduction Template",
				:body => "**email**

**subject**

Hi **contact_name**,

I hope you’ve been doing well. As you know, I’ve been looking for a new job as a software developer. I noticed that you are connected to **target_name** and was hoping you could introduce us if you feel comfortable doing so.

I noticed **target_name** works as a software engineer at **contact_company**, and I was hoping to glean some insights about their day-to-day. I understand you may have a lot going on, so I’d be happy to write a short blurb if you think that might be helpful? I so appreciate your time.

Thanks,

**my_name**",
)
Template.first.properties.create(:name => "email")
Template.first.properties.create(:name => "subject")
Template.first.properties.create(:name => "contact_name")
Template.first.properties.create(:name => "target_name")
Template.first.properties.create(:name => "contact_company")
Template.first.properties.create(:name => "my_name")
Template.first.save