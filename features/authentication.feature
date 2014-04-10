Feature: Toptal Authentication Page

  Background:
    Given I am on the toptal main page


  Scenario Outline: Authentication
    Given I am logged in with <username> and <password>

  Examples:
    | username            | password  |
    | company-qa@test.com | magicopen |
