# take first number
#take modifier
#take last number
#puts result
#error checking
#user input and modifiers should be checked for proper input type
#result should set first_number and allow for another modilier and last number so result continues to build until the user decides to clear the calculator
#make +-*/work
#make clear work

@arr = []




  def calculator_modifier
    arr = ['*', '/', '+', '-']
    @typed_modifier = gets.chomp
    if arr.include?(@typed_modifier)
      # valid modifier
      @arr << @typed_modifier
    else
      puts "Invalid input: please enter a valid modifier."
      # invalid operator, ask them to input a valid one instead
      # figure out how to let the user know if its invalid and try to get a valid one
      calculator_modifier
    end
  end

  #make clear bring you back to calc Menu

  def first_number
      begin
        @first_number = gets.chomp
        @first_number = Float(@first_number)
      rescue
        puts 'Invalid number'
        retry # this will take you back to begin
      end
    @arr << @first_number
  end

  def second_number
    begin
      @second_number = gets.chomp
      @second_number = Float(@second_number)
    rescue
      puts 'Invalid number'
      retry
    end
    @arr << @second_number
  end

  def calculator_result
    first_number_result = @arr[0]
    operator = @arr[1]
    second_number_result = @arr[2]
    if operator == "+"
      print "The addition result is\t"
      puts first_number_result + second_number_result
      calculator_menu
    elsif operator == "-"
      print "The subtraction result is\t"
      puts first_number_result - second_number_result
      calculator_menu
    elsif operator == "*"
      print "The multiplication result is\t"
      puts first_number_result * second_number_result
      calculator_menu
    elsif operator == "/"
      print "The division result is\t"
      puts first_number_result / second_number_result
      calculator_menu
    else
      puts "Error"
      calculator_menu

    end
    puts "\n"

  end

def exit_calc
  puts "Do you wish to exit? \nPlease choose a number."
  puts "1) Yes \n2) No"
  yes_no = gets.chomp.to_i
  case yes_no
  when 1
    quit_yes
  when 2
    quit_no
  else
    puts "Error: Please type 1 or 2."
    exit_calc
  end
end

def quit_yes
  puts "Good-Bye!"
end

def quit_no
  calculator_menu
end

def clear_calc
@arr.delete_at(0)
@arr.delete_at(0)
@arr.delete_at(0)
calculator_menu
end

def calculator
  puts 'What\'s the first number?'
  first_number
  puts 'What\'s the modifier?'
  calculator_modifier
  if ((@first_number == 0) && (@typed_modifier == "/"))
    puts "Error: Undefined"
    calculator
  end
  puts 'What\'s the second number?'
  second_number
  calculator_result
end

def calculator_menu
  puts 'Welcome to the ruby calculator'
  puts "What would you like to do?
  1) Use calculator
  2) Clear
  3) Exit"
  user_choice = gets.chomp.to_i
  case user_choice
  when 1
    calculator
  when 2
    clear_calc
  when 3
    exit_calc
  else
    puts "Error: Please enter valid input"
    calculator_menu
  end
end
calculator_menu
