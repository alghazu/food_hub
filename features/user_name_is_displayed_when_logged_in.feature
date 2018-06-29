Feature: User name is displayed when logged in
  As a user
  In order to confirm i am logged in
  I would like to have my name displayed instead of my email

  Background:
    Given We have the following user:
    | email          | password    | full_name             |
    | user@name.com  | 12345678    | User Userdottir  |

  Scenario: User can see his name instead of his email when logged in
  Given I visit the site
  When I am logged in as "user@name.com"
  Then I should see "Logged in as: User Userdottir"
  And I should not see "Logged in as: user@name.com"


