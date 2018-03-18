module ArithmeterUtil
  def add(a, b)
    do_add a, b
  end

  private

  def do_add(a, b)
    perform_addition a, b
  end

  protected

  def perform_addition(a, b)
    a + b
  end
end

module RaiserUtil
  def do(number, exponent)
    do_raise number, exponent
  end

  protected

  def do_raise(number, exponent)
    perform_raising number, exponent
  end

  private

  def perform_raising(number, exponent)
    product = number

    1.upto(exponent - 1) do
      product *= number
    end

    product
  end
end