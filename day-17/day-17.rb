#!/usr/bin/env ruby
################################################################################
# Copyright (C) 2018 Michael Wiseman                                           #
#                                                                              #
# This program is free software: you can redistribute it and/or modify it      #
# under the terms of the GNU Affero General Public License as published by the #
# Free Software Foundation, either version 3 of the License, or (at your       #
# option) any later version.                                                   #
#                                                                              #
# This program is distributed in the hope that it will be useful, but WITHOUT  #
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or        #
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License #
# for more details.                                                            #
#                                                                              #
# You should have received a copy of the GNU Affero General Public License     #
# along with this program.  If not, see <https://www.gnu.org/licenses/>.       #
################################################################################

# Function definitions
def part_one(input)
  circle = [0]
  cidx = 0

  1.upto(2017) do |i|
    cidx = (cidx + input) % circle.length
    circle.insert(cidx + 1, i)
    cidx = circle.index(i)
  end
  puts circle[circle.index(2017) + 1]
end

def part_two(input)
  circle = [0]
  cidx = 0

  1.upto(50000000) do |i|
    cidx = (cidx + input) % circle.length
    circle.insert(cidx + 1, i)
    cidx = circle.index(i)
  end
  puts circle[circle.index(0) + 1]
end

input_no = 366

part_one(input_no) # 1025
part_two(input_no) # 37803463
