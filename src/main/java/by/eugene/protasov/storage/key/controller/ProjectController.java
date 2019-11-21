package by.eugene.protasov.storage.key.controller;

import by.eugene.protasov.storage.key.dao.KeyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Евгений Протасов | https://github.com/JProtosss | jprotossswork@gmail.com
 */

@RestController
public class ProjectController {

    @Autowired
    KeyRepository keyRepository;

    @GetMapping("/")
    public String home() {
        return "<h1>Welcome</h1>";
    }

    @GetMapping("/activation/check/{key}")
    public boolean checkOrKeyExists(@PathVariable("key") String key) {
        return keyRepository.checkOrKeyExists(key) != null;
    }

}
