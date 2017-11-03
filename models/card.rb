class Card
  HIDDEN = '**'
  PICTURE_FACES = %w(K Q J)
  ACE = 'A'
  attr_reader :face

  def initialize(face, suit)
    @face = face
    @suit = suit
  end

  def points(sum)
    return 11 if @face == ACE && sum <= 10
    return 1 if @face == ACE && sum > 10
    return 10 if PICTURE_FACES.include?(@face)
    @face
  end

  def to_s
    "#{@face}#{@suit}"
  end

  def hidden
    HIDDEN
  end
end