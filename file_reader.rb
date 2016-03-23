require 'pry'
class Filereader
  LocalFiles = ["comma.txt", "pipe.txt", "space.txt"]
  attr_accessor :person_array
  def initialize
    self.person_array = Array.new
    manipulate_files
    output_1
    output_2
    output_3
  end
# method - take in the files and read each line. Use regex to remove | , and whitespaces. Set everything as array
  def manipulate_files
    LocalFiles.each do |file_name|
      File.foreach("text_files/#{file_name}") do |line|
        case file_name
        when "comma.txt"
          removed_characters = line.gsub("-","/").split(/,|\|/).collect(&:strip)
          color = removed_characters.slice!(3)
          @person_array.push(removed_characters.push(color))
        when "pipe.txt"
          removed_characters = line.gsub("-","/").split(/,|\|/).collect(&:strip)
          removed_characters.slice!(2)
          color = removed_characters.slice!(3)
          removed_characters[2] = change_gender(removed_characters[2])
          @person_array.push(removed_characters.push(color))
        else
          removed_characters = line.gsub("-","/").split(/,|\||\s/).collect(&:strip)
          removed_characters.slice!(2)
          removed_characters[2] = change_gender(removed_characters[2])
          @person_array.push(removed_characters)
        end
      end
    end
  end

  def change_gender(gender)
    case gender
    when "M"
      return "Male"
    else
      return "Female"
    end
  end
  
# method - returns output 1
  def output_1
    binding.pry
  end
# method - returns output 2
  def output_2
  end
# method - returns output 3
  def output_3
    @person_array.sort.reverse
  end
end

read = Filereader.new