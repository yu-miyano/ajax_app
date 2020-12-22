class PostsController < ApplicationController

  def index  # indexアクションを定義した
    @posts = Post.all.order(id: "DESC") # すべてのレコードを@postsに代入
  end

  def create
    post = Post.create(content: params[:content], checked: false) #メモ作成時に未読の情報を保存するようにした
    render json:{ post: post } # レスポンスをJSONに変更した
  end

  def checked
    post = Post.find(params[:id])
    if post.checked
      post.update(checked: false)
    else
      post.update(checked: true)
    end
    item = Post.find(params[:id])
    render json: { post: item }
  end
end



