class PrizesController < ApplicationController

	def index
		@prizes_available = Prize.find_all_by_redeemed(0)
		@prizes_redeemed = Prize.find_all_by_redeemed(1)
	end

	def new
		@prize = Prize.new
	end

	def create
		@prize = current_user.prizes.build(params[:prize])
		if @prize.save
			flash[:success] = "Prize Added"
			redirect_to prizes_path
		else
			flash[:error] = "Prize not Added"
			redirect_to prizes_path
		end
	end

	def show
		@prize = Prize.find_by_id(params[:id])
	end

	def redeem_prize
		@credits = Credit.find_all_by_user_id(current_user)
		@credit = @credits.first
		@banker = User.find_by_user_type(3)
		@credit.user_id = @banker.id
		@prize = Prize.find(params[:id])
		@prize.user_id = current_user.id
		@prize.redeemed = 1
		if @credit.save && @prize.save
			flash[:success] = "Prize Redeemed!"
			redirect_to prizes_path
		else
			flash[:error] = "Prize not Redeemed!"
			redirect_to prizes_path
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

end