# Welcome to Running Races Tracker!

## Short Description

This app was built for the avid runner who loves racing and needs a place to store all their race data.  There is also a social aspect, where you can view other runners reviews of races and their finish times.

## Install Instructions 

To install this to your local computer, ensure you have ruby/rails downloaded, then fork and clone the repositorty.  Once you are in the "running_races_app" directory, run `bundle install` to load all dependencies.  Next, run `rails db:migrate` to add migrations to the database and `rails db:seed` to add some races.  Finally, you can now boot up the server by typing `rails s` in the server. 

## Usage 

To sign up for an accont you can either create an account on the `/signup` page or signup using your Google account. (Note: you will have to register for a `GOOGLE_CLIENT_ID` and `GOOGLE_CLIENT_SECRET` to use this feature).  Once you are signed up and logged in, you can start by adding an existing race to your profile or, if you don't find the race you're looking for, create a new one!

## A Contributor's Guide

For pull requests, please visit: https://github.com/abaydar/running_races_app/pulls.
For bug reports, please visit: https://github.com/abaydar/running_races_app/issues

## License

This application is available as open source under the terms in the MIT License, found here: https://opensource.org/licenses/MIT