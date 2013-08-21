class RedeemCreditsController < ApplicationController

	def index
		@credits = Credit.search(params[:search])
		@credit_redeemed = @credits.first
		@credit_redeemed.user_id = current_user.id
		@credit_redeemed.save
		flash[:success] = "Credit Redeemed"
		redirect_to current_user
	end

end