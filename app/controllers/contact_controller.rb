class ContactController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
     respond_to do |format|
       # UserMailer.welcome(@user).deliver_now
       # format.html { render json: { :hello => "world"} }
       format.html { redirect_to root_path, notice: 'User was successfully created.' }
        # format.json { render :show, status: :created, location: @user }

     end

  end
end
