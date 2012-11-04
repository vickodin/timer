Feature: User should can signup

  Scenario: New user's visit
    Given I go to the signup page
    And I fill in "user[email]" with "new-email@example.com"
    And I fill in "user[username]" with "hipster"
    And I fill in "user[password]" with "123"
    And I fill in "user[password_confirmation]" with "123"
    When I press "Create User"
    Then I should be on the home page
    And I should see "Time Tracker App"
