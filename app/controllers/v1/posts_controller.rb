module V1
  class PostsController < ApplicationController
    def index
      @posts = Post.order(created_at: :desc)
    end

    def new
      @posts = Post.order(created_at: :desc)
    end

    def create
      @post = Post.new(post_params.merge(participant: @current_user))

      if @post.save
        redirect_to '/v1/posts'
      else
        render '/v1/posts/new', status: :unprocessable_entity
      end
    end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])

      if @post.update(post_params)
        redirect_to '/v1/posts'
      else
        render '/v1/posts/edit', status: :unprocessable_entity
      end
    end

    def destroy
      @post = Post.find(params[:id]).destroy!

      redirect_to '/v1/posts'
    end

    private

    def post_params
      params.permit(:text)
    end
  end
end
