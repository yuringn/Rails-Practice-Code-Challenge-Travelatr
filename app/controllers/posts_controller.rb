class PostsController < ApplicationController
    # before_action :find_post only: [:show, :edit, :add_like]
    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def create
        @post = Post.create(post_params)
        if @post.valid?
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to new_post_path
        end
    end

    def edit
        find_post
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def update
        find_post
        if @post.update(post_params)
            redirect_to post_path(@post.id)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to edit_post_path(@post.id)
        end
    end

    def add_like
        @post = Post.find(params[:id])
        @post.add_like
        @post.save
    
        redirect_to post_path(@post.id)
    end

    private
    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end

    def find_post
        @post = Post.find(params[:id])
    end
end