require 'rails_helper'

describe User do

  let(:check_list){create_list(:check, 5)}
  let(:card_list){create_list(:credit_card, 5)}
  let(:query_list){create_list(:query, 5)}
  let(:user){create(:user, queries: query_list)}



  it "has a valid factory" do
    expect(user).to be_valid
  end

  describe "validations" do

    it "is valid with an email and password" do
      expect(user).to be_valid
    end

    it "is not valid without an email" do
      new_user = build(:user, :email => nil)
      expect(new_user).not_to be_valid
    end


  end

  describe "associations and methods" do

    it "has many queries" do
      expect(user.queries.count).to eq(5)
    end

  end
  it "is valid with content and a user_id"
  it "is invalid without a user id"

end