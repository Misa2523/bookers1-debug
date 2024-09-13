class BooksController < ApplicationController
  def top
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      flash[:notice] = "You failed to post."
      @books = Book.all  #indexページを描画するため、indexページで使う変数を再定義
      @book = Book.new
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)  #「何をどう更新するか」を指定するために()で引数が必要。
                                  # ここにストロングパラメータのbook_paramsを渡すことで、フォームから送られてきた内容で更新するという機能を実現
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
