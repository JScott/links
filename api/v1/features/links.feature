Feature: Links API
  As a front-end developer,
  I can add and get link details
  so that I can share my cool links

  Background:
    Given a Redis database

  Scenario Outline: Add and get links
    When I <method> <url>
    Then the response is <response>

    Examples:
      | method | url                                  | response      |
      | POST   | /v1/links/add?url=https://google.com | OK            |
      | GET    | /v1/links?url=https://google.com     | {"likes":"0"} |

  Scenario: Get list of links
    When I GET /v1/links
    Then an array of links is returned
