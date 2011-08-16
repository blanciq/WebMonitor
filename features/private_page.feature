Feature: Private Page
  In order to use the application
  logged user
  wants to see his private page with his sites 
  
  Scenario: Unlogged user tries to enter private page
    When I am not logged in and try to enter private page 
    Then I should be redirect to login page
