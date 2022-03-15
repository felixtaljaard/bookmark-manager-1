require 'pg'

feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/add')
    fill_in('url', with: 'http://www.youtube.com')
    click_button('Submit')

    expect(page).to have_content 'http://www.youtube.com'
  end
end