class TransactionsController < ApplicationController
  before_action :set_transaction,:authorized, only: %i[ show edit update destroy ]
  # GET /transactions or /transactions.json
  def index
    if current_user.is_admin?
      @transactions = Transaction.all
    else
     # @transactions = Transaction.where(user_id: current_user.id)
     @transactions = current_user.transactions
    end
  end

  # GET /transactions/1 or /transactions/1.json
  def show
    @transaction = Transaction.find(params[:id])
    if !current_user.is_admin? and current_user.id != @transaction.user.id
      flash.now[:notice] = "Cannot access other user's transactions!"
    end
  end
  # GET /transactions/new
  def new
    @transaction = Transaction.new

    if @book.nil?
      @book = Book.find(params[:book_id])
    end
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions or /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    @book = Book.find(params[:transaction][:book_id])
    @book.with_lock do
      @transaction.transaction_number = Array.new(10){[*"A".."Z", *"0".."9"].sample}.join
      @transaction.user_id = current_user.id
      @book.update(Stock: @book.Stock - @transaction.quantity)
    end

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to transaction_url(@transaction), notice: "Transaction was successfully created." }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to transaction_url(@transaction), notice: "Transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to transactions_url, notice: "Transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:book_id, :user_id, :credit_card_number,:address, :phone_number, :quantity, :total_price)
    end
end
