class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  # GET /stores
  # GET /stores.json
  def index
    @q = Store.ransack(params[:q])
    @stores = @q.result(distinct: true).where(user_id: current_user.id).order(:order)
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
  end

  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Store.new(store_params)
    @store.user_id = current_user.id

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: t('create.notice', name: t('activerecord.models.store')) }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: t('update.notice', name: t('activerecord.models.store')) }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stores_url, notice: t('destroy.notice', name: t('activerecord.models.store')) }
      format.json { head :no_content }
    end
  end

  # GET /last_store
  def last_store
    @store_id = Store
      .joins(logs: :sub_category)
      .where(stores: {user_id: current_user.id}, sub_categories: {id: params[:sub_category_id]})
      .order("logged_at desc")
      .select("stores.id")
      .first
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.where(user_id: current_user.id, id: params[:id]).first
      routing_error if @store.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:user_id, :name, :tel, :address, :is_disabled, :order, :lat, :lng)
    end
end
