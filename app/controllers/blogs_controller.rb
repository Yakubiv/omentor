# frozen_string_literal: true

class BlogsController < ApplicationController
  layout 'blog'

  def index
    @pagy, @blog_posts = pagy(BlogPost.includes(:tags), items: 10)
  end

  def show
    @blog_post = BlogPost.includes(:tags).friendly.find(params[:id])
    impressionist(@blog_post, unique: :session_hash)
  end
end
