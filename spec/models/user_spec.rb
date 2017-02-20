#require 'rails_helper'

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

    it "returns active queries" do
      expect(user.active_queries).to eq(5)
    end

    it "returns daily queries" do
      old_query = create(:query, :created_at => 4.days.ago.to_time)
      user.queries << old_query
      expect(user.queries.count).to eq(6)
      expect(user.queries_daily).to eq(5)
    end

    it "checks active queries overload" do

      new_list = create_list(:query, 252)
      new_user = create(:user, queries: new_list)
      second_list = create_list(:query, 252, :opt_out_email => true)
      second_user = create(:user, queries: second_list)
      expect(user.active_queries_overload).to eq(false)
      expect(new_user.active_queries_overload).to eq(true)
      expect(second_user.active_queries_overload).to eq(false)

    end

    it "checks daily queries overload" do
      new_list = create_list(:query, 60)
      new_user = create(:user, queries: new_list)
      expect(new_user.queries_daily_overload).to eq(true)
      expect(user.queries_daily_overload).to eq(false)
    end

  end
end