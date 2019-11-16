# frozen_string_literal: true

class Tutors::BaseController < ApplicationController
  before_action :authenticate_tutor!
  layout 'tutors'
end
