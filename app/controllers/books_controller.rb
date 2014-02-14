class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all.order(:universe_id)
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Your book has been added!"
      redirect_to books_path
    else
      flash[:notice] = "There was problem and your book wasn't added."
      render action: "new"
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @book.update_attributes(book_params)
        format.html { redirect_to @book, notice: "The book has been edited." }
      else
        format.html { render action: "edit", notice: "Sorry, there was a problem, and the book wasn't updated." }
      end
    end
  end

  def destroy
    if @book.destroy
      flash[:notice] = "The book has been deleted."
      redirect_to books_path
    else
      flash[:notice] = "Sorry, book couldn't be deleted."
      render action: "show"
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :publisher, :published_date, :coauthors, :cover)
  end
end