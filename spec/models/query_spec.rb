require 'rails_helper'

describe Query do
  let(:user){create(:user)}
  let(:check){create_list(:check, 5)}
  let(:credit_card){create_list(:credit_card, 5)}
  let(:query){create(:query, user: user, checks: check, credit_cards: credit_card)}


  it "has a valid factory" do
    expect(query).to be_valid
  end

  describe "validations" do

    it "is valid with content and a user_id" do
      new_query = build(:query, :user_id => user.id, :content => "hello")
      expect(new_query).to be_valid
    end

  end

  describe "associations and methods" do

    it "belongs to a user" do
      expect(query.user).to eq(user)
    end

    it "has many checks" do
      expect(query.checks.count).to eq(5)
    end

    it "has many credit cards" do
      expect(query.credit_cards.count).to eq(5)
    end

    it "renders the largest payment" do
      new_check = create(:check, :amount => 111111)
      query.checks << new_check
      expect(query.largest_payment).to eq(111111)
    end

    it "renders checks by day" do
      expect(query.checks_by_day[0].length).to eq(5)
    end

    it "renders cards by day" do
      expect(query.cards_by_day[0].length).to eq(5)
    end

  end

end