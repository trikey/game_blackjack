class Card
  HIDDEN = '**'
  PICTURE_FACES = %w(K Q J)
  ACE = 'A'

  def initialize(face, suit)
    @face = face
    @suit = suit
    @points = points
  end

  def points
    return 11 if @face == ACE
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