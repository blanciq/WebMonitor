# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

sites = Site.create([ 
  { :name => 'Google Polska', :url => 'www.google.pl' },
  { :name => 'NK.pl', :url => 'nk.pl' },
  { :name => 'Onet', :url => 'www.onet.pl' },
  { :name => 'Allegro', :url => 'www.allegro.pl' },
  { :name => 'Wirtualna Polska', :url => 'www.wp.pl' },
  { :name => 'Interia', :url => 'www.interia.pl' },
  { :name => 'Wrzuta', :url => 'www.wrzuta.pl' },
  { :name => 'Fotka', :url => 'www.fotka.pl' },
  { :name => 'Kurnik', :url => 'www.kurnik.pl' },
  { :name => 'O2.pl', :url => 'www.o2.pl' },
  { :name => 'Media Markt', :url => 'www.mediamarkt.pl' },
  { :name => 'Gadu Gadu', :url => 'www.gadu-gadu.pl' },
  { :name => 'Gratka', :url => 'www.gratka.pl' },
  { :name => 'mBank', :url => 'www.mbank.pl' },
  { :name => 'Spryciarze', :url => 'www.spryciarze.pl' },
  { :name => 'Lotto', :url => 'www.lotto.pl' },
  { :name => 'TVP', :url => 'www.tvp.pl' },
  { :name => 'Nokaut', :url => 'www.nokaut.pl' },
  { :name => 'Muzyka', :url => 'www.muzyka.pl' },
  { :name => 'TVN24', :url => 'www.tvn24.pl' },
  { :name => 'Home', :url => 'www.home.pl' },
  { :name => 'Gazeta Wyborcza', :url => 'www.gazeta.pl' },
  { :name => 'Elektroda', :url => 'www.elektroda.pl' } ])
