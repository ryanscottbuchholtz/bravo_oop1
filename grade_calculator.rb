# raw_grade_data = [  {"Student_last"=>"Smith", "Student_first"=>"Johnny", "Assignment_1"=>"100", "Assignment_2"=>"80", "Assignment_3"=>"75", "Assignment_4"=>"78", "Assignment_5"=>"60"}, 
                    # {"Student_last"=>"Strong", "Student_first"=>"Sally", "Assignment_1"=>"100", "Assignment_2"=>"100", "Assignment_3"=>"90", "Assignment_4"=>"95", "Assignment_5"=>"85"}, 
                    # {"Student_last"=>"Fallon", "Student_first"=>"Jimmy", "Assignment_1"=>"95", "Assignment_2"=>"97", "Assignment_3"=>"85", "Assignment_4"=>"40", "Assignment_5"=>"85"}, 
                    # {"Student_last"=>"Botsworth", "Student_first"=>"Chris", "Assignment_1"=>"98", "Assignment_2"=>"86", "Assignment_3"=>"85", "Assignment_4"=>"82", "Assignment_5"=>"80"}, 
                    # {"Student_last"=>"Boyd", "Student_first"=>"Bryan", "Assignment_1"=>"50", "Assignment_2"=>"60", "Assignment_3"=>"65", "Assignment_4"=>"70", "Assignment_5"=>"75"}]


require 'csv'
require 'table_print'
require 'pry'

class GradeReader
  def initialize(filename)
    @grade_data = []
    CSV.foreach(filename, headers:true) { |row| @grade_data << row }
    @grade_data = @grade_data.map { |row| row.to_hash }
  end

  def grade_data
    @grade_data
  end

end

class AssignmentGrade
  def initialize(assignment)
    @student
    @assignment
    @assignment_grade
  end

end

class FinalGrade
  def initialize
  end

  # calc average score & letter grade
end

class Student
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def average_score
    
  end

  def letter_grade
    
  end
end

class GradeSummary
  def initialize
  end
end

# PROGRAM

grade_import = GradeReader.new("grades.csv")
raw_grade_data = grade_import.grade_data.sort_by {|row| row["Student_last"]}

tp raw_grade_data

def average_score(grades, last_name, first_name)
  student_info = grades.select { |row| row["Student_last"] == last_name && row["Student_first"] == first_name}[0]
  
  student_grades = student_info.reject {|k,v| !k.downcase.include?('assign')}.values
  student_grades = student_grades.map {|grade| grade.to_i }

  average = sprintf('%.1f', student_grades.reduce(:+) / student_grades.count.to_f)
end

def letter_grade(average_score)
  if average_score.to_f >= 90
    'A'
  elsif average_score.to_f >= 80
    'B'
  elsif average_score.to_f >= 70
    'C'
  elsif average_score.to_f >= 60
    'D'
  else
    'F'
  end
end

grade_text_file_array = []
raw_grade_data.each do |row|
  student_avg_score = average_score(raw_grade_data, row["Student_last"], row["Student_first"])

  grade_text_file_array << {"Student_last" => row["Student_last"], "Student_first" => row["Student_first"], "Average_score" => student_avg_score, "Letter_grade" => letter_grade(student_avg_score)}
  
  puts "#{row["Student_last"]}, #{row["Student_first"]}: #{student_avg_score}, #{letter_grade(student_avg_score)}"
end


column_names = grade_text_file_array.first.keys
CSV.open('teach-write.csv', 'w') do |csv|
  csv << column_names
  grade_text_file_array.each do |row|
    csv << row.values
  end
end


