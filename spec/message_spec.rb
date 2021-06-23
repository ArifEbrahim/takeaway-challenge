require './lib/message.rb'

RSpec.describe Message do
  let(:client) { double :client }
  it "can send a text message" do
    twilio_message_body = { 
      from: '+14159341234',
      to: '+16105557069',
      body: 'Thank you for your order!'
    }
    account_sid = 'ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    auth_token = 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'

    allow(client).to receive_message_chain(:messages, :create).with(twilio_message_body)
    expect(Twilio::REST::Client).to receive(:new).with(account_sid, auth_token).and_return(client)
    subject.send_sms
  end

end