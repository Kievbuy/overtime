require 'rails_helper'

describe 'navigate' do
  describe '#index' do
    let!(:user)  { create(:user) }
    let!(:post1) { create(:post, rationale: 'Post1', user: user) }
    let!(:post2) { create(:post, rationale: 'Post2', user: user) }

    before do
      login_as(user, scope: :user)
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      expect(page).to have_content(/Post1|Post2/)
    end
  end

  describe '#new' do
    let(:user) { create(:user) }
    before do
      login_as(user, scope: :user)
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
      expect(User.last.posts.last.user_id).to eq user.id
    end
  end

  describe '#edit' do
    let(:post) { create(:post) }
    before do
      login_as(post.user, scope: :user)
    end

    it 'can be reached by clicking edit on index page' do
      visit posts_path

      click_link("edit_#{post.id}")
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_post_path(post)

      expect(page.status_code).to eq(200)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Edited content"

      click_on "Update Post"
      expect(page).to have_content("Edited content")
    end
  end
end
