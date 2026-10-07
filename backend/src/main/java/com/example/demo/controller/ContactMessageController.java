package com.example.demo.controller;

import com.example.demo.entity.ContactMessage;
import com.example.demo.repository.ContactMessageRepository;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/contact")
@CrossOrigin(origins = "*") // Allows HTML frontend to call the API
public class ContactMessageController {
    
    private final ContactMessageRepository repository;
    
    public ContactMessageController(ContactMessageRepository repository) {
        this.repository = repository;
    }
    
    @PostMapping
    public ContactMessage submitMessage(@RequestBody ContactMessage message) {
        // Save the message to MySQL and return the saved object
        return repository.save(message);
    }
}
