require("craicua")

function load_pico_8_file(pico_8_file_name)
   print(pico_8_file_name)
   local pico_8_file = io.open(pico_8_file_name, "r")
   local in_lua_section = false
   local lua_section = ""
   while true do
      local line = pico_8_file:read("L")
      if line == nil then break end
      if "__lua__" == line:sub(1,7) then
	 in_lua_section = true
      elseif "__gfx__" == line:sub(1,7) then
	 in_lua_section = false
      elseif in_lua_section then
	 lua_section = lua_section..line
      end
   end
   load(lua_section)()
end

