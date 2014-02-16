require 'spec_helper'

describe "Tunes" do
  describe "GET /tunes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get tunes_path
      response.status.should be(200)
    end
  end
end
