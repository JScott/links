Feature: Links
  As a curious Internet user
  I can save, view, and vote on links
  so I can find the coolest stuff around

  Background:
    Given the system knows about the following lists:
      | name        |
      | cool links  |
      | my projects |

  Scenario: GET /lists
    When the client requests the lists
    Then the response is a list containing 2 lists
    And they have the following attributes:
      | name        |
      | cool links  |
      | my projects |