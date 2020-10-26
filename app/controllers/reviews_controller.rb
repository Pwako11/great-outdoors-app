class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
    end

    def show
        @review = Review.find(params[:id])
        @rating = @review.rating
    end 

    def new 
        @review = Review.new
    end 

    def edit
        @review = Review.find(params[:id])
    end 

    def create
        @review = Review.new(review_params)
          if @review.save
            redirect_to @review, notice: 'Review was successfully created.' 
          else
            render :new 
          end
    end 

    def update
        @review = Review.find_by_id(params[:id])
        if @review.update(review_params)
            redirect_to review_path(@review), notice: 'Review was successfully updated.'
          else
            render :edit
          end
    end

    def destroy 
        @review = Review.find(params[:id])
        @review.destroy
        # redirect_to review_path(@review), notice: 'Post was successfully destroyed.'
    end 

    private 


    def review_params
        params.require(:review).permit(:rating, :content, :park_id, :user_id, :amenity_ids=>[])
    end 
end
