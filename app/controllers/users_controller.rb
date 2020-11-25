class UsersController < ApplicationController

  def index

    # Ransack

    @q = User.ransack(params[:q])
    @all_users = @q.result

    #

    @list_of_users = @all_users.order({ :first_name => :desc })
    
    render({ :template => "users/index.html.erb" })
  end

  def invite_user

    require 'twilio-ruby'

    @twilio_sid = ENV.fetch("TWILIO_ACCOUNT_SID")
    @twilio_token = ENV.fetch("TWILIO_AUTH_TOKEN")
    @twilio_sending_number = ENV.fetch("TWILIO_SENDING_PHONE_NUMBER")
    @twilio_client = Twilio::REST::Client.new(@twilio_sid, @twilio_token)
    @to= "+1" + params.fetch(:to)
    @alert_text = "alert_text"

    sms_parameters = {
    :from => @twilio_sending_number,
    :to => @to,
    :body => "Hi! #{@current_user.full_name} wants to coordinate their Booth courses with you. Join them here! https://coursesxgroup.herokuapp.com/"
    }

    @twilio_client.api.account.messages.create(sms_parameters)

    redirect_to("/users", { :alert => "The text message was sent!" })

  end
end