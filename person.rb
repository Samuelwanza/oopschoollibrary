require_relative 'nameable'
class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission = true) # rubocop:disable Style/OptionalBooleanParameter
    # ...
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end
  attr_accessor :name, :age, :parent_permission, :id
  attr_reader :rentals

  def can_use_services?
    true unless !_age? && !@parent_permission
  end

  def add_rental(book, date)
    @rental.push(Rental.new(date, book, self))
  end

  private

  def _age?
    @age >= 18
  end

  public

  def correct_name
    @name
  end
end
