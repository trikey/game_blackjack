class User

  attr_reader :name, :bank

  def initialize(name)
    raise "Вы не ввели имя" if name.nil? || name == ''
    @name = name
    @bank = 100
  end
    
  def bet(value)
    @bank -= value
  end

  def gain(value)
    @bank += value
  end

end