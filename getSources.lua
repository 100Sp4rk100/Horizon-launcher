function copyDir(src, dest)
    if not fs.exists(src) then
        print("Source directory does not exist.")
        return
    end

    if not fs.isDir(src) then
        print("Source is not a directory.")
        return
    end

    if not fs.exists(dest) then
        fs.makeDir(dest)
    end

    for _, item in pairs(fs.list(src)) do
        local srcPath = fs.combine(src, item)
        local destPath = fs.combine(dest, item)
        
        if fs.isDir(srcPath) then
            copyDir(srcPath, destPath)
        else
            fs.copy(srcPath, destPath)
        end
    end
    print("Copy completed!")
end

-- Utilisation : remplace "source" et "destination" par les chemins souhaités
copyDir("rom", "PC-Sources")