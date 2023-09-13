class Person
  def initialize(age, name = "Unknown", parent_permission = true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  attr_reader :name
  attr_reader :age
  attr_reader :id
  attr_writer :name
  attr_writer :age

  def _age?
    @age >= 18 ? true : false
  end

  def can_use_services?
    true unless !_age? && !@parent_permission
  end
end

# person=Person.new(20,"samuel")
# puts person.name
# puts person._age?
# puts person.can_use_services?
