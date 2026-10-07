package com.example.demo.controller;

import com.example.demo.entity.Department;
import com.example.demo.repository.DepartmentRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/departments")
@CrossOrigin(origins = "*") // Allows HTML frontend to call the API
public class DepartmentController {
    
    private final DepartmentRepository repository;
    
    public DepartmentController(DepartmentRepository repository) {
        this.repository = repository;
    }
    
    @GetMapping
    public List<Department> getAllDepartments() {
        return repository.findAll();
    }
    
    @PostMapping
    public Department createDepartment(@RequestBody Department department) {
        return repository.save(department);
    }
}
