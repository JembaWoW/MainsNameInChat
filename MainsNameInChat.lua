MainsNameInChat = nil

if not originalSCM then originalSCM = SendChatMessage end

function SendChatMessage(msg, chatType, lang, chan)

    if MainsNameInChat then
        if UnitName("player") ~= MainsNameInChat then
            if chatType == "GUILD" or chatType == "CHANNEL" then
                command = strsub(msg, 1, 1)
                if command ~= "." then
                    msg = "("..MainsNameInChat.."): "..msg
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
        if not MainsNameInChat then
            DEFAULT_CHAT_FRAME:AddMessage(col.."You have not yet set your main's name. Please use /mainsnameinchat "..colEnd..UnitName("player"))
            return
        end
        DEFAULT_CHAT_FRAME:AddMessage(col.."Your main's name is set to: "..colEnd..MainsNameInChat)
    else
        MainsNameInChat = message
        DEFAULT_CHAT_FRAME:AddMessage(col.."Your main's name has been set to: "..colEnd..MainsNameInChat)
    end

end
