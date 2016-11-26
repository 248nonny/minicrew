class MessagesController < ApplicationController
	http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

	def index
		@messages = Message.all
	end	

	def new
		@message = Message.new
	end

	def edit
		@message = Message.find(params[:id])
	end

	def update
		@message = Message.find(params[:id])

		if @message.update(message_params)
			redirect_to @message
		else
		render 'edit'	
		end	
	end

	def create
		#binding.pry
		@message = Message.new(message_params)
		if (@message.save)
			redirect_to @message
		else
			render 'new'
		end
	end

	def show
		@message = Message.find(params[:id])
	end	

	def destroy
		@message = Message.find(params[:id]).destroy
	end

	private
	def message_params
		params.require(:message).permit(:title,:text,:minicrewan_title,:minicrewan_message)
	end
end