require 'rails_helper'

RSpec.describe 'Vote' do
  describe '#direction_value' do
    let(:vote) do
      FactoryBot.create(
        :vote,
        user_id: 1,
        billboard_id: 1,
        direction: direction,
      )
    end

    context 'direction is up' do
      let(:direction) { 'up' }

      it 'returns 1' do
        expect(vote.direction_value).to eq 1
      end
    end

    context 'direction is down' do
      let(:direction) { 'down' }

      it 'returns -1' do
        expect(vote.direction_value).to eq -1
      end
    end
  end
end
