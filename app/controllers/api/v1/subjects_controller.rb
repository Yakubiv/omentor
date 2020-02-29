# frozen_string_literal: true

class Api::V1::SubjectsController < Api::V1::ApiController
  def index
    @subjects = SubjectsQuery.new(Subject.active.all, subject_params).call

    render json: @subjects.to_json
  end

  private

  def subject_params
    { name: params[:name] }
  end
end
