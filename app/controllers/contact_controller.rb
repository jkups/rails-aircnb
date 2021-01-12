class ContactController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    UserMailer.contact_email(params[:name], params[:email], params[:message], params[:booking]).deliver_now

    render json: {sent:true}

  end #new
end #class
