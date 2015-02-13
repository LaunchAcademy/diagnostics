class Admin::AttendancesController < ApplicationController
  def index
    if params[:date]
      @date = Date.parse(params[:date])
    else
      @date = Date.current
    end

    @attendance = DailyAttendanceReport.new(@date)
    @absent_students = @attendance.absent_students
    @present_students = @attendance.present_students
  end
end
