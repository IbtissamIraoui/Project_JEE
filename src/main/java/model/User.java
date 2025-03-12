
package model;

public class User {
    private int id;
    private String username, email, telephone, address;


    public User(int id, String username, String email, String telephone, String address) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.telephone = telephone;
        this.address = address;
    }

    // Getters
    public int getId() { return id; }
    public String getUsername() { return username; }
    public String getEmail() { return email; }
    public String getTelephone() { return telephone; }
    public String getAddress() { return address; }
}
