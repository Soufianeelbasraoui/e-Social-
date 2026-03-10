package com.esocial.model;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "declarations", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"employeur_id", "mois", "annee"})
})
public class Declaration {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private int mois;

    @Column(nullable = false)
    private int annee;

    @Column(name = "date_declaration")
    private LocalDate dateDeclaration;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "employeur_id", nullable = false)
    private Employeur employeur;

    @OneToMany(mappedBy = "declaration", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<LigneDeclaration> lignes = new ArrayList<>();

    @OneToMany(mappedBy = "declaration", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Cotisation> cotisations = new ArrayList<>();

    public Declaration() {}

    public Declaration(int mois, int annee, LocalDate dateDeclaration, Employeur employeur) {
        this.mois = mois;
        this.annee = annee;
        this.dateDeclaration = dateDeclaration;
        this.employeur = employeur;
    }

    // Getters & Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public int getMois() { return mois; }
    public void setMois(int mois) { this.mois = mois; }

    public int getAnnee() { return annee; }
    public void setAnnee(int annee) { this.annee = annee; }

    public LocalDate getDateDeclaration() { return dateDeclaration; }
    public void setDateDeclaration(LocalDate dateDeclaration) { this.dateDeclaration = dateDeclaration; }

    public Employeur getEmployeur() { return employeur; }
    public void setEmployeur(Employeur employeur) { this.employeur = employeur; }

    public List<LigneDeclaration> getLignes() { return lignes; }
    public void setLignes(List<LigneDeclaration> lignes) { this.lignes = lignes; }

    public List<Cotisation> getCotisations() { return cotisations; }
    public void setCotisations(List<Cotisation> cotisations) { this.cotisations = cotisations; }
}
