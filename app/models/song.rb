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

    def self.special(sp_length)
        three_days_ago = Time.now - 3.days
        self.where('length > ?', sp_length).where('updated_at > ?', three_days_ago).order(play_count: :desc).limit(3)
    end

    def artist_name
        artist.name
    end

end