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
    fill_in (:tags), with: "School"

    click_button "Create link"
    link = Link.first
      expect(link.tags.map(&:name)).to include("School")
    end
end
