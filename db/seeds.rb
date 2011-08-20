# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

sites = Site.create([ 
  { :name => 'Google Polska', :url => 'http://www.google.pl' },
  { :name => 'NK.pl', :url => 'http://nk.pl' },
  { :name => 'Onet', :url => 'http://www.onet.pl' },
  { :name => 'Allegro', :url => 'http://www.allegro.pl' },
  { :name => 'Wirtualna Polska', :url => 'http://www.wp.pl' },
  { :name => 'Interia', :url => 'http://www.interia.pl' },
  { :name => 'Wrzuta', :url => 'http://www.wrzuta.pl' },
  { :name => 'Fotka', :url => 'http://www.fotka.pl' },
  { :name => 'Kurnik', :url => 'http://www.kurnik.pl' },
  { :name => 'O2.pl', :url => 'http://www.o2.pl' },
  { :name => 'Media Markt', :url => 'http://www.mediamarkt.pl' },
  { :name => 'Gadu Gadu', :url => 'http://www.gadu-gadu.pl' },
  { :name => 'Gratka', :url => 'http://www.gratka.pl' },
  { :name => 'mBank', :url => 'http://www.mbank.pl' },
  { :name => 'Spryciarze', :url => 'http://www.spryciarze.pl' },
  { :name => 'Lotto', :url => 'http://www.lotto.pl' },
  { :name => 'TVP', :url => 'http://www.tvp.pl' },
  { :name => 'Nokaut', :url => 'http://www.nokaut.pl' },
  { :name => 'Muzyka', :url => 'http://www.muzyka.pl' },
  { :name => 'TVN24', :url => 'http://www.tvn24.pl' },
  { :name => 'Home', :url => 'http://www.home.pl' },
  { :name => 'Gazeta Wyborcza', :url => 'http://www.gazeta.pl' },
  { :name => 'Elektroda', :url => 'http://www.elektroda.pl' } ])

tools = Tool.create([
  { :name => "htmlValidity", :classname => "ValidateHtmlTool"},
  { :name => "availability", :classname => "CheckAvailabilityTool"}])
