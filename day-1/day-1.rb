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
require 'set'

# Function definitions
def part_one(input)
  captcha = input[0].split('')
  sum = 0
  captcha.each_with_index do |c,i|
    if (i == captcha.length - 1) and (captcha[0] == captcha[i])
      sum += captcha[i].to_i
    elsif captcha[i] == captcha[i + 1]
      sum += captcha[i].to_i
    end
  end
  puts sum
end

def part_two(input)
  captcha = input[0].split('')
  shift = captcha.length/2
  sum = 0
  captcha.each_with_index do |c,i|
    nxt_num = (i + shift) % captcha.length
    if captcha[i] == captcha[nxt_num]
      sum += captcha[i].to_i
    end
  end
  puts sum
end

input_file = File.readlines('day-1-input.txt').map(&:chomp)

# part_one(input_file) # 1203
part_two(input_file) # 1146
