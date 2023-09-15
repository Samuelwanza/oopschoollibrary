require_relative 'nameable'
class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  attr_accessor :name, :age
  attr_reader :id

  def can_use_services?
    true unless !_age? && !@parent_permission
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
