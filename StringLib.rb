# String Library for 4 Letter Master Mind
# Autor: Kevin Kerney, Ivana Curic

class StringLib
  def initialize(input)

    @currentCode = input
  end

  def to_s
    @currentCode
  end

  def test
    @currentCode =~ /[[A-D]]/ && @currentCode.size-1 == 4
  end

  def checkRight(code, index)
    @currentCode[index] == code[index]
  end

  def checkWrong(code, index)
    @currentCode[index] != code[index] && @currentCode[index] =~ /^#{@currentCode[index]}/
  end

  def size
    @currentCode.size-1
  end
end