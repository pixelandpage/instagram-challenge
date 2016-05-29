require 'rails_helper'

feature 'instagram' do
  context 'no posts should have been added' do
    scenario 'should display a promp to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end
  context 'posts have been added' do
    before do
      Post.create(title: 'Insta-lunch')
    end
    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('Insta-lunch')
      expect(page).not_to have_content('No posts')
    end
  end
  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the nre post' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Title', with: 'Insta-lunch' do
      click_button 'Create Post'
      expect(page).to have_content 'Insta-lunch'
      expect(current_path).th eq '/posts'
      end
    end
  end
end
