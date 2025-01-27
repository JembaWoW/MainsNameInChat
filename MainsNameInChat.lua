MainsNameInChat = nil
MainsNameInChatState = "on"

if not originalSCM then originalSCM = SendChatMessage end

function SendChatMessage(msg, chatType, lang, chan)

    if MainsNameInChat then
        if UnitName("player") ~= MainsNameInChat then
            if chatType == "GUILD" or chatType == "CHANNEL" then
                command = strsub(msg, 1, 1)
                if command ~= "." and MainsNameInChatState == "on" then
                    msg = "("..MainsNameInChat.."): "..msg
                    originalSCM(msg,chatType,lang,chan)
                    return
                end
                if strsub(msg, 1, 2) == ".z" then
                    ClearTarget() TargetLastTarget()
                    originalSCM(msg)
                    return
                end
            end
        end
    end
    originalSCM(msg,chatType,lang,chan)
end

SLASH_MainsNameInChat1, SLASH_MainsNameInChat2, SLASH_MainsNameInChat3 = "/main", "/mainsname", "/mainsnameinchat"
SlashCmdList["MainsNameInChat"] = function(message)

    local r = ChatTypeInfo["SYSTEM"].r * 225
    local g = ChatTypeInfo["SYSTEM"].g * 225
    local b = ChatTypeInfo["SYSTEM"].b * 225

    local colEnd = "|cff"..string.format("%02x%02x%02x", r, g, b)
    local col = "|cffcc33ff"

    if strlen(message) == 0 then
        DEFAULT_CHAT_FRAME:AddMessage(col.."Main's Name In Chat ["..colEnd..MainsNameInChatState..col.."]")
        if not MainsNameInChat then
            DEFAULT_CHAT_FRAME:AddMessage(col.."/mainsname "..colEnd..UnitName("player").." - [No name currently set]")
        else
            DEFAULT_CHAT_FRAME:AddMessage(col.."/mainsname "..colEnd..MainsNameInChat)
        end
        DEFAULT_CHAT_FRAME:AddMessage(col.."/mainsname "..colEnd.."on|off")
    elseif message == off then
        MainsNameInChatState = off
        DEFAULT_CHAT_FRAME:AddMessage(col.."Your main's name will no longer be show.")
    elseif message == on then
        MainsNameInChatState = on
        DEFAULT_CHAT_FRAME:AddMessage(col.."Your main's name will now be show.")
    else
        MainsNameInChat = message
        DEFAULT_CHAT_FRAME:AddMessage(col.."Your main's name has been set to: "..colEnd..MainsNameInChat)
    end

end
