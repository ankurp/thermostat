class Reading < ApplicationRecord
  belongs_to :sensor

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :temperature, type: :float
      indexes :humidity, type: :float
      indexes :updated_at, type: :date
      indexes :sensor_id, analyzer: 'keyword'
      indexes :room_name, analyzer: 'keyword'
      indexes :location_name, analyzer: 'keyword'
      indexes :organization_name, analyzer: 'keyword'
    end
  end

  def as_indexed_json(options={})
    room = sensor.room
    location = room.location
    organization = location.organization

    self.as_json.merge(
      sensor_name: sensor.name,
      room_name: room.name,
      location_name: location.name,
      organization_name: organization.name)
  end
end
