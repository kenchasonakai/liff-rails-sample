require 'rails_helper'

RSpec.describe Log, type: :model do
  it 'grnv_idとuser_idが場合有効であること' do
    user = User.create(user_id: "akfjdjie23435kfl")
    log = Log.new(user_id: user.id, grnv_id: "aldkj473874")
    expect(log).to be_valid
  end
  it 'user_idがない場合無効であること' do
    user = User.create(user_id: "akfjdjie23435kfl")
    log = Log.new(grnv_id: "aldkj473874")
    log.valid?
    expect(log.errors[:user_id]).to include("can't be blank")
  end
  it 'grnv_idがない場合無効であること' do
    user = User.create(user_id: "akfjdjie23435kfl")
    log = Log.new(user_id: user.id)
    log.valid?
    expect(log.errors[:grnv_id]).to include("can't be blank")
  end
end
