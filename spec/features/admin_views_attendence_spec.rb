require 'rails_helper'

feature "Admin Views Attendance Page", %(
  As an instructor
  I want to see which students have been active at Launch on a specific day
  So that I can take attendance.

  Acceptance Criteria:
  * [x] I can see a list of absent students on the current date.
  * [x] I can see a list of present students on the current date.
  * [x] I would like to be able to fill in an alternate date to
       view attendence stats on a past date
  * [x] I can see the total number of students that are designated in attendance
  * [x] I can see the total number of students that are designated as absent
  * [x] The numbers should correlate with the number of names listed in each section.
) do

  scenario "admin views attendence page and sees active students" do
    admin = FactoryGirl.create(:admin)
    student = FactoryGirl.create(:user_with_answered_quiz)
    student_name = "#{student.first_name} #{student.last_name}"

    sign_in(admin)

    click_link 'View Attendance'

    within(".present-students") do
      expect(page).to have_content("Present")
      expect(page).to have_content(student_name)
    end
  end

  scenario "admin views attendence page and sees inactive students" do
    admin = FactoryGirl.create(:admin)
    student = FactoryGirl.create(:user)
    student_name = "#{student.first_name} #{student.last_name}"

    sign_in(admin)

    click_link 'View Attendance'

    within(".absent-students") do
      expect(page).to have_content("Absent")
      expect(page).to have_content(student_name)
    end
  end

  scenario "admin sees total number of active students" do
    admin = FactoryGirl.create(:admin)
    FactoryGirl.create(:user_with_answered_quiz)
    FactoryGirl.create(:user_with_answered_quiz)

    sign_in(admin)

    click_link 'View Attendance'

    within(".present-students") do
      expect(page).to have_content("Present")
      expect(page).to have_content("Total: 2")
    end
  end

  scenario "admin sees total number of active students" do
    admin = FactoryGirl.create(:admin)
    FactoryGirl.create(:user)
    FactoryGirl.create(:user)

    sign_in(admin)

    click_link 'View Attendance'

    within(".absent-students") do
      expect(page).to have_content("Absent")
      expect(page).to have_content("Total: 2")
    end
  end

  scenario "admin views attendence page for a past date" do
    admin = FactoryGirl.create(:admin)
    student = FactoryGirl.create(:user)
    FactoryGirl.create(:answer_submission,
      user: student,
      created_at: DateTime.parse("2015/02/09 09:00 +0500")
    )
    student_name = "#{student.first_name} #{student.last_name}"

    sign_in(admin)

    expect(page).to_not have_content(student_name)

    click_link 'View Attendance'
    fill_in "Date", with: "2015/02/09"
    click_on "Submit"

    within(".present-students") do
      expect(page).to have_content("Present")
      expect(page).to have_content(student_name)
    end
  end
end
