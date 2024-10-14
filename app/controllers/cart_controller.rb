class CartController < ApplicationController
    def update
        song = Song.find(params[:song_id])
        flash[:notice] = "You now have 1 copy of #{song.title} in your cart."
        redirect_to '/songs'
    end
end