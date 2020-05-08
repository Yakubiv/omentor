class SubscriptionsController < ApplicationController
  def create
    NewsSubscriber.create(subscriber_params)
  end

  private

  def subscriber_params
    params.require(:news_subscriber).permit(:email)
  end
end
