class Message < ActiveRecord::Base
	validates :title, 	presence: true, length: {minimum: 5 , maximum: 30} 
	validates :text, presence: true, length: {minimum: 5 }

	before_save do
		self.minicrewan_title = Message.minicrypt(self.title)
		self.minicrewan_message = Message.minicrypt(self.text)
	end

	







	def self.minicrypt(text)
		human_to_minicrewan = {"a" => "i","e"=> "o","i"=> "u","o"=> "a","u" => "e","b"=>"q","c"=> "r","d" => "s", "f" => "j","g"=> "v","h" => "w","j" => "y","k" => "z","l" => "p","m" =>"b","n" => "c","p" => "t","q" => "f","r" => "g","s" => "h","t" => "x","v"=> "k","w" => "l","x" => "m","y" => "n","z" => "d"}
		translated_text = ""

		text = text.downcase
		text.split("").each do |i|
				translated_character = human_to_minicrewan[i]
				if translated_character.nil?
					translated_text = translated_text + i
				else
					translated_text = translated_text + translated_character
				end
		end

		return translated_text 
	end


end
