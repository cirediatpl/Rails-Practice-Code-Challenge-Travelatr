class PostsController < ApplicationController

    def show
        if params[:like]
            find_post
            @post.like
            @post.save
        else
            find_post
        end
    end

    def new
        @post = Post.new
        all_destinations_all_bloggers
    end

    def create
        @post = Post.create(post_params)
        if @post.valid?
            redirect_to posts_path
        else
            flash.now[:error] = @post.errors.full_messages
            all_destinations_all_bloggers
            render :new
        end
    end

    def edit
        find_post
        all_destinations_all_bloggers
    end

    def update
        find_post
        @post.update(post_params)
        if @post.valid?
            redirect_to post_path(@post)
        else
            flash.now[:error] = @post.error.full_messages
            all_destinations_all_bloggers
            render :edit
        end
    end

    def like
        @post = Post.find(params[:post_id])
        @post.like
        redirect_to post_path(@post)
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end

    def find_post
        @post = Post.find(params[:id])
    end

    def all_destinations_all_bloggers
        @destinations = Destination.all
        @bloggers = Blogger.all
    end

end