module Tutors
  class QuestionsController < BaseController
    def new
      @question = Question.new
    end
  end
end
