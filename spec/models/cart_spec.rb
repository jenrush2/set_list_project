require 'rails_helper'

RSpec.describe Cart do
    subject {Cart.new({
        '1' => 2, #two copies of song 1
        '2' => 3  #three copies of song 2
    })}

    describe "#total_count" do
        it "can calculate the total number of items it holds" do 
            expect(subject.total_count).to eq(5)
        end
    end

    describe "#add_song" do
        it "adds a song to its contents" do
            subject.add_song(1)
            subject.add_song(2)

            expect(subject.contents).to eq({'1' => 3, '2' => 4})
        end

        it "adds a song that hasn't been added yet" do
            subject.add_song('3')
        
            expect(subject.contents).to eq({'1' => 2, '2' => 3, '3' => 1})
        end
    end

    describe "#count_of" do
        it "returns the count of all songs in the cart" do
            cart = Cart.new({})

            expect(cart.count_of(5)).to eq(0)
        end
    end

end