require_relative "person.rb"
class Teacher < Person
  def initialize(age, specialization, name = "Unknown", parent_permission = true)
    super(age, name = "Unknown", parent_permission = true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

teacher1 = Teacher.new(30, "mathematics")
puts teacher1.can_use_services?
