require 'spec_helper'
 
describe GildedRose do

  let!(:sulfuras) { Item.new("Sulfuras", 10, 10)  }

  describe "#update_quality" do
    context "Sulfuras" do
      it "does never had to be sold or decreases in quality" do
        gilded_rose = GildedRose.new([sulfuras])
        gilded_rose.update_quality

        expect(sulfuras.quality).to eq 10 
      end
    end

    context "Aged Brie" do
      it "does" do
      
      end
    end

  end

end