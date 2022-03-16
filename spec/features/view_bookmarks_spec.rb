require 'pg'

feature 'viewing bookmarks' do
  scenario '/bookmarks enables user to view bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.makersacademy.com', 'Makers Academy');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'Destroy all Software');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'Google');")

    visit('/bookmarks')

    expect(page).to have_content "Makers Academy"
    expect(page).to have_content "Destroy all Software"
    expect(page).to have_content "Google"
  end
end
