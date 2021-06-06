class Elevation
  attr_reader :elevation

  def initialize(attributes)
    @elevation = (attributes[:elevation] * 3.28084)
  end
end
