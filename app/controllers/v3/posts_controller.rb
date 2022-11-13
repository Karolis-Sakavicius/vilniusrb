module V3
  class PostsController < ApplicationController
    def index
      @posts = Post.order(created_at: :desc)
    end

    def new
      @posts = Post.order(created_at: :desc)
    end

    def show
      @post = Post.find(params[:id])

      render @post
    end

    def create
      @post = Post.new(post_params.merge(participant: @current_user))

      if @post.save
        redirect_to '/v3/posts'
      else
        render '/v3/posts/new', status: :unprocessable_entity
      end
    end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])

      if @post.update(post_params)
        render @post
      else
        render '/v3/posts/edit', status: :unprocessable_entity
      end
    end

    def destroy
      @post = Post.find(params[:id]).destroy!

      respond_to do |format|
        format.turbo_stream
      end
    end

    private

    def post_params
      params.permit(:text)
    end
  end
end