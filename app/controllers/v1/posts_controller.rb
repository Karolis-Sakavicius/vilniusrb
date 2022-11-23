module V1
  class PostsController < ApplicationController
    before_action :load_post, only: %i[edit update destroy]
    before_action :check_ownership, only: %i[update destroy]

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
    end

    def update
      if @post.update(post_params)
        redirect_to '/v1/posts'
      else
        render '/v1/posts/edit', status: :unprocessable_entity
      end
    end

    def destroy
      @post.destroy!

      redirect_to '/v1/posts'
    end

    private

    def post_params
      params.permit(:text)
    end

    def load_post
      @post = Post.find(params[:id])
    end

    def check_ownership
      if @post.participant != @current_user
        head :forbidden
      end
    end
  end
end
