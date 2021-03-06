describe Noam::Beacon do
  describe "#new" do
    it "creates a new beacon" do
      beacon = Noam::Beacon.new(:name, :host, :noam)
      beacon.name.should == :name
      beacon.host.should == :host
      beacon.port.should == :noam
    end
  end

  describe "::discover" do
    before do
      FakeManager.start
    end

    after do
      FakeManager.stop
    end

    it "creates a Beacon based on server beacons" do
      beacon = Noam::Beacon.discover
      beacon.should be_a(Noam::Beacon)
      beacon.port.should == NoamTest::FakeServer::PORT
    end
  end
end
