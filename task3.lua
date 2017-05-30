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
