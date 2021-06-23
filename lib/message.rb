require 'twilio-ruby'

class Message 

  def send_sms
  
    account_sid = 'ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    auth_token = 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @client.messages.create(
      from: '+14159341234',
      to: '+16105557069',
      body: 'Thank you for your order!'
    )
  
  end
end