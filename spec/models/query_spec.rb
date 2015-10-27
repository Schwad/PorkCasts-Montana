require 'rails_helper'

describe Query do
  let(:query){build(:query)}
  let(:user){build(:user)}

  it "has a valid factory" do
    expect(query).to be_valid
  end

  describe "validations" do

    it "is valid with content and a user_id" do
      new_query = build(:query, :user_id => 1, :content => "hello")
      expect(new_query).to be_valid
    end

    it "is not valid without a user_id" do
      new_query = build(:query, :user_id => nil)
      expect(new_query).not_to be_valid
    end

  end
  it "is invalid without a user id"

end