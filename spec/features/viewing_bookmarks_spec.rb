feature "Visiting the homepage" do
  scenario "The title page is visible" do
    visit("/")
    expect(page).to have_content "Bookmark Manager"
  end
end

feature "Viewing bookmarks" do
  scenario "A user can see bookmarks" do
    visit("/bookmarks")
    expect(page).to have_content "http://www.makersacademy.com - Makers"
    expect(page).to have_content "http://www.twitter.com - Makers"
    expect(page).to have_content "http://www.facebook.com - Makers"
  end
end

feature "Submit new bookmark" do
  scenario "A user filled the form" do
    visit "/"
    fill_in "url", with: "http://www.makersacademy-apprenticeship.com"
    click_button "Submit"
    expect(page).to have_content "http://www.makersacademy-apprenticeship.com"
  end
end
