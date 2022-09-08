require 'rails_helper'

RSpec.describe Entity, type: :model do
  subject { Entity.new(name: 'Billing', amount: 10) }
  before { subject.save }

  it 'Name should not be empty or nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Amount should not be empty or nil' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end
end
