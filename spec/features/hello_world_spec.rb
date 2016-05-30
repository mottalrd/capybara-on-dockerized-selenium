require 'rails_helper'

describe 'Hello World' do
  it 'should display the welcome text', :js => true do
    visit '/'

    expect(page).to have_text 'Hello World'
  end
end
