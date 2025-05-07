function addTextInFile(nomFichier, texte)
    local fichier = fs.open(nomFichier, "a")
    if not fichier then
        error("Can't open the file: " .. nomFichier)
    end

    fichier.write(texte)
    fichier.write("\n")
    fichier.close()
end

function readFile(nomFichier)
    local lignes = {}
    local fichier = fs.open(nomFichier, "r")
    if not fichier then
        error("Can't find file: " .. nomFichier)
    end

    while true do
        local ligne = fichier.readLine()
        if not ligne then break end
        table.insert(lignes, ligne)
    end

    fichier.close()
    return lignes
end

function encrypt(texte, cle)
    if texte == nil or cle == nil then
        error("Encrypt function needs values!")
    end

    local texteChiffre = ""
    local cleIndex = 1
    local cleLongueur = #cle

    for i = 1, #texte do
        local char = texte:sub(i, i)
        local code = string.byte(char)
        local decalage = string.byte(cle:sub(cleIndex, cleIndex)) % 256

        local nouveauCode = (code + decalage) % 256
        texteChiffre = texteChiffre .. string.char(nouveauCode)

        cleIndex = cleIndex + 1
        if cleIndex > cleLongueur then
            cleIndex = 1
        end
    end

    return texteChiffre
end

function compileFile(src)

    local content = readFile(src)
    print("Compilation of : "..src)

    addTextInFile(FOLDERTOCOMPILE .. "-compiled", encrypt(src, "auzgyqrzehvfubgfdyu"))

    for _, ligne in ipairs(content) do

        addTextInFile(FOLDERTOCOMPILE .. "-compiled", encrypt(ligne, "auzgyqrzehvfubgfdyu"))

    end

    addTextInFile(FOLDERTOCOMPILE .. "-compiled", encrypt("$$$", "auzgyqrzehvfubgfdyu"))

end

function browse(src)

    if not fs.exists(src) then

        error("Source directory does not exist.")

    end

    if not fs.isDir(src) then

        error("Source is not a directory.")

    end

    for _, item in pairs(fs.list(src)) do

        local srcPath = fs.combine(src, item)

        if fs.isDir(srcPath) then

            browse(srcPath)

        else

            addTextInFile("log", srcPath)
            compileFile(srcPath)

        end

    end

    sleep(0)

end

print("Folder to compile:")
FOLDERTOCOMPILE = io.read()

if fs.exists(FOLDERTOCOMPILE .. "-compiled") then

    fs.delete(FOLDERTOCOMPILE .. "-compiled")

end

if fs.exists("log") then

    fs.delete("log")

end

print("Starting compilation...")

addTextInFile(FOLDERTOCOMPILE .. "-compiled", encrypt("$$$", "auzgyqrzehvfubgfdyu"))

browse(FOLDERTOCOMPILE)

print("Compilation successful!")
