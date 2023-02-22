class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    # If the current user is an admin, show all the users, else flash a notice message
    if current_user.is_admin?
      @users = User.all
    else
      flash[:notice] = "You aren't authorized to view the users index page"
    end
  end

  # GET /users/1 or /users/1.json
  def show
    # If the current user is an admin or the requested user is the same as the current user, show the user details
    # Otherwise, flash a notice message
    if current_user.is_admin? or current_user.id == params[:id].to_i
      @user = User.find(params[:id])

      respond_to do |format|
        format.html
        format.json { render json: @user}
      end
    else
      flash[:notice] = "You aren't authorized to view this user's page"
    end
  end

  # GET /users/new
  def new
    # If the current user is nil or an admin, create a new user, otherwise flash a notice message
    if current_user.nil?
      @user = User.new
    elsif current_user.is_admin?
      @user = User.new
    else
      flash[:notice] = "You aren't authorized to create new user"
    end
  end

  # GET /users/1/edit
  def edit
    #Only edit if current user is admin or id matches with URL's id parameter
    if current_user.is_admin? or current_user.id == params[:id].to_i
      @user = User.find(params[:id])
    else
      flash[:notice] = "You aren't authorized to edit other users"
      redirect_to root_url
    end
  end

  # POST /users or /users.json
  def create
    # Create a new user with the parameters given in the user_params method
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    @user = User.find(params[:id])
    # Respond to the format of the request (HTML or JSON) and redirect or render the appropriate view
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :name, :email, :address, :credit_card_number, :phone_number, :is_admin)
    end
end
