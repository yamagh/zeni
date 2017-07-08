class LogsController < ApplicationController
  before_action :set_log, only: [:show, :edit, :update, :destroy]

  # GET /logs
  # GET /logs.json
  def index
    @q = Log.ransack(params[:q])
    @logs = @q.result(distinct: true)
              .includes([sub_category: :category], :store)
              .where(user_id: current_user.id)
              .order(logged_at: :desc)
              .page(params[:page])
              .per(50)
    @accounts       = Account.where(user_id: current_user.id).order(:order)
    @categories     = Category.where(user_id: current_user.id).order(:order)
    @sub_categories = SubCategory.includes(:category).where(categories: {user_id: current_user.id}).order(:order)
    @stores         = Store.where(user_id: current_user.id).order(:order)
  end

  # GET /logs/1
  # GET /logs/1.json
  def show
  end

  # GET /logs/new
  def new
    @log = Log.new(logged_at: DateTime.now)
    @categories = Category.where(user_id: current_user.id).order(:order)
  end

  # GET /logs/1/edit
  def edit
  end

  # POST /logs
  # POST /logs.json
  def create
    @log = Log.new(log_params)
    @log.user_id = current_user.id

    respond_to do |format|
      if @log.save
        format.html { redirect_to @log, notice: t('create.notice', name: t('activerecord.models.log')) }
        format.json { render :show, status: :created, location: @log }
      else
        format.html { render :new }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logs/1
  # PATCH/PUT /logs/1.json
  def update
    respond_to do |format|
      if @log.update(log_params)
        format.html { redirect_to @log, notice: t('update.notice', name: t('activerecord.models.log')) }
        format.json { render :show, status: :ok, location: @log }
      else
        format.html { render :edit }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logs/1
  # DELETE /logs/1.json
  def destroy
    @log.destroy
    respond_to do |format|
      format.html { redirect_to logs_url, notice: t('destroy.notice', name: t('activerecord.models.log')) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def log_params
      params.require(:log).permit(:user_id, :logged_at, :ammount, :is_expence, :account_id, :sub_category_id, :store_id, :item, :memo)
    end
end
