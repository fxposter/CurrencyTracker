CurrencyTracker
===============

CurrencyTracker allows you to track your personal collection of world currencies, by tagging the countries that you've visited along your travels.

Features
--------

* Track Visited Countries
* Track Collected Currencies
* Charts show you how far along you are!

Assumptions
-----------
* Currencies and countries tables are shared between users, cause if these tables are modified we need to change them only once, not per user.
* User can login through email.
* User should not see line chart when there is no visited countries / collected currencies.
* Line chart should group user's travels by month.

Possible technical enhancements
-------------------------------
* Move currencies and countries table rendering to the client side (we would benefit in terms of more structural code, but it could be harder to understand for people, who don't know how to build RIAs).
* Add more acceptance tests.
* Switch from basic fixtures to something more solid (factory girl, for example), cause now fixtures do not work well with associations, which makes them hard to test.
* Upgrade to Rails 3.1 cause asset pipeline is good :)
* Add capistrano for deployment.
* Check/modify app in order to run on recommended ruby 1.9 branch
* Switch to mysql/prostgresql in order to handle multiple users concurrently.

Possible enhancements in terms of product owner
-----------------------------------------------
* Improve charts view (more human date format/etc).
* Add username, so user can login with username and email.
* Add openid/oauth authentication.
* Add ability to specify which bills and coins the user have in every currency.
* Show users who has the currencies, but with other nominal values.
* Add social abilities - write to other users/etc.
* Add viewing visited/unvisited countries on map.
* ...