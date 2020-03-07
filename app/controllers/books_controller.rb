class BooksController < ApplicationController
  def show
  	@book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    @new_book = Book.new
  end

  def index
    @book = Book.new
  	@user = User.find(current_user.id)
  	@books = Book.all
  end

  def edit
  	@user = User.find(current_user.id)
  	@book = Book.find(params[:id])
  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	if @book.save
      flash[:notice] = "You have creatad book successfully."
     	redirect_to book_path(@book.id)
    else
      render "index"
    end
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render "index"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = "You have destroyed book successfully."
      redirect_to books_path
    else
      render "index"
    end
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
