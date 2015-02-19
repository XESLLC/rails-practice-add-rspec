require 'rails_helper'

feature 'New and Edit Events' do


  scenario 'User creates and edits an event' do
    Event.create!(
      description: 'My aweeesome event'
    )

    visit root_path
    expect(page).to have_content('My aweeesome event')
    click_on 'edit'
    fill_in 'Description', with: 'My awesome event'
    click_on 'Update Event'

    expect(page).to have_content('My awesome event')
    expect(page).to have_no_content('My aweeesome event')

  end

end


feature 'Show' do


  scenario 'User can see a specific event with details' do

    Event.create!(
      description: 'Show me the money'
    )

    Event.create!(
      description: 'My aweeesome event'
    )

    visit root_path
    expect(page).to have_content('Show me the money')
    click_on 'Show me the money'

    expect(page).to have_content('Show me the money')
    expect(page).not_to have_content('My aweeesome event?')

  end

end

feature 'Delete' do


  scenario 'User can delete a specific event' do

    Event.create!(
      description: 'Whaaaaaaat?'
    )

    visit root_path
    expect(page).to have_content('Whaaaaaaat?')
    click_link('delete')
    expect(page).not_to have_content('Whaaaaaaat?')



    save_and_open_page

  end

end
