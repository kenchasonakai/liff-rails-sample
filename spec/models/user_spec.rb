require 'rails_helper'

RSpec.describe User, type: :model do
  it 'user_idがある場合有効であること' do
    user = User.new(user_id: "akfjdjie23435kfl")
    expect(user).to be_valid
  end
  it 'user_idがない場合無効であること' do
    user = User.new()
    user.valid?
    expect(user.errors[:user_id]).to include("can't be blank")
  end
end
