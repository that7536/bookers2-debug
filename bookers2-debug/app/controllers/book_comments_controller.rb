class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    comment = BookComment.new(book_comment_params)
    comment.user_id = current_user.id
    comment.book_id = @book.id
    @book_comment = BookComment.new
    if comment.save
      #redirect_to book_path(@book)
    else
      @book_new = Book.new
      @user = @book.user
      render 'books/show'
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    BookComment.find_by(id: params[:id],book_id: params[:book_id]).destroy
    #redirect_to book_path(params[:book_id])
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
