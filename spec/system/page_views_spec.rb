require 'rails_helper'

RSpec.describe "Page views" do
  it 'shows the number of views' do
    visit '/'
    expect(page.text).to match (/This page has been viewed [0-9]+ times!/)
  end

  it 'shows text based on javascript', js: true do
    visit '/'
    expect(page.text).to match (/ENHANCED/)
  end
end