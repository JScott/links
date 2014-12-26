Feature: Links API
  As a front-end developer,
  I can add and get link details
  so that I can share my cool links

  Background:
    Given a Redis database

  Scenario: Add a link
    When I POST /v1/links/add?url=https://google.com
    Then the response is OK

  Scenario: Link details
    When I GET /v1/links?url=https://google.com
    Then the response is {"likes":"0"}

  Scenario: List links
    When I GET /v1/links
    Then an array of strings is returned

  Scenario: Like a link
    When I POST /v1/links/like?url=https://google.com
    And I GET /v1/links?url=https://google.com
    Then the response is {"likes":"1"}
