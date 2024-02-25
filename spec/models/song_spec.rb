require 'rails_helper'

RSpec.describe Song, type: :model do
      describe 'relationships' do
        it {should belong_to :artist}
      end

      before :each do
        @prince = Artist.create!(name: 'Prince')
        @talking_heads = Artist.create!(name: 'Talking Heads')
        @rasperry_beret = @prince.songs.create!(title: 'Raspberry Beret', length: 234, play_count: 34)
        @purple_rain = @prince.songs.create!(title: 'Purple Rain', length: 524, play_count: 19)
        @love_you = @prince.songs.create!(title: 'Love You', length: 721, play_count: 19)


        @wild_life = @talking_heads.songs.create!(title: 'Wild Wild Life', length: 456, play_count: 45)
        @love_song = @talking_heads.songs.create!(title: 'Love Song', length: 606, play_count: 21)

      end
    
      describe 'class methods' do

        it '.song_count' do
          #expect(Song.all.count).to eq(2) < -- this works, why bother making a class method?
          expect(Song.song_count).to eq(5)

        end

        it 'can list songs in alphabetical order by title' do
          expect(Song.by_title).to eq([@love_song, @love_you, @purple_rain, @rasperry_beret, @wild_life])
        end

        it 'can return the x shortest songs' do
          expect(Song.shortest(2)).to eq([@rasperry_beret, @wild_life])
          expect(Song.shortest(1)).to eq([@rasperry_beret])

        end

        it 'can return a list of songs that have a title that contains the word “love”' do
          expect(Song.search_title('Love')).to eq([@love_you, @love_song])
        end

      end

      describe 'instance methods' do
        it 'can return the name of the artist of a song' do
          expect(@wild_life.artist_name).to eq('Talking Heads')
        end
      end
end