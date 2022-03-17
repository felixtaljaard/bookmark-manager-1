feature "delete bookmarks" do
  scenario 'clicking delete deletes bookmark' do

    List.create(Bookmark.new('Google', 'http://www.google.com'))
    List.create(Bookmark.new('Makers Academy','http://www.makersacademy.com'))
    List.create(Bookmark.new('Destroy all Software', 'http://www.destroyallsoftware.com'))

    visit('/')
    click_button('view bookmarks')
    click_button(value: "Delete", name: '1')
    expect(page).to_not have_text('Google')
  end
end
