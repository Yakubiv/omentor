# frozen_string_literal: true

class BlogsController < ApplicationController
  layout 'blog'

  def index
    @blog_posts = BlogPost.includes(:tags)
  end

  def show
    @blog_post = BlogPost.includes(:tags).friendly.find(params[:id])
    impressionist(@blog_post, unique: :session_hash)
  end
end
