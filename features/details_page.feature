Feature: Details Page
  In order to know details of a page
  user
  wants to see details of the page after following a link on the main page
  
  Scenario: User opens the main page and goes to details
    When I open main page 
    And I follow "MyName"
    Then I should see "MyUrl"
