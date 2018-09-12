require 'rails_helper'

RSpec.describe 'User' do
  describe '#upvoted_billboard?' do
    # TODO
  end

  describe '#downvoted_billboard?' do
    # TODO
  end

  describe '#vote_results' do
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
      expect(user.send(:vote_results)).to eq ({ 1=>'up', 2=>'down' })
    end
  end
end
