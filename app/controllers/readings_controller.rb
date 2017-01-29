class ReadingsController < ApplicationController
  before_action :verify_sensor

  def create
    @reading = Reading.new(reading_params)
    if @reading.save
      render json: @reading, status: :created
    else
      render json: @reading.errors, status: :bad_request
    end
  end

  private

  def reading_params
    params.require(:reading).permit(:temperature, :humidity, :sensor_id)
  end

  def verify_sensor
    unless Sensor.exists?(params[:reading][:sensor_id])
      render json: {}, status: :unauthorized
    end
  end
end
