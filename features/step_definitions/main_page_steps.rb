Before do
  Fixtures.create_fixtures("test/fixtures", "sites")
end

Then /^I should see the following main pages:$/ do |expected_main_pages_table|
  expected_main pages_table.diff!(tableish('table tr', 'td,th'))
end

When /^I open main page$/ do
  visit "/"
end

Then /^I should see ranking table with four sites$/ do
  page.should have_css("table[class='ranking']")
  page.should have_css("tr", :count => 5)
end

Then /^Availability should be visible$/ do
  page.should have_css("td[class='availability']", :count => 4)
end

Then /^Validation results should be visible$/ do
  page.should have_css("td[class='validation']", :count => 4)
end
