require 'rails_helper'

RSpec.describe "Edit song form", type: :feature do 
    before :each do
        @carly = Artist.create(name: "Carly Rae Jepson")
        @song_1 = Song.create!(title: "I Really Like You",
                            length: 208,
                            play_count: 243810867,
                            artist_id: @carly.id)
        @song_2 = Song.create!(title: "Call Me Maybe",
                            length: 199,
                            play_count: 1214722172,
                            artist_id: @carly.id)
    end
    describe "when I visit the songs index page" do

        it "has an edit button for each song" do
        
            visit "/songs"

            expect(page).to have_button("Edit I Really Like You")
            expect(page).to have_button("Edit Call Me Maybe")

        end

        it "takes me to the edit song page when I click the edit song button" do
            
            visit "/songs"

            click_button "Edit Call Me Maybe"

            expect(current_path).to eq("/songs/#{@song_2.id}/edit")
        end
    end

    describe "when I visit the song edit page" do
        it "has a form to edit the song" do
            visit "/songs/#{@song_2.id}/edit"

            expect(page).to have_field "Song title"
            expect(page).to have_field "song[length]"
            expect(page).to have_field "song[play_count]"
            expect(page).to have_field "song[artist_id]"
        end

        it "can edit a song" do
            visit "/songs/#{@song_2.id}/edit"

            fill_in "song[length]", with: 312
            fill_in "song[play_count]", with: 3426

            click_button "Update Song"

            expect(current_path).to eq("/songs")

            expect(page).to have_content("Call Me Maybe")
            expect(page).to have_content(312)
            expect(page).to have_content(3426)

        end
    end

end