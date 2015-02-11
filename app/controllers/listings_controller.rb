class ListingsController < ApplicationController
	before_action :find_listing, only: [:show, :edit, :update, :destroy, :upvote]

	def index
		@listing = Listing.all.order("created_at DESC")
	end

	def show
	end

	def new
		@listing = Listing.new
	end

	def create
		@listing = Listing.new(listing_params)

		if @listing.save
			redirect_to @listing, notice: "Successfully created new Listing"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @listing.update(listing_params)
			redirect_to @listing, notice: "Listing was Successfully updated!"
		else
			render 'edit'
		end
	end

	def destroy
		@listing.destroy
		redirect_to root_path
	end

	private

	def listing_params
		params.require(:listing).permit(:title, :description)
	end

	def find_listing
		@listing = Listing.find(params[:id])
	end

end
