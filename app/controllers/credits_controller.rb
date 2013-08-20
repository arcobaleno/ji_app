class CreditsController < ApplicationController
	helper_method :sort_column, :sort_direction

	def index
		@credits = Credit.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
	end

	def new
		@credit = Credit.new
	end

	def create
		@credit = Credit.new(params[:credit])
		if @credit.save
			flash[:success] = "Credit Created!"
			redirect_to credits_path
		else
			flash[:error] = "Credit Not Created!"
			redirect_to credits_path
		end
	end

	def edit
		@credit = Credit.find(params[:id])
	end

	def update
		@credit = Credit.find_by_credit_code(@credit_code)
		@credit.user_id = current_user.user_id
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
    	redirect_to credits_path
	end

	private

	def sort_column
		params[:sort] || "id"
	end

	def sort_direction
		params[:direction] || "asc"
	end
end