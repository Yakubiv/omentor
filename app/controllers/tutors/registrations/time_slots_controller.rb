# frozen_string_literal: true

class Tutors::Registrations::TimeSlotsController < Tutors::BaseController
  before_action :load_time_slot, only: %i[edit update]

  def index
    @time_slots = current_tutor_profile.time_slots
  end

  def new
    @time_slot = current_tutor_profile.time_slots.new
  end

  def edit; end

  def create
    @time_slot = current_tutor_profile.time_slots.new(time_slots_params)
    @time_slot.save
  end

  def update
    @time_slot.update(time_slots_params)
    true
  end

  private

  def time_slots_params
    params.require(:time_slot)
          .permit(:start_at, :end_at, :date_range)
  end

  def load_time_slot
    @time_slot = current_tutor_profile.time_slots.find(params[:id])
  end
end