class Admin::AttendancesController
  def index
    if params[:date]
      @date = Chronic.parse(params[:date])
    else
      @date = Date.current
    end

    @attendance = DailyAttendanceReport.new(@date)
    @absent_students = @attendance.absent_students.order(:name)
    @present_students = @attendance.present_students.order(:name)
  end
end
