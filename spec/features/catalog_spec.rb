require 'spec_helper'

describe 'Catalog' do
  let(:email) { 'hello@world.com' }
  let(:password) { 'my$3cur3p@$$word' }
  it {
    visit("/catalog")
    click_link('Login')
    click_link('Sign up')
    within("#new_user") do
      fill_in("Email", with: email)

      # Capybara was complaining when I had the following:
      #   fill_in('Password', with: password)
      # Capybara claimed there were two elements; It was likely counting
      # the "Password confirmation" as well.
      fill_in("user[password]", with: password)
      fill_in("user[password_confirmation]", with: password)
      click_button("Sign up")
    end
    page.should have_content("Welcome aboard")
    visit("/catalog")
    within('.util-links-login') do
      page.should have_content(email)
    end
  }
end