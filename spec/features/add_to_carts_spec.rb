require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end

    @user = User.create!(
      first_name: 'Daniel',
      last_name: 'Sedin',
      email: 'first@user.com',
      password: '123456',
      password_confirmation: '123456'
    )
  end
  
  def login
      visit '/login'

    within 'form' do
      fill_in id: 'email', with: 'first@user.com'
      fill_in id: 'password', with: '123456'

      click_button 'Submit'
    end
  end

  scenario 'They can add to cart' do
    visit root_path

    login

    first('article.product').find_link('Add').click

    expect(page).to have_content "My Cart (1)"

    save_screenshot 'after_login.png'
  end
end
