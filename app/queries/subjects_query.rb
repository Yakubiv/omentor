# frozen_string_literal: true

class SubjectsQuery
  def initialize(params)
    @params = params
  end

  def call
    if @params[:name].blank?
      Subject.active
    else
      Subject.active.search_by_name(@params[:name])
    end.select(:name, :id).limit(15)
  end
end