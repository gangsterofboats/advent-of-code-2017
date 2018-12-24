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
  configs = []
  config = input[0].split.map(&:to_i)
  cycles = 0
  loop do
    mx_num = config.max
    mx_idx = config.index(mx_num)
    curr_idx = (mx_idx + 1) % config.length
    config[mx_idx] = 0

    mx_num.downto(1) do
      config[curr_idx] += 1
      curr_idx = (curr_idx + 1) % config.length
    end
    if not configs.include? config.to_s
      configs.push(config.to_s)
      cycles += 1
    else
      break
    end
  end
  puts cycles + 1
end

def part_two(input)
  configs = {}
  config = input[0].split.map(&:to_i)
  cycles = 0
  loop do
    mx_num = config.max
    mx_idx = config.index(mx_num)
    curr_idx = (mx_idx + 1) % config.length
    config[mx_idx] = 0

    mx_num.downto(1) do
      config[curr_idx] += 1
      curr_idx = (curr_idx + 1) % config.length
    end
    if not configs.include? config.to_s
      configs[config.to_s] = cycles
      cycles += 1
    else
      break
    end
  end
  puts cycles - configs[config.to_s]
end

input_file = File.readlines('day-6-input.txt').map(&:chomp)

# part_one(input_file) # 6681
part_two(input_file) # 2392
