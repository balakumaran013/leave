class LeavelogsController < ApplicationController
  before_action :set_leavelog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /leavelogs
  # GET /leavelogs.json
  def index
    @leavelogs = Leavelog.where(user_id: current_user.id)
  end

  # GET /leavelogs/1
  # GET /leavelogs/1.json
  def show
  end

  # GET /leavelogs/new
  def new
    @leavelog = Leavelog.new
  end

  # GET /leavelogs/1/edit
  def edit
  end

  # POST /leavelogs
  # POST /leavelogs.json
  def create
    @leavelog = Leavelog.new(leavelog_params)
    @user = @leavelog.user
    UserMailer.apply_leave_email(@user,@leavelog).deliver_now
    respond_to do |format|
      if @leavelog.save
        format.html {redirect_to "/leavelogs"}
        #format.html { redirect_to @leavelog, notice: 'Leavelog was successfully created.' }
        #format.json { render :show, status: :created, location: @leavelog }
      else
        format.html { render :new }
        format.json { render json: @leavelog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leavelogs/1
  # PATCH/PUT /leavelogs/1.json
  def update
    respond_to do |format|
      if @leavelog.update(leavelog_params)
        format.html { redirect_to @leavelog, notice: 'Leavelog was successfully updated.' }
        format.json { render :show, status: :ok, location: @leavelog }
      else
        format.html { render :edit }
        format.json { render json: @leavelog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leavelogs/1
  # DELETE /leavelogs/1.json
  def destroy
    @leavelog.destroy
    respond_to do |format|
      format.html { redirect_to leavelogs_url, notice: 'Leavelog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leavelog
      @leavelog = Leavelog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leavelog_params
      params.require(:leavelog).permit(:reason_for_leave, :status, :leave_date_from, :leave_date_to,:user_id).merge(user: current_user)
    end
end
