package com.example.demo.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
public class TeamMember {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String memberId; // e.g., "ceo-01"
    private String name;
    private String designation;
    
    @ManyToOne
    @JoinColumn(name="department_id")
    private Department department;
    
    @Column(columnDefinition = "TEXT")
    private String biography;
    private String imageUrl;
}
