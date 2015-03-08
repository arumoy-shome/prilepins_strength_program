Feature: Update Users

  Scenario: Edit user
    Given I am a user
    When I click on the edit link
    Then I can see the edit profile page
