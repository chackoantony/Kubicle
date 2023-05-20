class CommandGenerator
  COMMANDS = {
    east: 'E',
    west: 'W',
    north: 'N',
    south: 'S',
    clean: 'C'
  }.freeze

  class << self
    def call(square_meters)
      current_pos = [0, 0]
      square_meters.sort.inject('') do |command, (x, y)|
        command_sm = generate_command(x, y, current_pos)
        current_pos = [x, y]
        command + command_sm
      end
    end

    private
    
    # Computes required command to navigate and clean each square-meter.
    # The algorithm computes offset and direction for navigation by subtracting
    # the next point's coordinates from the current point's coordinates.
    def generate_command(x, y, current_pos)
      x_offset = x - current_pos[0]
      y_offset = y - current_pos[1]
      x_direction = x_offset >= 0 ? COMMANDS[:east] :  COMMANDS[:west]
      y_direction = y_offset >= 0 ? COMMANDS[:north] : COMMANDS[:south]

      [move(x_direction, x_offset), move(y_direction, y_offset), clean].join
    end

    def move(direction, offset)
      direction * offset.abs
    end

    def clean
      COMMANDS[:clean]
    end
  end
end
