feature 'Creating links' do
  scenario "I can create a new link" do
    visit '/links/new'
    expect(page).to have_content("Title")
    expect(page).to have_content("URL")
  end
  scenario "add a new link" do
    visit '/links/new'
    fill_in (:title), with: "Test link"
    fill_in (:url), with: "https://test-link.com"
    click_button "Submit"
    within 'ul#links' do
      expect(page).to have_content("Test link")
    end
  end
end
