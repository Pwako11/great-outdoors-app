class ReviewsController < ApplicationController
    
    def index
        if params[:user_id]
            @user = User.find(params[:user_id])
            @reviews = @user.reviews 
        else
            @reviews = Review.all 
        end 
    end

    def show
        @review = Review.find(params[:id])
    end 

    def new 
        @review = Review.new(user_id: params[:user_id])
    end 

    def edit
        @review = Review.find(params[:id])
        if current_user.id == @review.user_id
            edit_review_path(@review)
        else 
            redirect_to review_path(@review), notice: 'Only review owners can edit reviews'
        end 
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
            if @review.user === current_user
               @review.destroy
               redirect_to reviews_path, notice: 'Review was successfully destroyed'
            else
                redirect_to review_path(@review), notice: 'Only review owners can delete reviews'
            end 
    end 

    private 

    def review_params
        params.require(:review).permit(:title, :rating, :content, :user_id, :park_id )
    end 
end
