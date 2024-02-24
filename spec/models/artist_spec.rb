require 'rails_helper'

RSpec.describe Artist do
    describe "validations" do
        it { should validate_presence_of :name }
    end
    
    describe 'relationships' do
        it { should have_many :songs }
    end

    describe 'instance methods' do
        
        describe '#average_song_length' do
            before :each do
                @prince = Artist.create!(name: 'Prince')
                @purple = @prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 384)
                @beret = @prince.songs.create!(title: 'Raspberry Beret', length: 816, play_count: 323)
                @other_song = @prince.songs.create!(title: 'Another Prince Song', length: 2, play_count: 99)

            end

            it 'returns the average song length' do
                expect(@prince.average_song_length.round(2)).to eq(554.33)
            end


        end
    end


end