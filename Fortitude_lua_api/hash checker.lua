system.setScriptName("Hash Cheker")

system.registerConstructor(function()
  system.logInfo("Hash Checker Loaded")
end)

local hash_1 = 0xB71B8539
local hash_2 = 0x3A2305CA
local hash_3 = 0xBB1085F9
local hash_4 = 0xA5548697 -- invalid 

local function hashcheck()
  natives.streaming_requestModel(hash_1, true)
  natives.streaming_requestModel(hash_2, true)
  natives.streaming_requestModel(hash_3, true)
  natives.streaming_requestModel(hash_4, true)

  if natives.streaming_isModelValid(hash_1) then
    logger.logInfo(hash_1 .. " is a valid model. [hash_1]")
  else
    logger.logError(hash_1 .. " is not a valid model! [hash_1]")
  end

  if natives.streaming_isModelValid(hash_2) then
    logger.logInfo(hash_2 .. " is a valid model. [hash_2]")
  else
    logger.logError(hash_2 .. " hash 2 is not a valid model! [hash_2]")
  end

  if natives.streaming_isModelValid(hash_3) then
    logger.logInfo(hash_3 .. " is a valid model. [hash_3]")
  else
    logger.logError(hash_3 .. " is not a valid model! [hash_3]")
  end

  if natives.streaming_isModelValid(hash_4) then
    logger.logInfo(hash_4 .. " is a valid model. [hash_4]")
  else
    logger.logError(hash_4 .. " is not a valid model! [hash_4]")
  end
end

menu.addButton('', 'Hash Check', '', function()
 hashcheck()
end)  