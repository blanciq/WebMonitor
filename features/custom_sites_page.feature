Feature: Custom sites page
  In order to check his sites
  logged user
  wants to see list of his own sites
  
  Scenario: User opens the custom sites page and sees his sites
    When I open custom sites page
    Then I should see my 2 sites
