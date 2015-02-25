class DailyAttendanceReport
  def initialize(date = Date.current)
    @date = date
  end

  def students
    User.where(role: "student")
  end

  def absent_students
    absent = []

    students.each do |student|
      absent << student if !student.present?(@date)
    end

    absent
  end

  def present_students
    present = []

    students.each do |student|
      present << student if student.present?(@date)
    end

    present
  end
end
