class Artist < ApplicationRecord
    has_many :songs
    has_many :playlists, through: :songs
    validates_presence_of :name

    def average_song_length
        songs.average(:length)
    end

    def last_updated
        updated_at.strftime("%Y-%m-%d")
    end

    def song_sort
        songs.order(:title)
    end

    def played_song_count
        songs.where("length > 0 and play_count >= 1").count
    end

    def self.newest_first
        order(created_at: :desc)
    end

    def self.by_name
        order(:name)
    end

end