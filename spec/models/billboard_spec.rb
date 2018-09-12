require 'rails_helper'

RSpec.describe 'Billboard' do
  describe '#score' do
    let!(:billboard) do
      FactoryBot.create(
        :billboard,
        name: 'Billboard Name',
        image_url: 'Image Link',
      )
    end

    context 'when there are no votes' do
      it 'returns 0' do
        expect(billboard.score).to eq 0
      end
    end

    context 'when there are votes' do
      let!(:vote_1) do
        FactoryBot.create(
          :vote,
          user_id: 1,
          billboard_id: billboard.id,
          direction: 'up',
        )
      end

      let!(:vote_2) do
        FactoryBot.create(
          :vote,
          user_id: 1,
          billboard_id: billboard.id,
          direction: 'up',
        )
      end

      let!(:vote_3) do
        FactoryBot.create(
          :vote,
          user_id: 1,
          billboard_id: billboard.id,
          direction: 'down',
        )
      end

      it 'returns the sum' do
         expect(billboard.score).to eq 1
      end
    end
  end
end
