require 'spec_helper'

class PositionClass
  include Calamari::Position
end

module Calamari
  describe Position do
    
    describe '.near' do
      it 'returns an arel scope when given a lat and lng' do
        allow(PositionClass).to receive(:near_lat_lng)
        PositionClass.near(123, 32)
      end

      it 'returns an arel scope when given a geo position' do
        allow(PositionClass).to receive(:near_geo)
        PositionClass.near(123)
      end
    end

  end
end
