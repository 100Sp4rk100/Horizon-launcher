dofile("os/Network Management/InternetProtocol.lua")
dofile("os/File System Management/File Gestion/File Gestion.lua")

INTERNET = InternetProtocol:new("default", "", "default")
INTERNET:enableInternet()
--INTERNET:removeIpStatic()
INTERNET:setIpStatic()
print("IP : "..INTERNET:getIp())

INTERNET:send(INTERNET:makeRequest("fil", "STtest/data.dat", "201621238", "0", {["site"]="true", ["begin"]="true"}))

currentLine = ""
len = 0
fl = {}

while currentLine ~= len do

    INTERNET:receive()
    local packets = INTERNET:getPacket()

    for i, line in ipairs(packets) do

        if line["info"]["ip-sender"] == "201621238" or line["info"]["args"]["$ip-sender$"] == "201621238" then

            if line["info"]["args"]["begin"] == "true" then

                tit = line["packet"]
                len = line["info"]["args"]["length"]
                INTERNET:send(INTERNET:makeRequest("fil", "STtest/data.dat", "201621238", "0", {["site"]="true", ["begin"]="false", ["line"] = 1}))

            else

                table.insert(fl, line["packet"])
                currentLine = line["info"]["args"]["line"]
                INTERNET:send(INTERNET:makeRequest("fil", "STtest/data.dat", "201621238", "0", {["site"]="true", ["begin"]="false", ["line"] = currentLine + 1}))

            end

        end

        INTERNET:deletePacket(i)

    end

end

for _, l in ipairs(fl) do
    addTextInFile(tit, l)
end

INTERNET:send(INTERNET:makeRequest("fil", "var.dat", "201621238", "0", {["site"]="false", ["begin"]="true"}))

currentLine = ""
len = 0
fl = {}

while currentLine ~= len do

    INTERNET:receive()
    local packets = INTERNET:getPacket()

    for i, line in ipairs(packets) do

        if line["info"]["ip-sender"] == "201621238" or line["info"]["args"]["$ip-sender$"] == "201621238" then

            if line["info"]["args"]["begin"] == "true" then

                tit = line["packet"]
                len = line["info"]["args"]["length"]
                INTERNET:send(INTERNET:makeRequest("fil", "STtest/data.dat", "201621238", "0", {["site"]="true", ["begin"]="false", ["line"] = 1}))

            else

                table.insert(fl, line["packet"])
                currentLine = line["info"]["args"]["line"]
                INTERNET:send(INTERNET:makeRequest("fil", "STtest/data.dat", "201621238", "0", {["site"]="true", ["begin"]="false", ["line"] = currentLine + 1}))

            end

        end

        INTERNET:deletePacket(i)

    end

end

for _, l in ipairs(fl) do
    addTextInFile(tit, l)
end