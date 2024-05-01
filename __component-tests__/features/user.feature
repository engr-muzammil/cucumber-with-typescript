@user-service
Feature: User Service
  In order manage user
  As a developer
  I want to make sure CRUD operations through REST API works fine

  Scenario Outline: create a contact
    Given A contact <request>
    When I send POST request to /users
    Then I get response code 201

    Examples:
      | request                                                                 |
      | {"id":199,"name":"Dwayne Klocko","email":"Rene30@hotmail.com"}          |
      | {"id":17,"name":"Ian Weimann DVM","email":"Euna_Bergstrom@hotmail.com"} |

  Scenario Outline: modify contact
    Given The contact with <id> exist
    When I send PATCH request with a <phoneNumber> to /users
    Then I get response code 200

    Examples:
      | id  | phoneNumber                       |
      | 199 | {"phoneNumber": "(914) 249-3519"} |
      | 17  | {"phoneNumber": "788.323.7782"}   |

  Scenario Outline: get contact
    Given The contact with <id> exist
    When I send GET request to /users
    Then I receive <response>

    Examples:
      | id  | response                                                                                                                                      |
      | 199 | {"id":199,"name":"Dwayne Klocko","email":"Rene30@hotmail.com","phoneNumber": "(914) 249-3519"}         |
      | 17  | {"id":17,"name":"Ian Weimann DVM","email":"Euna_Bergstrom@hotmail.com", "phoneNumber": "788.323.7782"} |

  Scenario Outline: delete contact
    Given The contact with <id> exist
    When I send DELETE request to /users
    Then I get response code 200

    Examples:
      | id  |
      | 199 |
      | 17  |
