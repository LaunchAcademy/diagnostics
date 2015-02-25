require "rails_helper"

feature "user submits an answer" do
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create(:question_with_answers) }

  scenario "user submits a correct answer" do
    ActionDispatch::Request.any_instance.stub(:remote_ip).
      and_return(ENV['LAUNCH_ACADEMY_IP'])

    sign_in(user)

    visit question_path(question)
    click_answer "Ruby"

    expect(page).to have_content("Correct!")
  end

  scenario "user submits an incorrect answer" do
    ActionDispatch::Request.any_instance.stub(:remote_ip).
      and_return(ENV['LAUNCH_ACADEMY_IP'])

    sign_in(user)

    visit question_path(question)
    click_answer "SQL"

    expect(page).to have_content("Sorry, that was incorrect.")
  end

  scenario "user tries same question twice" do
    ActionDispatch::Request.any_instance.stub(:remote_ip).
      and_return(ENV['LAUNCH_ACADEMY_IP'])

    sign_in(user)

    visit question_path(question)
    click_answer "SQL"
    visit question_path(question)
    click_answer "SQL"

    expect(page).to have_content("You already answered that question.")
  end
end

def click_answer(content)
  find(".answer_#{Answer.find_by(content: content).id}").click
end
