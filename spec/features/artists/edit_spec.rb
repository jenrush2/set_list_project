# As a visitor
# when I visit the artists index
# and click 'Edit' next to an artist
# Then I am taken to an edit artist form
# When I enter a new name for the artist
# And click a button to 'Update Artist'
# Then I am redirected back to the artists index
# And I see the updated name

# As a visitor
# When I visit an artist's Edit page
# And I leave the name field empty and click the "Edit Artist" button
# Then I see a message telling me that I am missing required information
# And I still see the Edit Artist form for that artist.

require 'rails_helper'

RSpec.describe 'the artist edit' do
    it 'links to the edit page' do
        artist = Artist.create!(name: 'Prince')
        visit '/artists'

        click_button "Edit #{artist.name}"

        expect(current_path).to eq("/artists/#{artist.id}/edit")
    end

    it 'can edit the artist' do
        artist = Artist.create!(name: 'Princ')

        visit "/artists"

        expect(page).to have_content('Princ')

        click_button 'Edit Princ'

        fill_in 'Name', with: 'Prince'
        click_button 'Update Artist'

        expect(current_path).to eq("/artists")
        expect(page).to have_content('Prince')

    end

    it 'can not edit an artist without a name field' do
        artist = Artist.create!(name: 'Princ')

        visit "/artists"

        expect(page).to have_content('Princ')

        click_button 'Edit Princ'
    
        click_button 'Update Artist'

        expect(page).to have_content("Artist not updated: Required information missing.")
        
        expect(page).to have_button("Update Artist")
    end

end