class WelcomeController < ApplicationController

  fin_year = "28-03"
  chk_date = Date.today.strftime("%d-%m") 
  if fin_year == chk_date
    puts"xxxxxx"
  end

  def index
     
  end

  def my_users
  	@users = User.where("is_admin =?",0)
  	#@users = User.joins(:leavelog).where("is_admin = 0 and leavelogs.user_id" => user.id)

  	puts"vvvvvvvvvvv",@users.inspect
  end

  def my_user_leaves
  	@leavelogs = Leavelog.includes(:user).all

  	puts"llllllllllllllllllllllllllll",@leavelogs.inspect
  	
  end

  def leave_accept
    @leavelog_approve = Leavelog.find(params[:id])
    @user = @leavelog_approve.user
    UserMailer.leave_accept(@user,@leavelog_approve).deliver_now
    @leavelog_approve.update(:status=>"Approved")
    redirect_to "/my_user_leaves"
  end

  def leave_reject
    @leavelog_reject = Leavelog.find(params[:id])
    @user = @leavelog_reject.user
    UserMailer.leave_reject(@user,@leavelog_reject).deliver_now
    @leavelog_reject.update(:status=>"Rejected")
    redirect_to "/my_user_leaves"
  end

 
end
