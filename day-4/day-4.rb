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
  valid_ps = 0
  input.each do |ln|
    larr = ln.split
    if larr.length == larr.uniq.length
      valid_ps += 1
    end
  end
  puts valid_ps
end

def part_two(input)
  valid_ps = 0
  input.each do |ln|
    larr = ln.split
    larr.each_with_index do |w,i|
      larr[i] = w.split('').sort.join
    end
    if larr.length == larr.uniq.length
      valid_ps += 1
    end
  end
  puts valid_ps
end

input_file = File.readlines('day-4-input.txt').map(&:chomp)

# part_one(input_file) # 383
part_two(input_file) # 265
