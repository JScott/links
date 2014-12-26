Feature: Links API
  As a front-end developer,
  I can add and get links
  so that I can share my cool links

  Background:
    Given a Redis database

  Scenario: Add a link
    When I POST to /v1/links?url=https://google.com
    Then the response code is 201

  Scenario: Add a link requires a URL
    When I POST to /v1/links
    Then the response code is 400

  Scenario: List links
    When I GET to /v1/links
    Then the response code is 200
    And an array of strings is returned
    And the response is not empty
