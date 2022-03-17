feature 'viewing bookmarks' do
  scenario '/bookmarks enables user to view bookmarks' do
    List.create(Bookmark.new('Google', 'http://www.google.com'))
    List.create(Bookmark.new('Makers Academy','http://www.makersacademy.com'))
    List.create(Bookmark.new('Destroy all Software', 'http://www.destroyallsoftware.com'))
   
    visit('/bookmarks')

    expect(page).to have_content "Makers Academy"
    expect(page).to have_content "Destroy all Software"
    expect(page).to have_content "Google"
  end
end
