class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]

  # GET /reviews or /reviews.json
  def index
    @reviews = Review.all
  end

  def filter
      @reviews = Review.all
      if params[:username].present?
        @user = User.find_by(username: params[:username])
        if @user
          @reviews = @reviews.where(user_id: @user.id)
        else
          @reviews = Review.where(user_id: -1)
          flash.now[:notice] = "No user found!"
          render :index and return
        end
      end

      if params[:book_name].present?
        @book = Book.find_by(Name: params[:book_name])
        if @book
          @reviews = @reviews.where(book_id: @book.id)
        else
          @reviews = Review.where(user_id: -1)
          flash.now[:notice] = "No such books found!"
          render :index and return
        end
      end
      if @reviews.empty?
        flash.now[:notice] = "No reviews found."
      else
        render :index
      end
    end

  # GET /reviews/1 or /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
    if current_user == @review.user or current_user.is_admin?
      @review = Review.find(params[:id])
      @book = @review.book
    else
      flash.now[:notice] = "You are not authorized to edit this review."
    end
  end

  # POST /reviews or /reviews.json
  def create
    @book = Book.find(review_params[:book_id])
    @review = @book.reviews.create(review_params)
    @review.user = current_user
    respond_to do |format|
      if @review.save
        format.html { redirect_to review_url(@review), notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to review_url(@review), notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    if current_user == @review.user or current_user.is_admin?# check if current user is the author of the review
      @review.destroy
      respond_to do |format|
        format.html { redirect_to reviews_url, notice: "Review was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to reviews_url, alert: "You are not authorized to delete this review." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:user_id, :book_id, :Rating, :Review)
    end
end
