dofile("os/Network Management/InternetProtocol.lua")
dofile("os/Process Management/librairyExecution.lua")

INTERNET = InternetProtocol:new("default", "", "default")

-- args[1] => site (true/false)
-- args[2] => ressource path
-- args[3] => id request
-- args[4] => ip/ domain name
-- args[5] => value name (only for site = true)

print(runLib("Internet Gestion", "getValueINT", {false, "qwerty", "testLIB", "201621238"}))
print(runLib("Internet Gestion", "getValueINT", {true, "STtest/data.dat", "testLIB2", "201621238", "q"}))



-- args[1] => site (true/false)
-- args[2] => ressource path
-- args[3] => id request
-- args[4] => ip/ domain name
-- args[5] => path to save it

print(runLib("Internet Gestion", "getFileINT", {false, "var.dat", "testLIB", "201621238", "$TEST$"}))
print(runLib("Internet Gestion", "getFileINT", {true, "STtest/data.dat", "testLIB2", "a.a", "$TEST$"}))

-- args[1] => site (true/false)
-- args[2] => ressource path (only for site = true, else put "")
-- args[3] => id request
-- args[4] => ip/ domain name
-- args[5] => name of value
-- args[6] => value

print(runLib("Internet Gestion", "sendValueINT", {true, "STtest/data.dat", "testLIB2", "a.a", "HggH", "LOLlolLOL"}))
print(runLib("Internet Gestion", "sendValueINT", {false, "", "testLIB2", "a.a", "coucou", "congolais"}))