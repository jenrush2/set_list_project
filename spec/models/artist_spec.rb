require 'rails_helper'

RSpec.describe Artist do
    describe "validations" do
        it { should validate_presence_of :name }
    end
    
    describe 'relationships' do
        it { should have_many :songs }
    end

    describe 'instance methods' do
        before :each do
            @prince = Artist.create!(name: 'Prince')
            @purple = @prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 384)
            @beret = @prince.songs.create!(title: 'Raspberry Beret', length: 816, play_count: 323)
            @other_song = @prince.songs.create!(title: 'Another Prince Song', length: 2, play_count: 99)

        end

        describe '#average_song_length' do

            it 'returns the average song length' do
                expect(@prince.average_song_length.round(2)).to eq(554.33)
            end
        end

        describe 'last_updated' do
            it "returns the date the instance was last updated" do
                artist = Artist.create(name: "prince")
                updated_time = Time.zone.now
        
                artist.update(name: "The Artist Formerly Known as Prince", updated_at: updated_time)
        
                expect(artist.last_updated).to eq(updated_time.strftime("%Y-%m-%d"))
            end
            
        end
        describe 'song sorting for an artist' do
            it 'returns the songs of an artist sorted by title alphabetically' do
                expect(@prince.song_sort).to eq([@other_song, @purple, @beret])
            end

            it 'can return the number of songs for an artist that have at least 1 play and a length greater than 0' do
                jgb = Artist.create!(name: "Jerry Garcia Band")
                
                jgb.songs.create!(title: 'Song 1', length: 0.125, play_count: 0)
                jgb.songs.create!(title: 'Song 2', length: 845, play_count: 4)
                jgb.songs.create!(title: 'Not a song', length: 0, play_count: 4)
                
                expect(jgb.played_song_count).to eq(1)
            end
        end
    end
          
    describe "class methods" do
        describe "newest_first" do
            it "returns songs ordered by most recent creation" do
                prince = Artist.create(name: "Prince")
                pink = Artist.create(name: "Pink")
        
                expect(Artist.newest_first).to eq([pink, prince])
            end
        end
    
        describe "::by_name" do
            it "returns Artists ordered by name alphabetically" do
                talking_heads = Artist.create!(name: "Talking Heads")
                prince = Artist.create!(name: "Prince")
                jgb = Artist.create!(name: "Jerry Garcia Band")
                crj = Artist.create!(name: "Carly Rae Jepsen")
        
                expect(Artist.by_name).to eq([crj, jgb, prince, talking_heads])
            end
        end


        
    end


end