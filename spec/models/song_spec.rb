require 'rails_helper'

RSpec.describe Song, type: :model do
      describe 'relationships' do
        it {should belong_to :artist}
        it {should have_many :playlist_songs}
        it {should have_many(:playlists).through(:playlist_songs)}
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

        it 'Return the 3 songs that have the most plays, a length greater than x where x can be any integer value, and were updated within the last three days' do
          #last one in class vs instance methods
          expected = [@wild_life, @love_song, @purple_rain]
          expect(Song.special(454)).to eq(expected)

        end

        #Below are tests from joins homework. 
        #Joins HW Directions: Your task is to write AR queries and set them 
        #to the query variable set up for you in each test. When you run 
        #each test, your query should make the test pass.

        it 'Get all songs' do
          query = Song.all

          expect(query.sort).to eq([@rasperry_beret, @purple_rain, @love_you, @wild_life, @love_song].sort)
        end

        it "Get the lengths of all songs" do
          query = Song.pluck(:length)
    
          expect(query).to eq([234, 524, 721, 456, 606])
        end

        it "Get the songs with a play count greater than 19" do
          query = Song.where("play_count > 19")
    
          expect(query.sort).to eq([@rasperry_beret, @wild_life, @love_song].sort)    
        end

        it "Get the titles of the songs with a play count greater than zero, sorted alphabetically" do
          query = Song.where("play_count > 19").order(:title).pluck(:title)
    
          expect(query.sort).to eq(["Love Song", "Raspberry Beret", "Wild Wild Life"])
        end

        it "Get the length of the song with the most plays" do
          query = Song.order(play_count: :desc).pluck(:length)[0]
          
          expect(query).to eq(456)
        end


      end

      describe 'instance methods' do
        it 'can return the name of the artist of a song' do
          expect(@wild_life.artist_name).to eq('Talking Heads')
        end
      end
end