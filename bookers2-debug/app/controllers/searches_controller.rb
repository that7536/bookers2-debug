class SearchesController < ApplicationController

  def search
    @model = params["model"]#選択したmodelを代入
    @content = params["content"]#選択した検索方法を代入
    @method = params["method"]#検索ワードを代入
    @records = search_for(@model, @content, @method)
  end

  private
  def search_for(model, content, method)
    if model == 'user'
      if method == 'perfect'
        User.where(name: content)
      elsif method == 'forward'
        User.where('name LIKE ?', content+'%' )
      elsif method == 'backward'
        User.where('name LIKE ?', '%'+content )
      else
        User.where('name LIKE ?', '%'+content+'%' )
      end
    elsif model == 'book'
      if method == 'perfect'
        Book.where(title: content)
      elsif method == 'forward'
        Book.where('title LIKE ?', content+'%' )
      elsif method == 'backward'
        Book.where('title LIKE ?', '%'+content )
      else
        Book.where('title LIKE ?', '%'+content+'%' )
      end
    end
  end
end
