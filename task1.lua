function main()
    local str = 'some test string 1234 lol'
    print('Incoming String: ', str)
    local strASCIIArray = {}
    str_array = fromStrToHex(str)

    str_array = quicksort(str_array)---, 1, #str_array)
    print('Sorted String in ASCII: ', table.concat(str_array,":"))
    result_str = table.concat(fromHexToStr(str_array))

    print('Outgoing String: ', result_str)
end

function quicksort(t)
  if #t<2 then return t end
  local pivot=t[1]
  local a,b,c={},{},{}
  for _,v in ipairs(t) do
    if     v<pivot then a[#a+1]=v
    elseif v>pivot then c[#c+1]=v
    else                b[#b+1]=v
    end
  end
  a=quicksort(a)
  c=quicksort(c)
  for _,v in ipairs(b) do a[#a+1]=v end
  for _,v in ipairs(c) do a[#a+1]=v end
  return a
end

function fromStrToHex(str) 
    local hex_array = {}
    for i = 1, #str do
        hex_array[i] = string.byte(str, i)
    end
    print('Incoming String in ASCII: ', table.concat(hex_array,":"))
    return hex_array
end

function fromHexToStr(incoming_str)
    local result_str = {}
    for i = 1, #incoming_str do
        result_str[i] = string.char(incoming_str[i])
    end
    return result_str
end


function getInsertTable ()
    local str = 'some test string 1234 lol'
    local str_array = {}

    for i = 1, #str do
        str_array[i] = str:sub(i, i)
    end

    local grid_letter = {}
    local grid_count = {}

    table.insert(grid_letter, str_array[i])
    table.insert(grid_count, 1)

    for i = 1, #str_array do
        found = 0
        for k = 1, #grid_letter do
            if str_array[i] == grid_letter[k] then
                grid_count[k] = grid_count[k] + 1
                found = 1
            end
        end
        if found == 0 then
            table.insert(grid_letter, str_array[i])
            table.insert(grid_count, 1)
        end
    end

    length = #grid_letter
    for i = 1, length do
        print(grid_letter[i], " -- ", grid_count[i])
    end

end

main()

-- getInsertTable()
-- thisFuckingTask()
