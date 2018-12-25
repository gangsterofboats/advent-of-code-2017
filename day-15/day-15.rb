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
  gen_a, gen_b = input[0].scan(/\d+/)[0].to_i, input[1].scan(/\d+/)[0].to_i
  match_ct = 0
  1.upto(40000000) do
    b_gen_a, b_gen_b = gen_a.to_s(2), gen_b.to_s(2)
    b_gen_a, b_gen_b = b_gen_a.rjust(32, '0'), b_gen_b.rjust(32, '0')
    match_ct += 1 if b_gen_a.reverse[0..15].reverse == b_gen_b.reverse[0..15].reverse
    gen_a = (16807 * gen_a) % 2147483647
    gen_b = (48271 * gen_b) % 2147483647
  end
  puts match_ct
end

def part_two(input)
  gen_a, gen_b = input[0].scan(/\d+/)[0].to_i, input[1].scan(/\d+/)[0].to_i
  match_ct = 0
  5000000.times do
    gen_a = (16807 * gen_a) % 2147483647
    gen_b = (48271 * gen_b) % 2147483647

    gen_a = (16807 * gen_a) % 2147483647 until gen_a % 4 == 0
    gen_b = (48271 * gen_b) % 2147483647 until gen_b % 8 == 0
    b_gen_a, b_gen_b = gen_a.to_s(2), gen_b.to_s(2)
    b_gen_a, b_gen_b = b_gen_a.rjust(32, '0'), b_gen_b.rjust(32, '0')
    match_ct += 1 if b_gen_a.reverse[0..15].reverse == b_gen_b.reverse[0..15].reverse
  end
  puts match_ct
end

input_file = File.readlines('day-15-input.txt').map(&:chomp)

part_one(input_file) # 619
part_two(input_file) # 290
