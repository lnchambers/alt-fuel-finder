require "rails_helper"

describe "As a user" do
  describe "when I visit the search page" do
    it "I see the attributes of each station" do
      # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
    end
    
    it "I can see a list of the 10 closest stations to 80203" do
      # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    end

    it "I see stations limited to electric and propane" do
      # And the stations should be limited to Electric and Propane
    end
  end
end
