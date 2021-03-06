module RServiceBus
    
    #A means for a stand-alone process to interact with the bus, without being a full
    #rservicebus application
    class Agent
        
        def getAgent( uri )
            if uri.scheme == "beanstalk" then
                require "rservicebus/Agent/Beanstalk"
                return Agent_Beanstalk.new()
                elsif uri.scheme == "bunny" then
                require "rservicebus/Agent/Bunny"
                return Agent_Bunny.new()
                else
                raise StandardError.new( "Scheme not recognised" )
                
            end
        end
    end
end