require 'rails_helper'

RSpec.describe User, type: :model do
  describe "with invalid email" do
    it "rejects user creation" do
      expect { User.create!(email: "foobar", password: "meowwow") }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
