# frozen_string_literal: true

class SubjectsQuery
  def initialize(relation, params)
    @relation = relation
    @params = params
  end

  def call
    @relation.where('name ilike ?', "%#{@params[:name]}%").select(:name, :id).limit(15)
  end
end