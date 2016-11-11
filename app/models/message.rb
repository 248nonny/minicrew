class Message < ActiveRecord::Base
	validates :title, 	presence: true, length: {minimum: 5 , maximum: 30} 
	validates :text, presence: true, length: {minimum: 5 }												
end
