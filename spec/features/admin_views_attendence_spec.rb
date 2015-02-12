require 'rails_helper'

feature "Admin Views Attendance Page", %(
As an instructor
I would like to see which students have been active at Launch on a specific day
So that I can take attendance.

Acceptance Criteria:
* [] I can see a list of absent students on a particular date.
* [] I can see a list of present students on a particular date.
) do

  scenario "admin views attendence page and sees active students", focus: true do
    admin = FactoryGirl.create(:user, role: "admin")
    student = FactoryGirl.create(:user_with_answered_quiz)
    sign_in(admin)

    click_link 'View Attendance'

    expect(page).to have_content("Present")
    expect(page).to have_content(student.name)
  end

  scenario "admin views attendence page and sees active students" do
    admin = FactoryGirl.create(:user, role: "admin")
    student = FactoryGirl.create(:user)
    click_on 'View Attendance'

    expect(page).to have_content("Absent")
    expect(page).to have_content(student.name)
  end
end
