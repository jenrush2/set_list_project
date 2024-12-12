class SongsController < ApplicationController
    def index
        @songs = Song.all
    end

    def show
        @song = Song.find(params[:id])
    end

    def new
        @song = Song.new
    end

    def create
        Song.create!(song_params)
        redirect_to songs_path
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.find(params[:id])
        if @song.update(song_params)
            redirect_to '/songs'
        else
            flash[:notice] = "Song not updated: Required information missing."
            render :edit
        end
    end



    private
    def song_params
        params.require(:song).permit(:title, :length, :play_count, :artist_id)
    end
end
