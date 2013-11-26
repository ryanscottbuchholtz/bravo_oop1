# raw_grade_data = [  {"Student_last"=>"Smith", "Student_first"=>"Johnny", "Assignment_1"=>"100", "Assignment_2"=>"80", "Assignment_3"=>"75", "Assignment_4"=>"78", "Assignment_5"=>"60"}, 
                    # {"Student_last"=>"Strong", "Student_first"=>"Sally", "Assignment_1"=>"100", "Assignment_2"=>"100", "Assignment_3"=>"90", "Assignment_4"=>"95", "Assignment_5"=>"85"}, 
                    # {"Student_last"=>"Fallon", "Student_first"=>"Jimmy", "Assignment_1"=>"95", "Assignment_2"=>"97", "Assignment_3"=>"85", "Assignment_4"=>"40", "Assignment_5"=>"85"}, 
                    # {"Student_last"=>"Botsworth", "Student_first"=>"Chris", "Assignment_1"=>"98", "Assignment_2"=>"86", "Assignment_3"=>"85", "Assignment_4"=>"82", "Assignment_5"=>"80"}, 
                    # {"Student_last"=>"Boyd", "Student_first"=>"Bryan", "Assignment_1"=>"50", "Assignment_2"=>"60", "Assignment_3"=>"65", "Assignment_4"=>"70", "Assignment_5"=>"75"}]


require 'csv'

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
raw_grade_data = grade_import.grade_data



def average_score(grades, last_name, first_name)
  student_info = grades.select { |row| row["Student_last"] == last_name && row["Student_first"] == first_name}[0]
  
  student_grades = student_info.reject {|k,v| !k.downcase.include?('assign')}.values
  student_grades = student_grades.map {|grade| grade.to_i }

  avg_grade = sprintf('%.1f', student_grades.reduce(:+) / student_grades.count.to_f)

    print student_grades
    print avg_grade
  end

average_score(raw_grade_data, "Smith", "Johnny")
