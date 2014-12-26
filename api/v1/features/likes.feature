Feature: Likes API
  As a front-end developer,
  I can like links and view a link's likes
  so that I can see evaluate the coolness of links

  Background:
    Given a Redis database
    And I am logged in

  Scenario: Add a like
    When I POST to /v1/likes?url=https://google.com
    Then the response is true

  Scenario: List likes
    When I GET to /v1/likes?url=https://google.com
    Then an array of strings is returned
    And the response is not empty
