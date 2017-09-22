#require 'rails_helper'

describe Check do
  let(:user){build(:user)}
  let(:query){build(:query)}
  let(:check){build(:check)}

  it "has a valid factory" do
    expect(check).to be_valid
  end

  describe "validations" do
    it "is valid with a payee, department and query id"
  end

end