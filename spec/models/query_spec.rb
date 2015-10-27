require 'rails_helper'

describe Query do
  let(:query){build(:query)}

  it "has a valid factory" do
    expect(query).to be_valid
  end
  it "is valid with content and a user_id"
  it "is invalid without a user id"

end