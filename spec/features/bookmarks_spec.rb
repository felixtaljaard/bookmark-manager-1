feature 'viewing bookmarks' do
  scenario '/bookmarks enables user to view bookmarks' do
    visit '/'
    click_on 'view bookmarks'
    expect(page).to have_content 'www.hornpub.com'
  end
end
