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
  registers = Hash.new(0)
  input.each do |line|
    action, cond = line.split(' if ')
    if action.include? 'dec'
      action.sub!('dec', '-')
    else
      action.sub!('inc', '+')
    end
    act_reg, action = action.split(' ', 2)
    cond_reg, cond = cond.split(' ', 2)
    if (eval "#{registers[cond_reg]} #{cond}")
      registers[act_reg] = eval "#{registers[act_reg]} #{action}"
    end
  end
  puts registers.values.max
end

def part_two(input)
  registers = Hash.new(0)
  max = 0
  input.each do |line|
    action, cond = line.split(' if ')
    if action.include? 'dec'
      action.sub!('dec', '-')
    else
      action.sub!('inc', '+')
    end
    act_reg, action = action.split(' ', 2)
    cond_reg, cond = cond.split(' ', 2)
    if (eval "#{registers[cond_reg]} #{cond}")
      registers[act_reg] = eval "#{registers[act_reg]} #{action}"
    end
    if registers.values.max > max
      max = registers.values.max
    end
  end
  puts max
end

input_file = File.readlines('day-8-input.txt').map(&:chomp)

part_one(input_file) # 6012
part_two(input_file) # 6369
