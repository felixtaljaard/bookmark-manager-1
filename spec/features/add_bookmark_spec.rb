feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/add')
    fill_in('url', with: 'http://www.youtube.com')
    fill_in('title', with: 'Youtube')
    click_button('Submit')

    expect(page).to have_content 'Youtube'
  end
  scenario 'user enters an invalid url' do
    visit('/bookmarks/add')
    fill_in('url', with: 'blahblah')
    fill_in('title', with: 'Youtube')
    click_button('Submit')
    expect(page).to have_text 'Invalid URL'
  end
end
