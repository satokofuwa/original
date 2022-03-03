class PostsController < ApplicationController

    before_action :set_post, only: [:show, :edit, :update, :destroy] 
    def index
      @posts=Post.all
    end
  
    def new
      @post=Post.new
    end
    
    def create
      @post=Post.new(post_params)
      if params[:back]
        render :edit
      else
        if @post.save
          redirect_to new_post_path,notice:"ブログを作成しました！"
        else
  
           #入力フォームを歳描画します。
           render :new 
        end
      end
    end
  
    def show
    
      
    end
  
    def edit
      @post = Post.find(params[:id])
    end
  
    def update
       if 
        params[:back]
        render :edit
        else
        @post.update(post_params)
        redirect_to posts_path, notice:"ブログを編集しました!"
      end
    end
  
    def destroy
     
      @post.destroy
      redirect_to posts_path, notice:"ブログを削除しました！"
    end
  
    def confirm
      @post=Post.new(post_params)
      @post.id =params[:id]
      render :new if @post.invalid?
    end
  
     private
  
     def post_params
      params.require(:post).permit(:id,:content)
     end
   
      def set_post
        @post=Post.find(params[:id])
      end
  end