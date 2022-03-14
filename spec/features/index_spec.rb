feature "visiting index page" do
  scenario 'index page has content' do
    visit "/"
    expect(page).to have_content "Bookmark manager supreme"
  end
end

