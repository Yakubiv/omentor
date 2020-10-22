# frozen_string_literal: true

class Students::CalendarsController < Students::BaseController
  def index
    respond_to do |f|
      f.json
      f.html
    end
  end
end