require 'rails_helper'

describe 'navigate' do
  describe '#index' do
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
  end

  describe '#new' do
    before do
      @user = User.create(email: "test@test.com", password: "123456789", password_confirmation: "123456789",
                         first_name: "John", last_name: "Snow")
      login_as(@user, scope: :user)
      visit new_post_path
    end

    it 'page can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created form ' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"

      click_on "Create Post"

      expect(page).to have_content("Some rationale")
      expect(User.last.posts.last.user_id).to eq @user.id
    end
  end
end
