require 'rails_helper'

RSpec.describe 'User' do
  describe '#upvoted_billboard?' do
    let(:user)      { FactoryBot.create(:user)      }
    let(:billboard) { FactoryBot.create(:billboard) }

    context 'when user has not voted' do
      it 'returns false' do
        expect(user.upvoted_billboard?(billboard.id)).to eq false
      end
    end

    context 'when user has voted' do
      let!(:vote) do
        FactoryBot.create(
          :vote,
          user_id: user.id,
          billboard_id: billboard.id,
          direction: direction
        )
      end

      context 'when upvoted' do
        let(:direction) { 'up'}

        it 'returns true' do
          expect(user.upvoted_billboard?(billboard.id)).to eq true
        end
      end

      context 'when downvoted' do
        let(:direction) { 'down'}

        it 'returns false' do
          expect(user.upvoted_billboard?(billboard.id)).to eq false
        end
      end
    end
  end

  describe '#downvoted_billboard?' do
    let(:user)      { FactoryBot.create(:user)      }
    let(:billboard) { FactoryBot.create(:billboard) }

    context 'when user has not voted' do
      it 'returns false' do
        expect(user.upvoted_billboard?(billboard.id)).to eq false
      end
    end

    context 'when user has voted' do
      let!(:vote) do
        FactoryBot.create(
          :vote,
          user_id: user.id,
          billboard_id: billboard.id,
          direction: direction
        )
      end

      context 'when upvoted' do
        let(:direction) { 'up'}

        it 'returns false' do
          expect(user.downvoted_billboard?(billboard.id)).to eq false
        end
      end

      context 'when downvoted' do
        let(:direction) { 'down'}

        it 'returns true' do
          expect(user.downvoted_billboard?(billboard.id)).to eq true
        end
      end
    end
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
