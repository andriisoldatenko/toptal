Feature: Toptal Main Page

  Background:
    Given I am on the toptal main page

  Scenario Outline: Log in correctly
    When I am log in to toptal with username: company-qa@test.com password: magicopen
    Then I add new job
    Then I fullfill fields in step one:
      | name | description |
      | test | test        |
    Then I fullfill fields in step two
      | work_type | desired_commitment | time_zone | start_date | estimated_length | languages |
      |  1        | 2                  | 2         | 3          | 4                | 5         |
    Then I fullfill fields in step three:
      |one|two|
      |1  |2  |

  Examples:
    | name | description |
    | test | test2       |
