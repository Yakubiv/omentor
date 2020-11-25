
class TutorProfileCalendarEventsQuery
  def initialize(tutor_profile)
    @tutor_profile = tutor_profile
  end

  def results
    tutor_vacations + tutor_lessons
  end

  private

  attr_reader :tutor_profile

  def tutor_vacations
    tutor_profile.vacations.map do |vacation|
      { type: 'vacation',
        start: vacation.start_at,
        end: vacation.end_at,
        description: vacation.description }
    end
  end

  def tutor_lessons
    tutor_profile.lessons.map do |lesson|
      { type: 'lesson',
        start: lesson.start_at,
        end: lesson.start_at + lesson.duration.minutes,
        description: "#{lesson.student_profile} - #{lesson.subject}" }
    end
  end

  def google_calendar_events
    #integration with google calendar
  end
end

