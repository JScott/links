Feature: Likes API
  As a front-end developer,
  I can like links and view a link's likes
  so that I can see evaluate the coolness of links

  Background:
    Given a Redis database

  Scenario: Add a like
    Given I am logged in
    When I POST to /v1/likes?url=https://google.com
    Then the response code is 201

  Scenario: Login required to add a like
    When I POST to /v1/likes?url=https://google.com
    Then the response code is 401

  Scenario: List likes
    When I GET to /v1/likes?url=https://google.com
    Then the response code is 200
    And an array of strings is returned
    And the response is not empty
