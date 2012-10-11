require 'spec_helper'

describe User do
  subject {create :user}
  it {should validate_presence_of :name}
  it {should validate_presence_of :github_id}
  it {should validate_uniqueness_of :github_id}
  
  describe ".create_with_omniauth" do
    
    let(:full_auth) {
      {
        "uid"  => "12345",
        "info" => { "nickname" => "full_auth" }
      }
    }
    
    let(:partial_auth) {
      {
        "uid"  => "54321"
      }
    }
    
    it "should create user" do
      expect {
        User.create_with_omniauth(full_auth)
      }.to change(User, :count).by(1)
    end

    it "should not create user" do
      expect {
        User.create_with_omniauth(partial_auth)
      }.to raise_error
    end

  end
end
