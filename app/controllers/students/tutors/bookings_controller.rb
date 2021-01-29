# frozen_string_literal: true

class Students::Tutors::BookingsController < Students::BaseController
  def show
    # add form object later
    @tutor_profile = TutorProfile.friendly.find(params[:tutor_id])
    @lesson = Lesson.new(price: @tutor_profile.price_for_hour_lesson,
                         duration: params[:duration] || Lesson::ONE_HOUR_DURATION)
    @available_hours = Tutor::AvailableHours.new(@tutor_profile, @lesson, params[:start_date]&.to_datetime).fetch
  end

  def create
    @tutor_profile = TutorProfile.friendly.find(params[:tutor_id])
    class_room = current_student_profile.class_rooms.find_or_create_by(tutor_profile: @tutor_profile)
    @lesson = Lesson.create(lesson_params.merge(class_room_id: class_room.id))
    redirect_to students_lessons_checkout_path(@lesson)
  end

  private

  def lesson_params
    params.require(:lesson)
          .permit(:start_at, :subject_id, :duration, :price)
  end
end
