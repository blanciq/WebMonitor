Then /^I should see the following main pages:$/ do |expected_main_pages_table|
  expected_main pages_table.diff!(tableish('table tr', 'td,th'))
end

When /^I open main page$/ do
  visit "/"
end

Then /^Ranking should be visible$/ do
  page.should have_css("table[class='ranking']")
end
