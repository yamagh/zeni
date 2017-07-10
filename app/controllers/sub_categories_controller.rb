class SubCategoriesController < ApplicationController
  before_action :set_sub_category, only: [:show, :edit, :update, :destroy]

  # GET /sub_categories
  # GET /sub_categories.json
  def index
    @sub_categories = SubCategory.all
  end

  # GET /sub_categories/1
  # GET /sub_categories/1.json
  def show
  end

  # GET /sub_categories/new
  def new
    @sub_category = SubCategory.new
    @category = Category.find(params[:category_id])
  end

  # GET /sub_categories/1/edit
  def edit
  end

  # POST /sub_categories
  # POST /sub_categories.json
  def create
    @sub_category = SubCategory.new(sub_category_params)
    @sub_category.category_id = params[:category_id]

    respond_to do |format|
      if @sub_category.save
        format.html { redirect_to category_path(params[:category_id]), notice: t('create.notice', name: t('activerecord.models.sub_category')) }
        format.json { render :show, status: :created, location: @sub_category }
      else
        format.html { render :new }
        format.json { render json: @sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_categories/1
  # PATCH/PUT /sub_categories/1.json
  def update
    respond_to do |format|
      if @sub_category.update(sub_category_params)
        format.html { redirect_to @category, notice: t('update.notice', name: t('activerecord.models.sub_category')) }
        format.json { render :show, status: :ok, location: @sub_category }
      else
        format.html { render :edit }
        format.json { render json: @sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_categories/1
  # DELETE /sub_categories/1.json
  def destroy
    @sub_category.destroy
    respond_to do |format|
      format.html { redirect_to category_path(@category), notice: t('destroy.notice', name: t('activerecord.models.sub_category')) }
      format.json { head :no_content }
    end
  end

  def sub_categories
    @sub_categories = SubCategory.where(category_id: params[:category_id]).order(:order).map{|e|[e.name_with_order, e.id]}
    @selected = SubCategory
      .includes(:category, :logs)
      .where(logs: {user_id: current_user.id}, categories: {user_id: current_user.id}, category_id: params[:category_id])
      .order("logged_at desc")
      .first
      .id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_category
      @category     = Category.find(params[:category_id])
      @sub_category = SubCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_category_params
      params.require(:sub_category).permit(:category_id, :name, :is_disabled, :order)
    end
end
