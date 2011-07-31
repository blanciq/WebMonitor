# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Site.create(:name => 'Just a test', :url => 'http://just-a-test.com')
Site.create(:name => 'Wirtualna Polska', :url => 'http://www.wp.pl/')
Site.create(:name => 'Gazeta.pl', :url => 'http://www.gazeta.pl/')
