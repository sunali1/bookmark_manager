feature "Viewing links filter" do
  before(:each) do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.bbc.co.uk', title: 'BBC.org', tags: [Tag.first_or_create(name: 'news')])
    Link.create(url: 'http://www.facebook.com', title: 'Facebook', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.vogue.com', title: 'Vogue', tags: [Tag.first_or_create(name: 'fashion')])
  end
  scenario 'I can see existing links on the links page' do
    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
  scenario "filter links by tags" do
    visit '/tags/bubbles'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).not_to have_content 'BBC.org'
      expect(page).not_to have_content "Vogue"
      expect(page).to have_content "Makers Academy"
      expect(page).to have_content "Facebook"
    end
  end
end
