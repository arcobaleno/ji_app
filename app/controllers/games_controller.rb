class GamesController < ApplicationController

	def index
		@games = Game.paginate(page: params[:page])
	end

	def new
		@game = Game.new
	end

	def show
		@game = Game.find_by_id(params[:id])
	end

	def create
		@game = current_user.games.build(params[:game])
		if @game.save
			flash[:success] = "Game created!"
			redirect_to games_path
		else
			flash[:notice] = "Game Not Created"
			redirect_to games_path
		end
	end

	def edit
		@game = Game.find_by_id(params[:id])
	end

	def update
		@game = Game.find_by_id(params[:id])
		if @game.update_attributes(params[:game])
        	flash[:success] = "Game updated"
        	redirect_to games_path
    	else
    		flash[:success] = "Sorry Game not updated"
    		redirect_to games_path
		end
	end

	def destroy
		@game.destroy
		redirect_to root_path
	end

end