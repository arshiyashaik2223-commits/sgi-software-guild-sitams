package com.example.demo.controller;

import com.example.demo.entity.TeamMember;
import com.example.demo.repository.TeamMemberRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/members")
@CrossOrigin(origins = "*") // Allows HTML frontend to call the API
public class TeamMemberController {
    
    private final TeamMemberRepository repository;
    
    public TeamMemberController(TeamMemberRepository repository) {
        this.repository = repository;
    }
    
    @GetMapping
    public List<TeamMember> getAllMembers() {
        return repository.findAll();
    }
    
    @PostMapping
    public TeamMember createMember(@RequestBody TeamMember member) {
        return repository.save(member);
    }
}
