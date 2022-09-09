require 'rails_helper'

RSpec.describe 'groups/index', type: :feature do
  before :each do
    @user = User.create(name: 'Hammed', email: 'hammed@tst.co', password: 'abc@123', password_confirmation: 'abc@123')
    @group = Group.new(name: 'Group1', icon: Rack::Test::UploadedFile.new('spec/support/avatal.jpg'), user_id: @user.id)
  end

  it 'should add new group' do
    visit user_session_path
    fill_in 'user[email]', with: 'hammed@tst.co'
    fill_in 'user[password]', with: 'abc@123'
    expect(page).to have_content('Remember me')
  end

  it 'should add new group' do
    @group = Group.create(name: 'Group 1', user_id: @user.id)
    visit user_session_path
    expect(page).to have_content('Forgot your password?')
  end
end
