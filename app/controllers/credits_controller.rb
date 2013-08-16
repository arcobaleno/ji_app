class CreditsController < ApplicationController

	def index
		@credits = Credit.paginate(page: params[:page]).includes(:user)
	end

	def new
		@credit = Credit.new
	end

	def create
		@credit = Credit.new(params[:credit])
		if @credit.save
			flash[:success] = "Credit Created!"
			redirect_to root_path
		else
			flash[:error] = "Credit Not Created!"
			redirect_to root_path
		end
	end

	def edit
		@credit = Credit.find(params[:id])
	end

	def update
		@credit = Credit.find(params[:id])
		if @credit.update_attributes(params[:credit])
	        flash[:success] = "Credit Info Updated!"
	        redirect_to root_path
	    else
	        render 'edit'
	    end
	end

	def show
		@credit = Credit.find(params[:id])
		@owner = User.find_by_id(@credit.user_id)
	end

	def destroy
		Credit.find(params[:id]).destroy
    	flash[:success] = "Credit Deleted!"
    	redirect_to root_path
	end
end