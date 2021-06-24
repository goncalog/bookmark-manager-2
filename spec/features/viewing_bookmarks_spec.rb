feature "Visiting the homepage" do
  scenario "The title page is visible" do
    visit("/")
    expect(page).to have_content "Bookmark Manager"
  end
end

feature "Viewing bookmarks" do
  scenario "A user can see bookmarks" do
    visit("/bookmarks")
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Twitter', href: 'http://www.twitter.com')
    expect(page).to have_link('Facebook', href: 'http://www.facebook.com')
  end
end

feature "Submit new bookmark" do
  scenario "A user filled the form" do
    visit "/"
    fill_in "url", with: "http://www.makersacademy-apprenticeship.com"
    fill_in "title", with: "Makers Academy"
    click_button "Submit"
    expect(page).to have_content "Makers Academy"
  end
end

feature "Delete bookmark" do
  scenario "A user deletes a bookmark" do
    connection = PG.connect(dbname: "bookmark_manager_test")
    result = connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.craig-david.com', 'Craig David') RETURNING id, url, title;")
    visit '/bookmarks'
    click_button "#{result[0]['id']}"
    expect(page).to_not have_content "Craig David"
  end
end
