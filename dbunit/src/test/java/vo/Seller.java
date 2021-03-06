package vo;

public class Seller {

    private String id;
    private String name;
    private String email;

    public static Seller newInstance(String id, String name, String email) {
        return new Seller(id, name, email);
    }

    public Seller() {
        super();
    }

    private Seller(String id, String name, String email) {
        super();
        this.id = id;
        this.name = name;
        this.email = email;
    }

    @Override
    public String toString() {
        return "Seller [id=" + id + ", name=" + name + ", email=" + email + "]";
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }



}
