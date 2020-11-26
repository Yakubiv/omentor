# frozen_string_literal: true

class Tutors::CalendarsController < Tutors::BaseController
  def index
    # vacations, lessons
    # render json: [{type: 'lesson', description:'some text ', start: '122/23/2', end: '22/23/11'},
    # {type: 'vacation', description:'2 some text ', start: '122/23/2', end: '22/23/11'}]
    # query = TutorProfileCalendarEventsQuery.new(current_tutor_profile)
    # render json: query.results
    TutorProfileCalendarEventsQuery.new(current_tutor_profile).results
  end
end