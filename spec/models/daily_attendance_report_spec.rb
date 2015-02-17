require 'spec_helper'

describe DailyAttendanceReport do
  let(:attendance_list) { DailyAttendanceReport.new() }

  describe '#students' do
    it 'only selects students, not admins' do
      student = FactoryGirl.create(:user)
      admin = FactoryGirl.create(:user, role: "admin")
      attendance_list = DailyAttendanceReport.new()

      expect(attendance_list.students).to include(student)
      expect(attendance_list.students).to_not include(admin)
    end
  end

  describe '#present_students' do
    it 'selects students that have completed a quiz on the current day' do
      present_student = FactoryGirl.create(:user_with_answered_quiz)

      attendance_list = DailyAttendanceReport.new()
      expect(attendance_list.present_students).to include(present_student)
    end

    it 'does not select students that have not completed a quiz on the current day' do
      absent_student = FactoryGirl.create(:user)

      attendance_list = DailyAttendanceReport.new()
      expect(attendance_list.present_students).to_not include(absent_student)
    end

    it 'does not select students that have answered a quiz on previous days' do
      absent_student = FactoryGirl.create(:user)
      quiz = FactoryGirl.create(:quiz_with_questions)
      question = quiz.questions.first
      FactoryGirl.create(:answer_submission,
        user: absent_student,
        question: question,
        answer: question.correct_answer,
        created_at: 5.days.ago
      )

      attendance_list = DailyAttendanceReport.new()
      expect(attendance_list.present_students).to_not include(absent_student)
    end
  end

  describe '#absent_students' do
    it 'only selects students that have not answered a quiz on the current day' do
      present_student = FactoryGirl.create(:user_with_answered_quiz)
      absent_student = FactoryGirl.create(:user)

      attendance_list = DailyAttendanceReport.new()
      expect(attendance_list.absent_students).to include(absent_student)
      expect(attendance_list.absent_students).to_not include(present_student)
    end
  end
end
