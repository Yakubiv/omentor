# frozen_string_literal: true

class UsersController < ApplicationController
  layout 'login', only: :pending

  def pending; end

  def registration
    session[:signup_as] = params[:as]
    redirect_to new_user_registration_path
  end
end
