Feature: Company Add new Job

  Background:
    Given I am on the toptal main page
    Given I am logged in with company-qa@test.com and magicopen

  Scenario Outline: Add new Job
    Then I click on 'add new job' button
    Then I fill job description with <name> and <description>
    Then I fill job details with <work_type>, <commitment>, <start_date>, <es_length>
    Then I goto required skills
    Then I fill required skills <languages> and <frameworks>
    Then I goto confirmation
    Then I confirm all agreements
    Then I submit and see what's next
    Then I check message


  Examples:
    | name    | description  | work_type | commitment                 | start_date | es_length | languages | frameworks    |
    | testCPP | testCPP desc | onsite    | Hourly (no restrictions)   | 11/11/11   | Unknown   | C, C++    | STL, STDIO    |
    | testPy  | testPy  desc | remote    | Part-time (20+ hours/week) | 11-11-11   | 2-4 weeks | Python    | Flask, Django |

