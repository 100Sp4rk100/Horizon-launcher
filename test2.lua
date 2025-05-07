dofile("os/Network Management/InternetProtocol.lua")

INTERNET = InternetProtocol:new("default", "", "default")
INTERNET:enableInternet()
--INTERNET:removeIpStatic()
INTERNET:setIpStatic()
print("IP : "..INTERNET:getIp())

INTERNET:send(INTERNET:makeRequest("get", "azerty", "201621238", "0", {["site"]="false"}))
INTERNET:send(INTERNET:makeRequest("get", "STtest/data.dat", "201621238", "0", {["site"]="true", ["value"]="test"}))
INTERNET:send(INTERNET:makeRequest("get", "qwerty", "201621238", "0", {["site"]="false"}))
INTERNET:send(INTERNET:makeRequest("sen", "STtest/data.dat", "201621238", "0", {["site"]="true", ["value"]="TESTTEST", ["name"]="testTEST"}))

while true do

    INTERNET:receive()
    local packets = INTERNET:getPacket()
    for i, line in ipairs(packets) do

        print(line["packet"].." => ",line["info"]["args"]["value"])
        INTERNET:deletePacket(i)
        
    end

end