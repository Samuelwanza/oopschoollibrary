require_relative "person.rb"
class Student < Person
  def initialize(age, classroom, name = "Unknown", parent_permission = false)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

student1 = Student.new(34, "b")
puts student1.play_hooky
