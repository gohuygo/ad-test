require 'rails_helper'

RSpec.describe 'User' do
  describe '#votes_hash' do
    let(:user) { FactoryBot.create(:user) }

    let!(:vote_1) do
      FactoryBot.create(
        :vote,
        user_id: user.id,
        billboard_id: 1,
        direction: "up",
      )
    end

    let!(:vote_2) do
      FactoryBot.create(
        :vote,
        user_id: user.id,
        billboard_id: 2,
        direction: "down",
      )
    end

    it 'returns a hash with vote results' do
      expect(user.votes_hash).to eq ({ 1=>'up', 2=>'down' })
    end
  end
end
