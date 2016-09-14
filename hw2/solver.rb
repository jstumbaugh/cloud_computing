# Jason Stumbaugh
# Cloud Computing Homework 2
# 9/13/2016

class Solver
  attr_accessor :words, :file_name, :thread_num

  def initialize(file_name, thread_num)
    @file_name  = file_name
    @thread_num = thread_num
    @words      = []
  end

  def solve
    create_words
    print_output
  end

  def print_output
    puts
    puts "----------------------------------------------------------"
    puts "--- Output for:                #{file_name} ---------"
    puts "--- Thread Number:             #{thread_num} -------------------------"
    puts "--- Unique Anagrams:           #{num_anagrams} (#{total} total words) --"
    puts "--- Length of Longest Anagram: #{len_longest} characters --------------"
    puts "----------------------------------------------------------"
    puts
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

puts "Jason Stumbaugh \nCloud Computing Homework 2\n"
puts

puts "Starting calculations at #{Time.now}"
t1 = Thread.new { Solver.new("AnagramInputA.txt", 1).solve }
t2 = Thread.new { Solver.new("AnagramInputB.txt", 2).solve }
t3 = Thread.new { Solver.new("AnagramInputC.txt", 3).solve }
t4 = Thread.new { Solver.new("AnagramInputD.txt", 4).solve }

t1.join
t2.join
t3.join
t4.join
puts "Finished Calcualtions at #{Time.now}"
puts
