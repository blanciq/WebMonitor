Before do
  Fixtures.create_fixtures("test/fixtures", "users")
  Fixtures.create_fixtures("test/fixtures", "sites")
end

When /^I open custom sites page$/ do
  visit "/custom_sites"
end

Then /^I should see my 2 sites$/ do
  page.should have_css("table[class='ranking']")
  page.should have_css("table[class='ranking'] tr")  
end

  


