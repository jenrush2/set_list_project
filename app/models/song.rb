class Song < ApplicationRecord
    belongs_to :artist
    has_many :playlist_songs
    has_many :playlists, through: :playlist_songs 
    

    def self.song_count
        all.count
    end

    def self.by_title
        order(:title)
    end

    def self.search_title(word)

        where("title like '%#{word}%'")
    end

    def self.shortest(amount)
        order(length: :asc).limit(amount)
    end

    #see spec/models/song_spec.rb for info on 
    #error with with method/test
    
    # def self.special(sp_length)
    #     where("length > #{sp_length}")
    # end

    def artist_name
        artist.name
    end

end