require 'timeout'
require "csv"

file1 = CSV.parse(File.read("problems.csv"))

def ask_question(question, answer, timer_answer)
  puts "\n=== NEW QUESTION ==="
  puts question
  Timeout::timeout(timer_answer) do
    user_ans = gets.chomp
    #triming whitespace and capitalization
    user_ans.strip!
    user_ans.downcase!
    return user_ans === answer
  end
rescue Timeout::Error
  return false
end

timer_answer = 5
score = 0
puts "Do u want to shuffle the quiz or not [y/n] "
choose = gets.chomp

#shuffle the quiz 
if choose =="y"
  file=file1.shuffle()
else
  file=file1
end

for a in 0..file.length-1 do
    correct = ask_question(file[a][0], file[a][1], timer_answer)
    score += 1 if correct
end

puts "Total number of Questions: #{file.length}"
puts "Number of correct Answers: #{score}"
