require 'rails_helper'

RSpec.describe 'home#index', type: :feature do
  it 'should get splash on root' do
    visit '/'
    expect(page).to have_content('Fulus Bank')
    expect(page).to have_content('LOG IN')
    expect(page).to have_content('SIGN UP')
  end

  it 'should get sign up new user' do
    visit new_user_registration_path
    fill_in 'user[email]', with: 'hammed@tst.co'
    fill_in 'user[name]', with: 'Hammed'
    fill_in 'user[password]', with: 'abc@123'
    fill_in 'user[password_confirmation]', with: 'abc@123'
    click_button 'Sign up'
    expect(page).to have_content('LOGOUT')
  end
end