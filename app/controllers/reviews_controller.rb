class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user! , only: [:edit, :update, :destroy, :new, :create, :show, :index]
  before_filter :is_admin? , only: [:edit, :update, :destroy, :new, :show, :index]

  def index
    @reviews = Review.all
  end

  def is_admin?
    if current_user.admin?
      true
    else
      redirect_to :products, alert: 'Sorry, du musst Admin sein um das zu tun!'
    end
  end

  def show
  end

  def new
    @review = Review.new
    @review =
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @product = Product.find(@review.product_id)

    puts "debugstart"
    puts @review.to_json
    puts "debugende"
    respond_to do |format|
      if @review.save
        format.html { redirect_to @product, notice: 'Bewertung erfolgreich erstellt!' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { redirect_to @product, alert: 'Eine Bewertung muss einen Text enthalten und die Noten dürfen nur zwischen 1 und 6 sein!' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Bewertung wurde erfolgreich aktualisiert.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Bewertung wurde erfolgreich gelöscht.' }
      format.json { head :no_content }
    end
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:username, :description, :grade, :product_id)
    end
end
