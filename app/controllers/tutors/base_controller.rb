class Tutors::BaseController < ApplicationController
  before_action :authenticate_tutor!
  layout 'tutors'
end