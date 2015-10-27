require 'rails_helper'

describe User do

  let(:user){build(:user)}

  it "has a valid factory" do
    expect(user).to be_valid
  end

  describe "validations" do


  end
  it "is valid with content and a user_id"
  it "is invalid without a user id"

end