# Diagnostics
An application that allows instructors to easily create and administer multiple-choice quizzes.

Inspired by a chapter in [_Make it Stick: The Science of Successful Learning_](http://www.hup.harvard.edu/catalog.php?isbn=9780674729018) in which students test scores rose an entire letter grade, simply by implementing short, post-lecture quizzes.

## Features
* [LaunchPass](https://launchpass.launchacademy.com/) Authentication
* Loading of YAML-formatted Quizzes from lib/assets/quizzes via `rake db:seed`
* User sees completed/uncompleted Quizzes after sigining in.

## LaunchPass
In the `test` environment, the OmniAuth test mode is enabled. Use the `sign_in` helper provided in `spec/support/authentication_helper.rb`.

In the `development` environment, the app expects [LaunchPass](https://github.com/LaunchAcademy/launch_pass) to be running on `localhost:3001`.
* clone the app: `git clone git@github.com:LaunchAcademy/launch_pass.git`
* set up your .env file
* run the server: `rails s -p 3001`

## ER Diagram
![ER Diagram](er-img.png "ER Diagram")
