package com.example.demo.controller;

import com.example.demo.repository.DepartmentRepository;
import com.example.demo.repository.TeamMemberRepository;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/stats")
@CrossOrigin(origins = "*")
public class StatsController {

    private final DepartmentRepository departmentRepository;
    private final TeamMemberRepository teamMemberRepository;

    public StatsController(DepartmentRepository departmentRepository, TeamMemberRepository teamMemberRepository) {
        this.departmentRepository = departmentRepository;
        this.teamMemberRepository = teamMemberRepository;
    }

    @GetMapping
    public Map<String, Long> getStats() {
        Map<String, Long> stats = new HashMap<>();
        stats.put("departmentsCount", departmentRepository.count());
        stats.put("membersCount", teamMemberRepository.count());
        return stats;
    }
}
