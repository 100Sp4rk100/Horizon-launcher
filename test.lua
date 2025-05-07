dofile("os/Process Management/librairyExecution.lua")

INTERNET = InternetProtocol:new("default", "", "default")

reussi, path = runLib("Internet Gestion", "getFileINT", {true, "Tuto/tuto.wb", "loadSite", "a.a", "os/Libraries"})

if reussi then
    runLib("Compile To Website", "compileWebsiteFile", {"os/Libraries/tuto", "os/Temp/WebSite/Web"})
    runLib("Execute Website", "executeWebsite", {"WEb"})
end