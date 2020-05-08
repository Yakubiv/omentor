class Admin::SubscribersController < Admin::BaseController
  def index
    @subscribers = NewsSubscriber.all
  end
end