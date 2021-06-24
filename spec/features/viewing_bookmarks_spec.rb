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
