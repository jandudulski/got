require 'test_helper'

describe Game do
  let(:params) do
    {
      date: '2012-01-20',
      game_version_id: 1,
      comment: 'Something to say'
    }
  end

  it 'is valid with valid params' do
    game = Game.new(params)
    assert game.valid?
  end
end
