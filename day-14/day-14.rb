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
require 'pp'

# Function definitions
def knot_hash(input)
  list = (0..255).to_a
  lengths = input.split('').map(&:ord) + [17, 31, 73, 47, 23]
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
  return dense_hash
end

def part_one(input)
  disk_map = []
  (0..127).each do |row|
    drow = "#{input}-#{row}"
    edrow = knot_hash(drow)
    map_row = ''
    edrow.each_char do |c|
      map_row += c.hex.to_s(2).rjust(4, '0')
    end
    map_row.gsub!('0', '.')
    map_row.gsub!('1', '#')
    disk_map.push(map_row)
  end
  used_ct = 0
  disk_map.join('').each_char do |ch|
    used_ct += 1 if ch == '#'
  end
  puts used_ct
end

def part_two(input)
  disk_map = []
  (0..127).each do |row|
    drow = "#{input}-#{row}"
    edrow = knot_hash(drow)
    map_row = ''
    edrow.each_char do |c|
      map_row += c.hex.to_s(2).rjust(4, '0')
    end
    map_row.gsub!('0', '.')
    map_row.gsub!('1', '#')
    disk_map.push(map_row)
  end
  used_ct = 0
  disk_map.join('').each_char do |ch|
    used_ct += 1 if ch == '#'
  end
  IO.write('map.txt', disk_map.join("\n"))
end

input_str = 'hxtvlmkl'

part_one(input_str) # 8214
part_two(input_str) # 1093
