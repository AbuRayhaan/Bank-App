require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = User.create!(name: 'Hammed', email: 'hammed@tst.co', password: 'abc@123', password_confirmation: 'abc@123')
    @group = Group.new(name: 'Group 1', user_id: @user.id)
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      @group.save
      expect(@group).to_not be_valid
    end

    it 'is not valid without a name' do
      expect(Group.new).to_not be_valid
    end
  end

  describe 'associations' do
    it 'has many entities' do
      assc = described_class.reflect_on_association(:entities)
      expect(assc.macro).to eq :has_many
    end

    it 'belongs to users' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
