#!/usr/bin/lua

-- Script para preencher uma lista HTML com itens a partir de um diretório
-- Uso:
--      lua generate-list.lua [arquivo-com-lista] [diretório-fonte]
--
--
local target = arg[1]
local source = arg[2]

local function scandir(directory)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('ls -a "'..directory..'"')
    for filename in pfile:lines() do
        i = i + 1
        t[i] = filename
    end
    pfile:close()
    return t
end

local function write_to(filename,lines)
    local file = io.open(filename,"w")

    io.output(file)

    for _,line in ipairs(lines) do
        io.write(line.."\n")
    end

    io.close(file)
end

local function remove_old_html_list(list_start,list_end,lines)
    if list_start and list_end then
        if list_end-list_start >= 1 then
            for i=1,list_end-list_start+1 do
                table.remove(lines,list_start)
            end
        end
    end
    local items = scandir(source)
    return list_start, lines, items
end

local function insert_new_html_list(list_start,lines,items)
    local j=3
    for i=list_start,list_start+(#items)-3 do
        table.insert(lines,i,"<li><a href=entries/"..items[j]..">"..string.gsub(items[j],".html","").."</a></li>")
        j = j+1
    end
    return lines
end

local function file_exists(filename)
    local file = io.open(filename,"rb")
    if file then file:close() end
    return file ~= nil
end

local function lines_from(filename)
    if not file_exists(filename) then return {} end
    local lines = {}
    for line in io.lines(filename) do
        lines[#lines+1] = line
    end
    return lines
end

local function find_html_list(lines)
    local list_start, list_end
    for k,v in ipairs(lines) do
        if string.find(v,"<ul>") then
            list_start = k+1
        elseif string.find(v,"</ul>") then
            list_end = k-1
        end
    end
    return list_start,list_end,lines
end

if target == nil or source == nil then
    print("Faltando argumentos: o script requer dois argumentos (target e source)")
    return 1
elseif not string.find(target,".html") then
    print("Target não é um arquivo HTML válido")
    return 2
elseif os.execute('ls -a "'..source..'" > /dev/null 2>&1') == nil or os.execute('ls -a "'..target..'" > /dev/null 2>&1') == nil then
    print("Target ou source não existem")
    return 3
else
    write_to(
        target,
        insert_new_html_list(
            remove_old_html_list(
                find_html_list(
                    lines_from(
                        target
                    )
                )
            )
        )
    )
end
