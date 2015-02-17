require 'rails_helper'

feature "Admin Views Attendance Page", %(
  As an instructor
  I would like to see which students have been active at Launch on a specific day
  So that I can take attendance.

  Acceptance Criteria:
  * [x] I can see a list of absent students on the current date.
  * [x] I can see a list of present students on the current date.
  * [x] I would like to be able to fill in an alternate date to
       view attendence stats on a past date
) do

  scenario "admin views attendence page and sees active students" do
    admin = FactoryGirl.create(:user, role: "admin")
    student = FactoryGirl.create(:user_with_answered_quiz)
    sign_in(admin)

    click_link 'View Attendance'

    within(".columns.medium-6:first-child") do
      expect(page).to have_content("Present")
      expect(page).to have_content(student.name)
    end
  end

  scenario "admin views attendence page and sees inactive students" do
    admin = FactoryGirl.create(:user, role: "admin")
    student = FactoryGirl.create(:user)
    sign_in(admin)

    click_link 'View Attendance'

    within(".columns.medium-6:last-child") do
      expect(page).to have_content("Absent")
      expect(page).to have_content(student.name)
    end
  end

  scenario "admin views attendence page for a past date" do
    admin = FactoryGirl.create(:user, role: "admin")
    student = FactoryGirl.create(:user)
    FactoryGirl.create(:answer_submission,
      user: student,
      created_at: DateTime.parse("2015/02/09 09:00 +0500")
    )

    sign_in(admin)

    expect(page).to_not have_content(student.name)

    click_link 'View Attendance'
    fill_in "Date", with: "2015/02/09"
    click_on "Submit"

    within(".columns.medium-6:first-child") do
      expect(page).to have_content("Present")
      expect(page).to have_content(student.name)
    end
  end
end
