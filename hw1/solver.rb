# Jason Stumbaugh
# Cloud Computing Homework 1
# 8/24/2016

class Solver
  attr_accessor :words, :file_name

  def initialize(file_name)
    @file_name  = file_name
    @words = []
  end

  def solve
    create_words
    sort_words

    print_output
  end

  def print_output
    puts "-----------------------------------------------------"
    puts "--- Output for:                #{file_name} ----"
    puts "--- Unique Anagrams:           #{num_unique} (#{total} total) --"
    puts "--- Length of Longest Anagram: #{len_longest} --------------------"
    puts "-----------------------------------------------------"
  end

  def num_unique
    @words.uniq.length
  end

  def len_longest
    @words.max_by(&:length).length
  end

  def total
    @words.length
  end

  def sort_words
    @words.sort
  end

  def create_words
    file = File.open(file_name, "r")
    file.each_line do |word|
      add_word(word.downcase.chars.sort.join)
    end
  end

  def add_word(word)
    @words << word
  end
end

puts "Jason Stumbaugh \nCloud Computing Homework 1\n"
puts
input = ""
while input
  print "Please Enter a file name ('quit' to quit): "
  input = gets.chomp
  break if input == "quit"

  Solver.new(input).solve
end
