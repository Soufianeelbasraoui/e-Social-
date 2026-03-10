package com.esocial.model;

import jakarta.persistence.*;

@Entity
@Table(name = "cotisations")
public class Cotisation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "cotisation_salariale")
    private double cotisationSalariale;

    @Column(name = "cotisation_patronale")
    private double cotisationPatronale;

    @Column(name = "salaire_brut")
    private double salaireBrut;

    private int mois;
    private int annee;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "assure_id", nullable = false)
    private Assure assure;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "declaration_id", nullable = false)
    private Declaration declaration;

    public Cotisation() {}

    public Cotisation(double cotisationSalariale, double cotisationPatronale, double salaireBrut,
                      int mois, int annee, Assure assure, Declaration declaration) {
        this.cotisationSalariale = cotisationSalariale;
        this.cotisationPatronale = cotisationPatronale;
        this.salaireBrut = salaireBrut;
        this.mois = mois;
        this.annee = annee;
        this.assure = assure;
        this.declaration = declaration;
    }

    // Getters & Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public double getCotisationSalariale() { return cotisationSalariale; }
    public void setCotisationSalariale(double cotisationSalariale) { this.cotisationSalariale = cotisationSalariale; }

    public double getCotisationPatronale() { return cotisationPatronale; }
    public void setCotisationPatronale(double cotisationPatronale) { this.cotisationPatronale = cotisationPatronale; }

    public double getSalaireBrut() { return salaireBrut; }
    public void setSalaireBrut(double salaireBrut) { this.salaireBrut = salaireBrut; }

    public int getMois() { return mois; }
    public void setMois(int mois) { this.mois = mois; }

    public int getAnnee() { return annee; }
    public void setAnnee(int annee) { this.annee = annee; }

    public Assure getAssure() { return assure; }
    public void setAssure(Assure assure) { this.assure = assure; }

    public Declaration getDeclaration() { return declaration; }
    public void setDeclaration(Declaration declaration) { this.declaration = declaration; }

    public double getTotal() {
        return cotisationSalariale + cotisationPatronale;
    }
}
