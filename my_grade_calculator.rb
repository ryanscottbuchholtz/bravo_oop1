require 'csv'
require 'table_print'
require 'hash_rollup'

class GradeReader

  def initialize
  end

  def load(filename)
    @filename = filename
    @hash = {}
    CSV.foreach(@filename, headers:true) {|row| @hash[row.fields[0]] = (Array(row.fields[1..-1])).map!{|i| i.to_i}}
    @hash
  end

  def average
    @average = @hash.each_key { |key| @hash[key] = @hash[key].reduce(:+)/@hash[key].length}
  end

  def letter_grade
    @letter_grade = @average.each_key { |key| @average[key] = if @average[key] >=90 then @average[key] = "A" 
                                                              elsif @average[key] >=80 then @average[key] = "B" 
                                                              elsif @average[key] >=70 then @average[key] = "C" 
                                                              elsif @average[key] >=60 then @average[key] = "D" 
                                                              else "F" 
                                                              end
                                      }
  end

end


puts ''
print "Welcome to the Teachers Assistant.  Which file would you like to review? ==>   "

file_input = gets.chomp

current_class = GradeReader.new

assignment_grades = current_class.load(file_input)

puts ''
puts "*****Grades by Student*****"
tp assignment_grades
puts ''

puts ''
puts "*****Average Grade by Student*****"
average_grade = current_class.average
tp average_grade
puts ''

puts ''
puts "*****Letter Grade, by Student*****"
letter_grade = current_class.letter_grade
tp letter_grade
puts ''

#print "Printing grade data to file.  File name? ==>"
#file_output = gets.chomp

#puts "*****Aggregate Data for this Class*****"
#aggregate_data = current_class.aggregate_data
#tp aggregate_data


