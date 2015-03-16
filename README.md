# Diagnostics
An application that allows instructors to easily create and administer multiple-choice quizzes.

Inspired by a chapter in [_Make it Stick: The Science of Successful Learning_](http://www.hup.harvard.edu/catalog.php?isbn=9780674729018) in which students test scores rose an entire letter grade, simply by implementing short, post-lecture quizzes.

## Features
* [LaunchPass](https://launchpass.launchacademy.com/) Authentication
* Loading of YAML-formatted Quizzes from lib/assets/quizzes via `rake db:seed`
* User sees completed/uncompleted Quizzes after sigining in.

## Configuration for Local Development
```
git clone git@github.com:LaunchAcademy/diagnostics.git
git clone git@github.com:LaunchAcademy/launch_pass.git

cd diagnostics

# copy and edit your .env file
cp .env.example .env
bundle
rake db:create && rake db:migrate && rake db:seed

cd ..
cd launch_pass

# copy and edit your .env and database.yml files
cp config/database.example.yml config/database.yml
cp .env.example .env
bundle
rake db:create && rake db:migrate && rake db:seed
rails s -p 3001
```
* Navigate to http://localhost:3001
* Click 'Sign up' and create an account.
* Add user to Admins team:

```
cd launch_pass
rails c
user = User.find_by(email: "test@gmail.com")
team = Team.find_by(name: "Admins")
Membership.create!(user: user, team: team)
```

* Navigate to http://localhost:3001/oauth/applications
* Create a New Application
  - Name: Diagnostics-development
  - Redirect URI: http://localhost:3000/auth/launch_pass/callback
* Copy the LaunchPass Application ID and Secret to the Diagnostics .env file.
  - Application ID -> LAUNCH_PASS_KEY
  - Secret -> LAUNCH_PASS_SECRET
* Now, to run the app in `development`, start LaunchPass and Diagnostics

```
# from the launch_pass folder
rails s -p 3001

# from the diagnostics folder
rails s
```

* In the `test` environment, the OmniAuth test mode is enabled. Use the `sign_in` helper provided in `spec/support/authentication_helper.rb`.


## ER Diagram
![ER Diagram](er-img.png "ER Diagram")
