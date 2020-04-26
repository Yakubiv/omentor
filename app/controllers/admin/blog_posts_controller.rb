class Admin::BlogPostsController < Admin::BaseController
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = BlogPost.all
  end

  def new
    @post = BlogPost.new
  end

  def edit
  end

  def create
    @post = current_user.blog_posts.new(post_params)
    if @post.save
      redirect_to %i[admin blog_posts], notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to admin_blog_posts_url, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_blog_posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  def meta_tags
    params[:meta_tags]&.split(',')
  end

  def set_post
    @post = BlogPost.friendly.find(params[:id])
  end

  def post_params
    params.require(:blog_post).permit(:title, :description, :category,
                                      :status, :meta_description, :meta_title,
                                      :popular, :publish_at, :top, :slug,
                                      :body, :thumbnail, :tag_list)
                               .merge(meta_tags: meta_tags)
  end
end
