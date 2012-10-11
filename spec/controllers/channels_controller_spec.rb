require 'spec_helper'

describe ChannelsController do

  describe "#index" do
    let(:channels) { [double("Channel", name: "channel 1"), double("Channel", name: "channel 2")] }
    before do 
      Channel.should_receive(:all).and_return(channels)
    end

    it "#should redirect to index" do
      get :index
      response.should be_success
      assigns[:channels].should == channels
    end
  end

  describe "#show" do
    let(:channel) { double("Channel") }
    before do
      Channel.should_receive(:find_by_uuid).and_return(channel)
    end

    it "#should show channel" do
      get "show", id: 123
      response.should be_success
      assigns[:channel].should == channel
    end
  end

  describe "#create" do
    before do 
      @channel = create(:channel, name: "Channel Join Test")
    end
    
    it "#should create the channel and redirect to" do
      expect {
        post "create", channel: { name: "Channel Add Test" }
        response.should be_redirect
      }.to change(Channel, :count).by(1)
    end

    it "#should join the channel directly" do
      expect {
        post "create", channel: { name: "Channel Join Test"}
        response.should redirect_to channel_path(@channel.uuid)
      }.to_not change(Channel, :count).by(1)
    end
  end

end
