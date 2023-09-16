require './person'

class Student < Person
  def initialize(age, name, parent_permission, classroom = nil)
    super(age, name, parent_permission)
    @classroom = classroom
    classroom&.add_students(self)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  attr_reader :classroom

  def play_hooky
    '¯\(ツ)/¯'
  end
end
