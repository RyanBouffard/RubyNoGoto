=begin
Author: Ryan Bouffard
Date: 11/28/19

Description: The purpose of the program is to find the first row of a 2d matrix that
consists of only zeroes. The program must not use any gotos, breaks, continues, 
exception handling, or function returns to make it work. Didn't use any language constructs
that are considered out of the ordinary.

=end
class First_row

  def initialize(row_size, col_size)  
    # Author: Ryan Bouffard
    # Date: 11/28/19
    # Function: initialize : constructor
    # Parameters: row_size, col_size
    # Return: none
    # Description: Constructor that takes in row/col and creates an array with the sizes.
    @array_row_size = row_size  
    @array_col_size = col_size  
    @my_array = Array.new(@array_row_size){Array.new(@array_col_size)}
  end







  def populate_array()
    # Author: Ryan Bouffard
    # Date: 11/28/19
    # Function: populate_array()
    # Parameters: none
    # Return: none
    # Description: Populates array with ones or zeroes, high chance of zeroes.
    #              Uses a random number generator similar to one used in example.
    #              If by chance no row is found with all zeroes, uncomment lines 43-47 below
    for row in 0...20
      for col in 0...10
        x = rand()
        y = rand()
        z = (y * (x**3)).round()      
        @my_array[row][col] = z
      end
    end
    #for row in 19...20        #if no other row is all zeroes, the last one will be the be
    #  for col in 0...10        # for testing purposes
    #    @my_array[row][col] = 0
    #  end
    #end
  end

  def print_array()
    # Author: Ryan Bouffard
    # Date: 11/28/19
    # Function: print_array()
    # Parameters: none
    # Return: none
    # Description: Prints the array in a formatted table.
    i = 0
    @my_array.each { |x|
    if i <10
      puts "row: #{i}:    "+ x.join("     ")
      i+=1
    else
      puts "row: #{i}:   "+ x.join("     ")
      i+=1
    end
    }
  end

  def find_first_all_zero_row()
    # Author: Ryan Bouffard
    # Date: 11/28/19
    # Function: find_first_all_zero_row()
    # Parameters: none
    # Return: none
    # Description: Finds the first row that consists of all zeroes in an array.
    #              If no rows consist solely of zeroes, prints "No solution found"
    row = 0
    solution_found = false
    while solution_found == false && row < @array_row_size
        zero_counter = 0
        for col in 0...@array_col_size   
          if @my_array[row][col] == 0.0
          zero_counter +=1
          end
        end
        if zero_counter == @array_col_size
          solution_found = true
          puts "First all-zero row is: row #{row}"
        end
        if row == @array_row_size-1 && solution_found == false
          solution_found = true
          puts "No solution found"
        end
        row +=1
    end
end

    # Function: main()
    # Parameters: none
    # Return: none
    # Description: While not actually a function, as ruby does not have a main function,
    #              this is the driver code that creates a First_row object, prints the array,
    #              and calls the function to find the first non-zero row.

FR1 = First_row.new(20, 10) 

FR1.populate_array()
FR1.print_array()
FR1.find_first_all_zero_row()

end