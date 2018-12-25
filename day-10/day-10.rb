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
  list = (0..255).to_a
  curr_pos = 0
  skip_size = 0
  lengths = input[0].split(',').map(&:to_i)
  lengths.each do |l|
    rev_items = (list * 2)[curr_pos...curr_pos+l].reverse
    (0...l).each do |i|
      j = (curr_pos + i) % list.length
      list[j] = rev_items[i]
    end
    curr_pos = (curr_pos + l + skip_size) % list.length
    skip_size += 1
  end
  puts list[0] * list[1]
end

def part_two(input)
  list = (0..255).to_a
  lengths = input[0].split('').map(&:ord) + [17, 31, 73, 47, 23]
  curr_pos = 0
  skip_size = 0
  64.times do
    lengths.each do |l|
      rev_items = (list * 2)[curr_pos...curr_pos+l].reverse
      (0...l).each do |i|
        j = (curr_pos + i) % list.length
        list[j] = rev_items[i]
      end
      curr_pos = (curr_pos + l + skip_size) % list.length
      skip_size += 1
    end
  end
  dense_hash = ''
  list.each_slice(16) do |ls|
    h_no = ls.reduce(0) {|xof,i| xof ^=i}
    h_part = h_no.to_s(16)
    h_part = '0' + h_part if h_part.length == 1
    dense_hash += h_part
  end
  puts dense_hash
end

input_file = File.readlines('day-10-input.txt').map(&:chomp)

part_one(input_file) # 38628
part_two(input_file) # e1462100a34221a7f0906da15c1c979a
