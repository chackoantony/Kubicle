# frozen_string_literal: true

Result = Struct.new(:success?, :square_meters, :error)

class InputValidator
  FLOOR_AREA_REGEXP = /^\d+[xX]\d+$/
  SQUARE_METER_REGEXP = /^\d+,\d+$/

  def initialize(floor_area, *square_meters)
    @floor_area = floor_area
    @square_meters = square_meters
  end

  def call
    validate_floor_area!
    validate_square_meters!
    Result.new(true, @square_meters)
  rescue StandardError => e
    Result.new(false, @square_meters, e.message)
  end

  private

  def validate_floor_area!
    raise "Invalid floor area input: #{@floor_area}" unless @floor_area =~ FLOOR_AREA_REGEXP

    @floor_area = @floor_area.split(/[xX]/).map(&:to_i)
  end

  def validate_square_meters!
    @square_meters = @square_meters.map { |sm| validate_sm_string!(sm) }
  end

  def validate_sm_string!(sm_string)
    raise "Invalid square-meter input: #{sm_string}" unless sm_string =~ SQUARE_METER_REGEXP

    sm = sm_string.split(',').map(&:to_i)
    if sm[0] >= @floor_area[0] || sm[1] >= @floor_area[1]
      raise "Provided square-meter to clean (#{sm_string}) is outiside the given floor area"
    end

    sm
  end
end
