class ReviewsController < ApplicationController
  def create
    book = Book.find review_params[:book_id]
    review = Review.new review_params.except(:book_id)
    if review.save
      book.reviews << review
      current_user.reviews << review
    else
      flash[:error] = 'Something wrong with your review'
    end
    redirect_to books_path(book)
  end

  private

  def review_params
    params.permit(:book_id, :rating, :comment)
  end
end
