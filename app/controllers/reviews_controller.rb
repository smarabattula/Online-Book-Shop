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
          flash.now[:notice] = "No user found!"
          render :index and return
        end
      end

      if params[:book_name].present?
        @book = Book.find_by(Name: params[:book_name])
        if @book
          @reviews = @reviews.where(book_id: @book.id)
        else
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
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url, notice: "Review was successfully destroyed." }
      format.json { head :no_content }
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
