require 'rails_helper'

describe 'User registration' do
  before do
    visit register_path
  end

  context 'success flow' do
    it 'should fill all the fields and then login' do
      expect(current_path).to eq register_path

      email = Faker::Internet.email

      fill_in 'user_first_name', with: Faker::Name.first_name
      fill_in 'user_last_name', with: Faker::Name.last_name
      fill_in 'user_email', with: email
      fill_in 'user_password', with: 'test1'
      fill_in 'user_password_confirmation', with: 'test1'

      find('input[name="commit"]').click

      expect(current_path).to eq login_path

      fill_in 'email', with: email
      fill_in 'password', with: 'test1'

      find('input[name="commit"]').click
    end
  end

  context 'empty field:' do
    it 'first_name' do
      expect(current_path).to eq register_path

      email = Faker::Internet.email

      fill_in 'user_last_name', with: Faker::Name.last_name
      fill_in 'user_email', with: email
      fill_in 'user_password', with: 'test1'
      fill_in 'user_password_confirmation', with: 'test1'

      find('input[name="commit"]').click

      expect(current_path).to eq register_path
    end
  end
end