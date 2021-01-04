require 'rails_helper'

RSpec.describe User, type: :model do
  it 'user_id$B$,$"$k>l9gM-8z$G$"$k$3$H(B' do
    user = User.new(user_id: "akfjdjie23435kfl")
    expect(user).to be_valid
  end
  it 'user_id$B$,$J$$>l9gL58z$G$"$k$3$H(B' do
    user = User.new()
    user.valid?
    expect(user.errors[:user_id]).to include("can't be blank")
  end
end
