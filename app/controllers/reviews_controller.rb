class ReviewsController < ApplicationController
    def create
        #render plain: params
        @movie = Movie.find(params[:movie_id])
        @review = @movie.reviews.create(review_params)
        
        respond_to do |format|
          if @review.save
            format.html { redirect_to movie_path(@movie), notice: 'Review was successfully created.' }
            format.json { render :show, status: :created, location: @movie }
          else
            format.html { redirect_to movie_path(@movie), notice: 'Your review prohibited from being saved : check for name or score(0~5)' }
            format.json { render json: @review.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        @movie = Movie.find(params[:movie_id]) 
        @review = @movie.reviews.find(params[:id]) 
        @review.destroy
        redirect_to movie_path(@movie)
    end

private
    def review_params
        params.require(:review).permit(:reviewer, :body, :score) 
    end    
end
