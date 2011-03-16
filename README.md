# Yammer Like Authentication Flow using Devise
This is a sample application tat can be used as a starting point for a SaaS business application that uses a flow similar to Yammer
in order to let users sign-up and create accounts.

## User Stories

  * Signup - Allow users to signup with their company email. A new account is created for the company if its not already in the system and 
  its accessible via a subdomain thats identical to its email domain.
  * Login - User browses to his company's URL (ex: http://mycompany.local.host:3000) and can login from there
  
### Signup

1. User browses to main homepage (ex: http://www.local.host:3000)
2. User types his company email and presses the Sign Up button
3. Email Confirmation 

  - E-Mail is sent to the user containing an invite link to continue the process.
  - if the domain is on Google Apps the user is redirected to a screen allowing him to use his Google identity

4. Account is created (if needed) and a User is created on that company. User is logged in and redirected to the account's subdomain (ex: http://mycompany.local.host:3000)

### Login




# Help & Information
For questions etc. you can follow me on Twitter at http://twitter.com/ekampf

Any issues? Please create an [Issue](https://github.com/ekampf/Yammer-like-Authentication--using-Devise-and-subdomains-/issues) on GitHub