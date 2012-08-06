require 'spec_helper'

describe User do
  it {should validate_presence_of :name}
  it {should validate_presence_of :github_id}
  it {should validate_uniqueness_of :github_id}
  
end
