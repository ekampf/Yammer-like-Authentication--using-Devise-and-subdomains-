# Yammer Like Authentication Flow using Devise
This is a sample application tat can be used as a starting point for a SaaS business application that uses a flow similar to Yammer
in order to let users sign-up and create accounts.

Current state: _in development_ (not all flows are there)

## User Stories

  * Signup - Allow users to signup with their company email. A new account is created for the company if its not already in the system and 
  its accessible via a subdomain thats identical to its email domain.
  * Login - User browses to his company's URL (ex: http://mycompany.local.host:3000) and can login from there

Assumptions:

  * User belongs to one account only. There's a complete seperation of data between accounts (companies) in the system
  * User can only signup to an account using the company's email as its domain is used to match the account. However, user with an email outside the company _can be invited_ to access the account (tosupport the case of 3rd party vendors accessing the system)
  * User can only login from the company subdomain (as an email can belong to several accounts)
  
### Signup

1. User browses to main homepage (ex: http://www.local.host:3000)
2. User types his company email and presses the Sign Up button
3. Email Confirmation 

  * E-Mail is sent to the user containing an invite link to continue the process.
  * if the domain is on Google Apps the user is redirected to a screen allowing him to use his Google identity

4. Account is created (if needed) and a User is created on that company. User is logged in and redirected to the account's subdomain (ex: http://mycompany.local.host:3000)

### Login


# Roadmap

# See Also
This code is inspired by the following Devise samples which I tried using before writing this code:
- https://github.com/fortuity/rails3-subdomain-devise
- https://github.com/salex/rails3-Devise-BCSD-Can-Invite

However I have decided to write my own sample because IMHO the above are not implemented correctly, hooking into the User creation process in the model's :before_validation (which is kinda hacky) instead of deriving the Devise controllers.
Also, as I'm using this code for a real SaaS app, my goal is to have this code thoroughly speced and tested. 

For an introduction to Rails 3 and subdomains, see Ryan Bates’s screencast Subdomains in Rails 3 (a transcription is available from ASCIIcasts).

# Help & Information
For questions etc. you can follow me on Twitter at http://twitter.com/ekampf

Any issues? Please create an [Issue](https://github.com/ekampf/Yammer-like-Authentication--using-Devise-and-subdomains-/issues) on GitHub