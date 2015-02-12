class CheckIn < ActiveRecord::Base
  belongs_to :user,
  inverse_of: :check_ins

  belongs_to :location,
  inverse_of: :check_ins

  validates_presence_of :user
  validates_presence_of :location
  validates_presence_of :ip

  validates_presence_of :source
  validates_inclusion_of :source, in: ['apollo', 'cli']

  def self.on_date(date)
    where('DATE(created_at) = ?', date)
  end

  def self.today
    on_date(Date.current)
  end

  # def self.allow?(user, enrollment, ip)
  def self.allow?(user, ip)
    return false if user.nil?

    return false if enrollment.nil?
    return false if !enrollment.course_section.attendance_enabled?

    return false if ip.nil?
    return false if enrollment.course_section.location.ip != ip

    # already checked in?
    return false if user.checked_in_today?

    # is it a weekend?
    current_time = Time.zone.now
    weekends = %w(Saturday Sunday)
    if weekends.include?(current_time.strftime("%A"))
      return false
    end

    # are we within the approved time of day for checking in?
    start_time = Time.zone.parse(enrollment.course_section.check_in_start_time)
    end_time = Time.zone.parse(enrollment.course_section.check_in_end_time)

    if !((start_time <= current_time) && (current_time <= end_time))
      return false
    end

    return true
  end
end
