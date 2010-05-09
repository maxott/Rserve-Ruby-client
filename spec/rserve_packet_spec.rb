require File.dirname(__FILE__)+"/spec_helper.rb"

describe Rserve::Packet do
  it "should return ok if cmd is not an error" do
    packet=Rserve::Packet.new(Rserve::Protocol::RESP_OK,[1,2,3,4])
    packet.should be_ok
    packet.should_not be_error
  end
  it "should return error if cmd is an error" do
    packet=Rserve::Packet.new(Rserve::Protocol::RESP_ERR,[1,2,3,4])
    packet.should be_error
    packet.should_not be_ok
  end
  it "should return an coherent to_s" do
    packet=Rserve::Packet.new(Rserve::Protocol::RESP_OK,[1,2,3,4])
    packet.to_s.should match /Packet\[cmd=\d+,len=\d,con='.+'\]/
  end

end
