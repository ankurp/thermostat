class Float
  def to_farenheit(round: round)
    ((self * 1.8) + 32.0).round(round)
  end
end
