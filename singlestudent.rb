require 'csv'
require 'descriptive_statistics'

#class GradeReader
#  def initialize(filename)
#    @instantiated_students = []
#    
#    CSV.foreach(filename) do |row|
#    @instantiated_students << Students.new(row[0], row[1...-1])
#    
#    end
#  end
#end

class Student
  attr_accessor :name, :grades
  
  def initialize(name, grades = [])
    @name = name
    @grades = grades
  end

  def average
    @grades.map(&:to_i).reduce(:+)/@grades.count
  end

  def letter_grade
      if average >= 90 
      return 'A'
    elsif average >= 80 
      return 'B'
    elsif average >= 70 
      return 'C'
    elsif average >= 60 
      return 'D'
    else
      return 'F'
      end
  end

end

#grade_book = GradeReader.new('grades.csv')


instantiated_students = []

CSV.foreach('grades.csv') do |row| 
  instantiated_students << Student.new(row[0], row[1...-1]) #for each row in the CSV, used the data and 'instantiated' a new "Student", passing arguments from the csv.
end

print instantiated_students

instantiated_students.each do |student| 
  puts "#{student.name} had the following scores #{student.grades} and an average score of #{student.average} with a corresponding letter grade of #{student.letter_grade}."
  puts ""
end

student_scores = []

instantiated_students.each do |student|
  student_scores << student.average
end

average = student_scores.reduce(:+)/student_scores.length

puts ''
puts "The class average is #{average}%."
puts ''
puts "The low score is #{student_scores.min}%."
puts ''
puts "The high score is #{student_scores.max}%."
puts ''
puts "The standard deviation is #{student_scores.standard_deviation}"











