feature 'viewing bookmarks' do
  scenario '/bookmarks enables user to view bookmarks' do
    visit '/'
    click_on 'view bookmarks'
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end
