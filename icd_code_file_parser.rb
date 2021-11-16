require 'fixed_width_file_parser'

fields = [
  { name: 'code', position: 0..7 },
  { name: 'description', position: 9..-1 }
]   

filename = "C:/Users/ratne/Ruby Projects/2022-Code Descriptions/Code Descriptions/icd10cm_codes_2022.txt"

FixedWidthFileParser.parse(filename, fields, force_utf8_encoding: false) do |row| 
  puts "ICD Code: \"#{row[:code]}\" & Description: \"#{row[:description]}\""
end