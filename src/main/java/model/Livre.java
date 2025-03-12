package model;

public class Livre {
    private int id;
    private String titre;
    private String auteur;
    private boolean disponibilite;
    private String image;

    // Constructeurs, getters et setters
    public Livre() {}

    public Livre(String titre, String auteur, boolean disponibilite, String image) {
        this.titre = titre;
        this.auteur = auteur;
        this.disponibilite = disponibilite;
        this.image = image;
    }

    // Getters et Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getTitre() { return titre; }
    public void setTitre(String titre) { this.titre = titre; }
    public String getAuteur() { return auteur; }
    public void setAuteur(String auteur) { this.auteur = auteur; }
    public boolean isDisponibilite() { return disponibilite; }
    public void setDisponibilite(boolean disponibilite) { this.disponibilite = disponibilite; }
    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }
}