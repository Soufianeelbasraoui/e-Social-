package com.esocial.model;

import jakarta.persistence.*;

@Entity
@Table(name = "lignes_declaration")
public class LigneDeclaration {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "salaire_declare")
    private double salaireDeclare;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "declaration_id", nullable = false)
    private Declaration declaration;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "assure_id", nullable = false)
    private Assure assure;

    public LigneDeclaration() {}

    public LigneDeclaration(double salaireDeclare, Declaration declaration, Assure assure) {
        this.salaireDeclare = salaireDeclare;
        this.declaration = declaration;
        this.assure = assure;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public double getSalaireDeclare() { return salaireDeclare; }
    public void setSalaireDeclare(double salaireDeclare) { this.salaireDeclare = salaireDeclare; }

    public Declaration getDeclaration() { return declaration; }
    public void setDeclaration(Declaration declaration) { this.declaration = declaration; }

    public Assure getAssure() { return assure; }
    public void setAssure(Assure assure) { this.assure = assure; }
}
