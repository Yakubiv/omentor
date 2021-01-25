class Admin::SubscribersController < Admin::BaseController
  def index
    @pagy, @subscribers = pagy(NewsSubscriber.all, items: 15)
  end

  def edit
    @subscriber = NewsSubscriber.find(params[:id])
  end

  def update
    @subscriber = NewsSubscriber.find(params[:id])
    if @subscriber.update(subscriber_params)
      redirect_to admin_subscribers_path, notice: 'Has been updated'
    else
      render :edit
    end
  end

  def destory
    @subscriber = NewsSubscriber.find(params[:id])
    @subscriber.destroy

    redirect_to admin_subscribers_path, notice: 'Has been deleted'
  end

  private

  def subscriber_params
    params.require(:news_subscriber).permit(:email, :active)
  end
end