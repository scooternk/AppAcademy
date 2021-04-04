require "problems"

describe "no_dupes?" do
    it "should accept an array as an argument" do
        no_dupes?([3,4,5])
    end

    it "should return an new array containing the elements that were not repeated in the array" do
          expect(no_dupes?([3,4,3,4,5,6])).to eq([5,6])
          #expect(bootcamp.add_grade("Bob", 87)).to eq(false)
    end
end