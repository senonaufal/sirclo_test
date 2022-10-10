@authentication
Feature: Authentication

  @login
  Scenario: login successful using valid credentials
    Given user using "valid" credentials
    And user set authentication token
    When user set request body from "login.json"
    And  user send a "GET" request to "login"
    Then the response code should be "200"
    And the JSON response should have "status" with type "numeric" and value "equal" "200"
    And the JSON response should have "message" with type "string" and value "equal" "Login Successfully"
    And the JSON response should follow schema "login.json"

  @logout
  Scenario: logout successful using valid credentials
    Given user using "valid" credentials
    And user set authentication token
    When user set request body from "logout.json"
    And  user send a "POST" request to "logout"
    Then the response code should be "200"
    And the JSON response should have "status" with type "numeric" and value "equal" "200"
    And the JSON response should have "message" with type "string" and value "equal" "Logout Successfully"
    And the JSON response should follow schema "logout.json"

  @login_invalid
  Scenario: login failed using invalid credentials
    Given user using "invalid" credentials
    And user set authentication token
    When user set request body from "login.json"
    And  user send a "GET" request to "login"
    Then the response code should be "200"
    And the JSON response should have "status" with type "numeric" and value "equal" "403"
    And the JSON response should have "message" with type "string" and value "equal" "Wrong Email or Password"
