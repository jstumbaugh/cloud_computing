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
    print_output
  end

  def print_output
    puts "----------------------------------------------------------"
    puts "--- Output for:                #{file_name} ---------"
    puts "--- Unique Anagrams:           #{num_anagrams} (#{total} total words) --"
    puts "--- Length of Longest Anagram: #{len_longest} -------------------------"
    puts "----------------------------------------------------------"
  end

  def num_anagrams
    anagrams.length
  end

  def len_longest
    anagrams.max_by(&:length).length
  end

  def anagrams
    @words.group_by{|e| e}.select {|k,v| v.size > 1}.map(&:first)
  end

  def total
    @words.length
  end

  def create_words
    file = File.open(file_name, "r")
    file.each_line do |word|
      add_word(word.chomp.downcase.chars.sort.join)
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
