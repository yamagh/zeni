class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.where(user_id: current_user.id).order(:order)
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @sub_categories = SubCategory.where(category_id: params[:id]).order(:order)
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: t('create.notice', name: t('activerecord.models.category')) }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: t('update.notice', name: t('activerecord.models.category')) }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: t('destroy.notice', name: t('activerecord.models.category')) }
      format.json { head :no_content }
    end
  end

  def categories
    @categories = Category.where(user_id: current_user.id).order(:order).map{|e|[e.name_with_order, e.id]}
    @selected = Category
      .includes(sub_categories: :logs)
      .where(user_id: current_user.id, logs: {account_id: params[:account_id]})
      .order('logged_at desc')
      .first
      .id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      return render template: 'errors/400.html.slim', status: :bad_request unless valid_request?
      @category = Category.where(user_id: current_user.id, id: params[:id]).first
      routing_error if @category.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:user_id, :name, :is_disabled, :order)
    end

    def valid_request?
      current_user.id == Category.find(params[:id]).user_id
    end
end
