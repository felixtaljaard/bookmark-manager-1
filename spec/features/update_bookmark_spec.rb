feature "update bookmark" do
  scenario "can edit a bookmark" do
    List.create(Bookmark.new('Google', 'http://www.google.com'))
    List.create(Bookmark.new('Makers Academy','http://www.makersacademy.com'))
    List.create(Bookmark.new('Destroy all Software', 'http://www.destroyallsoftware.com'))
    visit('/')
    click_button 'view bookmarks'
    click_button(value:'Update', name: "2")
    fill_in(name: "title", with:'')
    fill_in(name: "url", with: '')
    fill_in(name: "title", with: 'Makers training')
    fill_in(name: "url", with: 'makerstraining.com')
    click_button(value:'Update')
    expect(page).to_not have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Makers training', href: 'makerstraining.com')
  end
end
