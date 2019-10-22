class Image

  def initialize(array)
    @image = array
  end

  def find_ones
		ones = []
		@image.each_with_index do |row, row_num|
			row.each_with_index do |val, col_num|
				if val == 1
					ones << [row_num, col_num]
				end
			end
		end
		
		return ones
	
	end
	
	def blur(distance)
		ones = find_ones
			
		@image.each_with_index do |row, row_num|
			row.each_with_index do |val, col_num|
				ones.each do |found_row_num, found_col_num|

					if manhattan_distance(row_num, col_num, found_row_num, found_col_num) <= distance
						@image[row_num][col_num] = 1
					end
				end
			end
		end
	end
	
	def manhattan_distance (x1, y1, x2, y2)
		horiz_dist = (x2 - x1).abs
		vert_dist = (y2 - y1).abs
		horiz_dist + vert_dist
	end

	def output_image
    @image.each do |row|
      puts row.join
    end
  end
end

image = Image.new([
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 1, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 1],
])

image.blur(3)
image.output_image
