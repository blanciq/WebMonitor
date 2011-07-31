Feature: Main Page
  In order to use the application
  user
  wants to see main page with application name and statistics
  
  Scenario: User opens the main page
    When I open main page 
    Then I should see "WebMonitor"
    And Ranking should be visible
    And Availability should be visible