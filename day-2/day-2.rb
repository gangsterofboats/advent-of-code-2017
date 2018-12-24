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
  cksm = 0
  input.each do |line|
    larr = line.split.map(&:to_i)
    cksm += larr.max - larr.min
  end
  puts cksm
end

def part_two(input)
  cksm = 0
  input.each do |line|
    larr = line.split.map(&:to_i)
    larr.combination(2).to_a.each do |pr|
      if pr.max % pr.min == 0
        cksm += (pr.max / pr.min)
      end
    end
  end
  puts cksm
end

input_file = File.readlines('day-2-input.txt').map(&:chomp)

part_one(input_file) # 36174
part_two(input_file) # 244
