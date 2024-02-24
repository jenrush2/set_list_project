class Song < ApplicationRecord
    belongs_to :artist

    def self.song_count
        self.all.count
    end

end