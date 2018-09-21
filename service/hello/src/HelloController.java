package src;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloController {
    private final static String HELLO_BODY = "Hello there";

    @GetMapping("/hello")
    ResponseEntity<String> helloWorld() {
        return ResponseEntity
                .ok()
                .body(HELLO_BODY);
    }
}
