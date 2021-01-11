Feature:
  A user should be able to create an account, login, delete his account and signout from vivino app

  Background:
    Given I open the app and the app's main page is displayed
    And I logout from the application if already logged in
    And I click on Need a account button if currently in Welcome back page

  @all @account-creation
  Scenario: Create an account in vivino beta app by clicking Get started button in app welcome page
    Given I click on Get Started button in WelcomePage
    And I type auto-generated email with below password in create account page
      | Password   |
      | Welcome123 |
    And I type Crisitiano as First name and Ronaldo as Last Name in New profile page
    Then I ensure to accept terms and proceed from New profile page
    Then I verify the main page is displayed

  @all @account-creation @account-creation-multiple
  Scenario Outline: I should be able to create multiple users in vivino beta
    Given I click on Get Started button in WelcomePage
    And I type auto-generated email with below password in create account page
      | Password   |
      | Welcome123 |
    And I type <first_name> as First name and <last_name> as Last Name in New profile page
    Then I ensure to accept terms and proceed from New profile page
    Then I verify the main page is displayed

    Examples:
      | first_name | last_name |
      | N'Golo     | Kante     |
      | Van        | Dijk      |


