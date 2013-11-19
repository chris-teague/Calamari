module Calamari::Position

  extend ActiveSupport::Concern

  attr_accessor(:default_radius)

  module ClassMethods

    def near(*position)
      if position.length == 2
        near_lat_lng(position)
      else
        near_geo(Calamari::Base.infer_location_field_for(position))
      end
    end

    def within

    end

    def inside

    end

    def outside

    end

  end

    private

      def near_lat_lng(position)
        where(%{
          ST_DWithin(
            ST_GeographyFromText('SRID=4326;POINT(' || #{table_name}.lng || ' ' || #{table_name}.lat || ')'),
            ST_GeographyFromText('SRID=4326;POINT(%f %f)'),
            %d
          )
        } % [position[0], position[1], 10_000])
      end

      def near_geo(position)
        where(%{
          ST_DWithin(
            ST_GeographyFromText('SRID=4326;POINT(' || #{table_name}.lng || ' ' || #{table_name}.lat || ')'),
            ST_GeographyFromText('SRID=4326;POINT(%f %f)'),
            %d
          )
        } % [position[0], position[1], 10_000])
      end

end
