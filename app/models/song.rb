class Song < ApplicationRecord
    belongs_to :artist

    def self.song_count
        all.count
    end

    def self.by_title
        order(:title)
    end

    def self.search_title(word)
        where("title like '%Love%'")
    end

    def self.shortest(amount)
        order(length: :asc).limit(amount)
    end

    def artist_name
        artist.name
    end

end