class BooksController < ApplicationController

  before_action only: :create do
    redirect_to book_new_path, error: 'No cover image added' unless book_params[:cover]
  end

  def show
    @book ||= Book.find(params[:id])
  end

  def new
    @book ||= Book.new
  end

  def create
    book = Book.new(book_params)
    return redirect_to(books_path(book)) if book.save
    redirect_to book_new_path, error: 'Something went wrong during upload'
  end

  def destroy
  end

  private

  def book_params
    @book_params ||= params.require(:book)
                           .permit(:author, :title, :description, :cover)
  end
end
