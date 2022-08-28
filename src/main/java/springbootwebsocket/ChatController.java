package springbootwebsocket;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;

@Controller
public class ChatController {
	
	@MessageMapping("/join")
    @SendTo("/topic/public")
    public ChatMessage addUser(@Payload ChatMessage chatMessage, 
            SimpMessageHeaderAccessor headerAccessor) {
        // 把username加入WebSocket的Session
        headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
        return chatMessage; // 返回時會將訊息送至/topic/public
    }
    
    /**
     * 處理前端送來的聊天訊息，並把訊息推送給前端
     */
    @MessageMapping("/chat")
    @SendTo("/topic/public")
    public ChatMessage sendMessage(@Payload ChatMessage chatMessage) {
        return chatMessage; // 返回時會將訊息送至/topic/public
    }

}
