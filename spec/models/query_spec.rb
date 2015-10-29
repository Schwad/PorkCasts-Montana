require 'rails_helper'

describe Query do
  let(:user){build(:user)}
  let(:query){build(:query, :user_id => user.id)}


  it "has a valid factory" do
    expect(query).to be_valid
  end

  describe "validations" do

    it "is valid with content and a user_id" do
      new_query = build(:query, :user_id => user.id, :content => "hello")
      expect(new_query).to be_valid
    end

  end
  it "is invalid without a user id"

end