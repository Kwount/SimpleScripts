function main(lines_of_table)
    local initial_table = {}
    for i = 1, lines_of_table do
        table.insert(initial_table,string.random(7))
    end

    for i = 1, #initial_table do
        print(initial_table[i])
    end    

    print('-------------------------')
    print("String with max count of numbers: [",getStringWithMaxCountOfNumbers(initial_table),"]")
    local index = function_name(initial_table)
    -- print("String with max count of numbers: [", initial_table[index],"]; № line: ", index)
    print('-------------------------')

    local sorted_table = sortTable(initial_table)

    for i = 1, #sorted_table do
        print(sorted_table[i])
    end
end

function sortTable(tbl) 

    if #tbl < 2 then return tbl end
    local pivot = getCountOfNumbers(tbl[1])

    local a,b,c = {},{},{}
    for _,v in ipairs(tbl) do
        if     getCountOfNumbers(v) < pivot then a[#a+1] = v
        elseif getCountOfNumbers(v) > pivot then c[#c+1] = v
        else                                     b[#b+1] = v
        end
    end

    a = sortTable(a)
    c = sortTable(c)

    for _,v in ipairs(b) do a[#a+1] = v end
    for _,v in ipairs(c) do a[#a+1] = v end
    return a
end

function getCountOfNumbers (str) 
    local count_of_numbers = 0

    for i = 1, #str do
        local current_value = string.byte(str:sub(i, i))
        if current_value >= 48 and current_value <= 57 then
            count_of_numbers = count_of_numbers + 1
        end
    end

    return count_of_numbers
end


local charset = {}

-- qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890
-- for i = 48,  57 do table.insert(charset, string.char(i)) end
for i = 65,  90 do table.insert(charset, string.char(i)) end
for i = 97, 122 do table.insert(charset, string.char(i)) end

function string.random(length)
  -- math.randomseed(os.time())

  if length > 0 then
    return string.random(length - 1) .. charset[math.random(1, #charset)]
  else
    return ""
  end
end

function getStringWithMaxCountOfNumbers(tbl)

    local sorted_table = sortTable(tbl)
    if getCountOfNumbers(sorted_table[#sorted_table]) == 0 then
        return "No such string"
    else
        return sorted_table[#sorted_table]
    end

end

function tableHaveAStringWithNumbers(tbl)
    for i = 1, #tbl do
        if (getCountOfNumbers(tbl[i])) ~= 0 then
            return 1 -- yes
        end
    end
    return 0 -- no
end

function function_name( tbl )
    local index = 0
    local count_of_numbers = 0
    for i = 1 , #tbl do
        local value = getCountOfNumbers(tbl[i])
        if value > count_of_numbers then
            index = i
            count_of_numbers = value
        end
    end

    return index
end





main(8)
