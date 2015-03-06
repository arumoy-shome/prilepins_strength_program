Feature: Signing in

  Scenario: unsuccessful sign in
    Given a user visits the sign in page
    When they submit invalid credentials
    Then they should see an error message

  Scenario: successful sign in
    Given a user visits the sign in page
      And the user has an account
    When they submit correct credentials
    Then they should see their profile page
      And they sould see a sign out link
