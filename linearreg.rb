#put your data here
data = [12, 32, 24, 23, 25, 30, 45, 23, 19, 28, 67]

#receives an array of data and a period (from 0 to ...) 
#to work with

def linear_regression_values(array, h)
	n = array.size
	puts "array size: #{n}"
	lp = array.size - 1
	puts "last position: #{lp}"
	sumx = 0
	(0..n).each { |i| sumx += i }
	puts "sumx: #{sumx}"
	averagex = sumx.to_f / n
	puts "period average: #{averagex.round(2)}"
	sumy = 0
	(0..lp).each { |i| sumy += array[i] }
	sumy.to_f
	puts "sumy: #{sumy}"
	averagey = sumy.to_f / n
	puts "data average: #{averagey.round(2)}"		
	arr_xy = []
	(0..lp).each { |i| arr_xy[i] = (i + 1) * array[i] }
	sumxy = arr_xy.sum
	arrx_sqrt = []
	(0..lp).each { |i| arrx_sqrt[i] = (i + 1) * (i + 1) }
	sumx_sqrt = arrx_sqrt.sum

	puts "x * y sum: #{sumxy}"
	puts "x sqrt sum: #{sumx_sqrt}"
	
	b = ((n*sumxy)-(sumx*sumy)).to_f/((n*sumx_sqrt)-(sumx * sumx))
	puts "angular coeficient: #{b.round(2)}"
	a = averagey - (b * averagex)
	puts "linear coeficient: #{a.round(2)}"
	puts ""
	puts "f(y) = #{b.round(2)}x + #{a.round(2)}"
	puts ""
	y = []
	(0..(h - 1)).each { |i| y[i] = b * (i + 1) + a }
	(0..(h - 1)).map { |i| y[i] = y[i].round(2) }

	return y
end

def error(array1, array2)
	error = []
	for i in 0..(array1.size - 1)
		error[i] = (array1[i] - array2[i]).abs
	end
	return error
end

results = linear_regression_values(data, data.size)
for i in 0..(results.size - 1)
	puts "position #{i + 1} -> #{results[i]}"
end
puts ""
errors = error(results, data)
for i in 0..(errors.size - 1)
	puts "error #{i + 1} -> #{errors[i].round(2)}"
end
puts ""
def average(array)
	average = array.inject{ |sum, el| sum + el }.to_f / array.size
	return average.round(2)
end


puts "average error #{average(errors)}"
