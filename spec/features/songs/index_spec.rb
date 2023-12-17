require 'rails_helper'

RSpec.describe "songs index page", type: :feature do
    it "can see all songs titles and play count" do
        carly = Artist.create(name: "Carly Rae Jepson")
        song_1 = Song.create!(title: "I Really Like You",
                             length: 208,
                             play_count: 243810867,
                             artist_id: carly.id)
        song_2 = Song.create!(title: "Call Me Maybe",
                             length: 199,
                             play_count: 1214722172,
                             artist_id: carly.id)
        
        visit "/songs"

        expect(page).to have_content(song_1.title)
        expect(page).to have_content("Play Count: #{song_1.play_count}")
        expect(page).to have_content(song_2.title)
        expect(page).to have_content("Play Count: #{song_2.play_count}")
    end

    it "has a header 'all songs'" do
        carly = Artist.create(name: "Carly Rae Jepson")
        song_1 = carly.songs.create!(title: "I Really Like You",
                             length: 208,
                             play_count: 243810867)
        song_2 = Song.create!(title: "Call Me Maybe",
                             length: 199,
                             play_count: 1214722172,
                             artist_id: carly.id)
        
        visit "/songs"
        
        expect(page).to have_selector('h1', text: 'Songs List')

    end

end
