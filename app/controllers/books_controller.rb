class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    @books = Book.all
  end

  def filter
    @books = Book.all
    if params[:author].present?
      @books = @books.where(author: params[:author])
    end
    if params[:rating].present?
      @books = @books.select {|book| book.reviews.average(:Rating) >= params[:rating].to_f }
    end
    if @books.empty?
      flash.now[:notice] = "No books found."
    end
    render :index
  end
  # GET /books/1 or /books/1.json
  def show
    @book = Book.find(params[:id])
    @average_rating = @book.reviews.average(:rating)
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # Rating is 0 ~ 10
  def high_rating
    high_rating_book_ids = Review.group(:books_id).average("Rating").select do |item,val|
      val > 7
    end
    @high_rating_books = Book.where(id: high_rating_book_ids.keys)
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:book_id,:Name, :Author, :Publisher, :Price, :Stock)
    end
end
