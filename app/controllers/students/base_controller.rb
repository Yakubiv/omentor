# frozen_string_literal: true

class Students::BaseController < ApplicationController
  before_action :authenticate_student!
  layout 'students'
end
