class ListingsController < ApplicationController
	before_action :find_listing, only: [:show, :edit, :update, :destroy, :upvote]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@listing = Listing.all.order("created_at DESC")
	end

	def show
	end

	def new
		@listing = current_user.listings.build
	end

	def create
		@listing = current_user.listings.build(listing_params)

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

	def upvote
		@listing.upvote_by current_user
		redirect_to :back
	end

	private

	def listing_params
		params.require(:listing).permit(:title, :description, :image)
	end

	def find_listing
		@listing = Listing.find(params[:id])
	end

end
