Feature: Users API
  As a front-end developer,
  I can create and list users to log in as
  so that I can attribute entities to identities

  Background:
    Given a Redis database

  Scenario: Add a user
    Given that I log in
    When I POST to /v1/users?email=test@email.com
    Then the response code is 201

  Scenario: Add a user requires an email
    Given that I log in
    When I POST to /v1/users
    Then the response code is 400

  Scenario: Add a user requires credentials
    When I POST to /v1/users?email=test@email.com
    Then the response code is 401

  Scenario: List users
    When I GET to /v1/users
    Then the response code is 200
    And an array of strings is returned
    And the response is not empty
    
  Scenario: TODO - Authenticate email
