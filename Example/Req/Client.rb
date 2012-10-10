$:.unshift './../../lib'
require "rservicebus"
require "./Contract"

agent = RServiceBus::Agent_Beanstalk.new()

1.upto(2) do |request_nbr|
	agent.sendMsg(HelloWorld.new( "Hello World! " + request_nbr.to_s ), "HelloWorld", "helloResponse")
end

msg = agent.checkForReply( "helloResponse"  )
puts msg
msg = agent.checkForReply( "helloResponse"  )
puts msg


