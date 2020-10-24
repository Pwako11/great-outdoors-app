class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
    end

    def show
        @review = Review.find(params[:id])
        @rating = @review.rating
    end 

    def new 
        @reviews = Review.new
    end 

    def edit
    end 

    def create
        #raise params.inspect
        @review = Review.new(review_params)

        #respond_to do |format|
          if @review.save
            redirect_to @review, notice: 'Review was successfully created.' 
          else
            render :new 
          end
        #end
    end 


    def update

    end

    def destroy 

    end 

    private 


    def review_params
        params.require(:review).permit(:rating, :content, :park_id, :user_id)
    end 
end
