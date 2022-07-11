## Healthy

Healthy is a telemedicine app that provide user to arrange an virtual meet with the health consultant ( doctor ) to help them handle their mental health issue, the app also provide some information about medicine and some article regarding mental health issue to add more knowledge regarding mental health.

## requirement

some reqiurements you need to use this app is:
[Ruby] (https://www.ruby-lang.org/id/)
Rails
[SQLITE] (https://www.sqlite.org/)

to use rails you need to download ruby first, and run this command

```bash
gem install rails
```
and also you might need to clone this repo first by hitting this command


```bash
git clone https://github.com/rayprastya/telemedicine.git
```

## Getting started
you  have to run the migration first to collect all the model setup for the app

```bash
rails db:migrate
# or if you're using rake
rake db:migrate
```

and you can start the app by hitting this command

```bash
rails s
```
by that the app is ready to use

## Feature

All the feature installed in these app so far are:
Account ( CRUD , used as the main model for authentication )
User ( CRUD, used as extension table that associate from Account model for user)
Doctor ( CRUD, used as extension table that associate from Account model for doctor)
Article ( CRUD, provide information regarding mental health issue)
Medicine ( CRUD, provide information regarding medicine that used to handle mental health issue)
Meetings ( CRUD, provide meeting link (ZOOM) for user and doctor to have some consulting session)

for the detailed routes you can simply run this command
```bash
rails routes
```
it will be easier to understand since rails also provide HTTP method into each routes.

CREATED BY BE_HE3
