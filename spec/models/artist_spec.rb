require 'rails_helper'

RSpec.describe Artist, type: :model do 
  it {should have_many :songs}

  describe 'instance methods' do 
    describe '#average_song_length' do 
      before(:each) do
        @prince = Artist.create!(name: 'Prince')
        @purple = @prince.songs.create!(title: 'Purple Rain', length: 203, play_count: 123890)
        @raspberry = @prince.songs.create!(title: 'Raspberry Beret', length: 233, play_count: 121290)
        @doves = @prince.songs.create!(title: 'When Doves Cry', length: 7, play_count: 121290)
      end

      it 'returns the average song length' do 
        expect(@prince.average_song_length.round(2)).to eq(147.67)
      end
    end
  end
end