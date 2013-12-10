#[#<CSV::Row "Student_name":"Smith,Johnny" "Assignment_1":"100" "Assignment_2":"80" "Assignment_3":"75" "Assignment_4":"78" "Assignment_5":"60">, 
#<CSV::Row "Student_name":"Strong,Sally" "Assignment_1":"100" "Assignment_2":"100" "Assignment_3":"90" "Assignment_4":"95" "Assignment_5":"85">, 
#<CSV::Row "Student_name":"Fallon,Jimmy" "Assignment_1":"95" "Assignment_2":"97" "Assignment_3":"85" "Assignment_4":"40" "Assignment_5":"85">, 
#<CSV::Row "Student_name":"Botsworth,Chris" "Assignment_1":"98" "Assignment_2":"86" "Assignment_3":"85" "Assignment_4":"82" "Assignment_5":"80">, 
#<CSV::Row "Student_name":"Boyd,Bryan" "Assignment_1":"50" "Assignment_2":"60" "Assignment_3":"65" "Assignment_4":"70" "Assignment_5":"75">]

require 'csv'
require 'table_print'

puts ''
print "Welcome to the Teachers Assistant.  Which file would you like to review? ==>   "
print ''

file_name = gets.chomp

grade_data_array = []  #this is a CSV::Row object
grade_data_hash = [] #only use for TP

  CSV.foreach(file_name, headers:true) {|row| grade_data_array << row}
    grade_data_hash = grade_data_array.map { |row| row.to_hash }

puts '' 
puts "The grades for this class are:"
puts ''
tp grade_data_hash
puts ''

puts "The average score for each student in this class is:"
puts ''
