# Multiple-Choice App
An application that allows instructors to easily create and administer multiple-choice quizzes.

Inspired by a chapter in [_Make it Stick: The Science of Successful Learning_](http://www.hup.harvard.edu/catalog.php?isbn=9780674729018) in which students test scores rose an entire letter grade, simply by implementing short, post-lecture quizzes.

## Features
* [LaunchPass](https://launchpass.launchacademy.com/) Authentication
* Loading of YAML-formatted Quizzes from lib/assets/quizzes via `rake db:seed`
* User sees completed/uncompleted Quizzes after sigining in.

## ER Diagram
![ER Diagram](er-img.png "ER Diagram")

## User Stories

### Instructor Sees Percentage of Correct Responses
```
As an instructor
I want to see the percentage of students that answered a question correctly
So that I can know how well the lecture was received.
```

#### Acceptance Criteria:
* [ ] I can navigate to a show page for questions.
* [ ] I see a list of questions with a score for each.
* [ ] I see the number of students that have submitted an answer for
a particular question.

### Student Submits Anonymous "I'm Lost"
```
As a student
I want to anonymously indicate that I'm lost during facilitation
So that I can indicate comprehension to the staff.
```

#### Acceptance Criteria:
* [ ] I can navigate to a central page and signal that I'm lost
* [ ] I am notified if my signal was successful
* [ ] My I'm lost signal fades away after a short period of time.

### Instructor Sees Number of "I'm Lost"s
```
As an instructor
I want to see how many I'm lost signals have been received while I facilitate
So that I am aware of how effective my facilitation is.
```

#### Acceptance Criteria:
* [ ] I can navigate to a page for I'm lost signals
* [ ] I can leave this page open and see live I'm lost signals come and go
* [ ] I can see a raw number of total I'm losts.
* [ ] When the signals grow beyond a certain level, I am alerted.
* [ ] I can clear out all I'm lost signals.

### Quiz Summary
```
As as student
I want to see a summary of the quiz I have completed
So that I know how well I understood the material.
```

#### Acceptance Criteria
* [x] User's total score for the quiz is displayed
* [x] User's completion date for the quiz is displayed
* [x] All questions in the quiz should be listed
* [x] For each question, all answer options are listed
* [x] Correct answer for each question is marked
* [x] User's answer for each question is marked

### Student Index Page for Quizzes
```
As a student
I want to see all of the quizzes assigned to me
So that I can know what I have and have not completed.
```

#### Acceptance Criteria
* [ ] Display number of questions answered correctly per quiz.
* [ ] Display number of questions answered incorrectly per quiz.
* [ ] If the quiz is complete.
* [ ] Link to the start of the quiz if it isn't complete.
* [ ] Link to the summary of the quiz if it is complete.

### Student Attendance
```
As an instructor
I would like to see which students have been active at Launch Academy on a specific day
So that I can take attendance.
```

#### Acceptance Criteria
* [ ] I can see a list of absent students on a particular date.
* [ ] I can see a list of present students on a particular date.

### Adding a Quiz
```
As an instructor
I would like to upload a file containing a set of questions
So that I can easily issue a new quiz to students.
```

#### Acceptance Critera
* [ ] I can upload a YAML file that contains a list of questions.
* [ ] An example of the file format is displayed on the upload page.
* [ ] After submitting the file, I'm shown a list of questions as they would appear to the student.
* [ ] If I click 'Cancel', I'm brought back to the upload page.
* [ ] If I click 'Save', the questions are saved.

### Assign an Issue Date to a Quiz
```
As an instructor
I would like to assign a date to a quiz
So that it is not displayed to students before a set date.
```

### Instructor edits a question

### Instructor deletes a Quiz

### Question Explanation
```
As a student
I would like to have an explanation as to why an answer is correct
So that I can better comprehend the material presented.
```

#### Acceptance Criteria
* [ ] A explanation is displayed after an answer has been submitted to a question.
* [ ] An optional link to reading material is displayed.

### LaunchPass Integration

### Assign a Quiz to a LaunchPass Team

### Student Retakes a selection of missed questions
