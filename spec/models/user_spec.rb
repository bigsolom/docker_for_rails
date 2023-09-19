require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    
    subject { User.new }

    it "requires firstname to be set" do
      expect(subject.valid?).to_not be
      expect(subject.errors[:firstname].size).to eq(1)
    end
  end
end
