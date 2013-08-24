class PlayersController < ApplicationController

	def index
		@players = Player.find_all_by_pool_id(params[:pool_id])
	end

	def new
	end

	def show
		@player = Player.find_by_id(params[:id])
		@pool = Pool.find_by_id(params[:pool_id])
		@game = Game.find_by_id(params[:game_id], :include => [{ :pools => :user }])
	end

	def create
		@game = Game.find(params[:game_id])
		@pool = Pool.find_by_id(params[:pool_id])
		@player = @pool.players.build(params[:player])
		@player.user_id = current_user.id
		@player.bet = @pool.buy_in
		if @player.save
			@buy_in = @pool.buy_in
			@player_credits = Credit.find_all_by_user_id(current_user)
			@player_credit = @player_credits.first
			@player_credit.user_id = nil
			@player_credit.pool_id = @pool.id
			@player_credit.save
			flash[:success] = "You are now a member of this pool"
			redirect_to game_pool_path(@game,@pool)
		else
			flash[:notice] = "Sorry you were unable to join the pool"
			render 'static_pages/home' #this will change
		end
	end

	def payout
		@game = Game.find(params[:game_id])
		@player = Player.find_by_id(params[:id])
		@user = @player.user_id
		@pool = Pool.find_all_by_id(params[:pool_id])
		@credits = Credit.find_all_by_pool_id(@pool)
		@pay_one_credit = @credits.first
		@pay_one_credit.user_id = @user
		@pay_one_credit.pool_id = nil
		if @pay_one_credit.save
			@player.destroy
			flash[:success] = "Credit Paid Out"
			redirect_to game_pool_path(@game,@pool)
		else
			flash[:notice] = "Credit not Paid Out"
			redirect_to game_pool_path(@game,@pool)	
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

end