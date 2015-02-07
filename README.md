# ConnectFour

A connect four clone written in test driven development (rspec) for [The Odin Project](http://www.theodinproject.com/ruby-programming/testing-ruby). To play it, run `bin/connect_four.rb` from the root directory. To test it, run `rspec` from the root directory.

To check if there is a winner I have used my own implementation of two matrix operations: rotating and picking up diagonals. Then I have used regex to check if there are four neighbouring characters next to each other.
