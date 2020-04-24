require 'rails_helper'

RSpec.describe 'DatabaseCleaner issue 564' do
  include_context 'a_user_exist'

  # below test failing
  # switch me from "pending" to "it" when I pass :)
  pending 'user should not get cleaned' do
    expect(User.count).to_not eq 0
  end
end