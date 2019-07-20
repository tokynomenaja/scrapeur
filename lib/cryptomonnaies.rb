

require 'open-uri'
require 'nokogiri'


def crypto_name
	symb_array = []
	cost_array = []
	symb_cost_array = []
	all_cryptocurrencies = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	all_cryptocurrencies.xpath('//td[@class="text-left col-symbol"]').each do |symb|
		symb_array << symb.text
	end
	all_cryptocurrencies.xpath('//a[@class="price"]').each do |cost|
		cost_array << cost.text
	end
	cost_array.length.times do |i|

		symb_cost_array << {symb_array[i] => cost_array[i]}
	

		if symb_cost_array[i] == {symb_array[i] => cost_array[i]}
			return true
		end
	end

end
	crypto_name

