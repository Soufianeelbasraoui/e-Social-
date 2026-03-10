package com.esocial.model;

import jakarta.persistence.*;

@Entity
@Table(name = "assures")
public class Assure {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String nom;

    @Column(name = "salaire_mensuel")
    private double salaireMensuel;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "employeur_id", nullable = false)
    private Employeur employeur;

    public Assure() {}

    public Assure(String nom, double salaireMensuel, Employeur employeur) {
        this.nom = nom;
        this.salaireMensuel = salaireMensuel;
        this.employeur = employeur;
    }

    // Getters & Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }

    public double getSalaireMensuel() { return salaireMensuel; }
    public void setSalaireMensuel(double salaireMensuel) { this.salaireMensuel = salaireMensuel; }

    public Employeur getEmployeur() { return employeur; }
    public void setEmployeur(Employeur employeur) { this.employeur = employeur; }
}
