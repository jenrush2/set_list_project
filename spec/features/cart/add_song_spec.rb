require 'rails_helper'

RSpec.describe "When a user adds songs to their cart" do
    it "displays a message" do
        artist = Artist.create!(name: 'Rick Astley')
        song = artist.songs.create!(title: 'Never Gonna Give You Up', length: 250, play_count: 1000000)
        
        visit "/songs"

        within("#song-#{song.id}") do
            click_button "Add Song"
        end

        expect(page).to have_content("You now have 1 copy of #{song.title} in your cart.")
    end
end