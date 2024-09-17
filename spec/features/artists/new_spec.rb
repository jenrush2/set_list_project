#As a visitor
#When I visit the artists index
#And click on 'New Artist'
#Then my current path is '/artists/new'
#and I fill in the artist's name
#Then I click 'Create Artist'
#I am redirected to this new artists show page


# As a Visitor
# I visit the new artist page
# And click 'Create Artist' without filling in a name
# Then I see a message telling me that I am missing required information
# And I still see the new artist form

require 'rails_helper'

RSpec.describe 'the Artist creation' do
    it 'links to the new page from the artists index' do
        visit '/artists'

        click_link('New Artist')

        expect(current_path).to eq('/artists/new')
    end

    it 'can create a new artist' do
        visit '/artists/new'

        fill_in('Name', with: 'Prince')
        click_button('Create Artist')

        expect(current_path).to eq("/artists")
        expect(page).to have_content("Prince")

    end

    it 'can not create an artist without a name' do
        visit "/artists/new"

        click_on "Create Artist"

        expect(page).to have_content("Artist not created: Required information missing.")

        expect(page).to have_button("Create Artist")
    end

end