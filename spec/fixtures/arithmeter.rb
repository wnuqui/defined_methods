class Arithmeter
  class << self
    def sum(a, b)
      arithmeter = new
      arithmeter.add a, b
    end

    private

    def private_method
    end

    protected

    def protected_method
    end
  end

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