# frozen_string_literal: true

class HomesController < ApplicationController
  layout 'home'

  def index
    redirect_to blogs_path
  end
end
