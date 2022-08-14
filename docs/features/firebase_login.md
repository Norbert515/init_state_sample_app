
# Overview

Authentication uses the firebase_auth package, which connects to the firebase services to handle user accounts in the backend.

The authentication module is composed of different submodules that make up the whole authentication
flow experience. In addition to the actual authentication part, app routing is also integrated with authentication
so that different parts of the apps are only accessible when authenticated (such as a profile page).
This is very useful when building mobile and desktop applications, but is absolutely crucial for web applications
as users could potentially jump to a specific route at any point in time by simply entering its URL.

## Routing

To make a route scoped to authenticated users, simply put it into the scope of the `GoRoute` that
handles auth checking. If the user tries to access that route he is redirected to the login page - only the login is done
the user lands on the desired page that was initially requested. This supports the expected back navigation of all platforms
(mobile, desktop and web).

If on the other hand, the route should not require authentication, simply put it into the top scope (such an 'About us' page).

## Login

The login module handles the login flow when authenticating. It also provides a link to the registration page if the user
happens to not have an account. For further information check out the comments in the code.

## Registration

The registration handles the registration part of the authentication process. This is meant for first time users that who
don't have an account yet. The registration also links to the login page that can be used to login instead. Check out the
comments in the code for further information.

## Password Reset

The password resets handles the case when user forgets his password. To configure the email, head over to the firebase console
to customize it.