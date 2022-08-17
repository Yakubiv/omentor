class SubscriptionsController < ApplicationController
  def create
    NewsSubscriber.create(subscriber_params)
    respond_to do |format|
      format.js
    end
  end

  private

  def subscriber_params
    params.require(:news_subscriber).permit(:email)
  end
end
