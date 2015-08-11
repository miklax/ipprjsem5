package beans;

/**
 *
 * @author Mihail
 */
public class Korisnik {
    private String username;
    private String password;
    private String first_name;
    private String last_name;
    private String email;
    private int lokacija;
    private int levelacc;
    private int odobren;
    private int banlevel;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getLokacija() {
        return lokacija;
    }
 
    public void setLokacija(int lokacija) {
      this.lokacija = lokacija;
    }
    
    public int getLevelacc() {
        return levelacc;
    }

    public void setLevelacc(int levelacc) {
        this.levelacc = levelacc;
    }

    public int getOdobren() {
        return odobren;
    }

    public void setOdobren(int odobren) {
        this.odobren = odobren;
    }

    public int getBanlevel() {
        return banlevel;
    }

    public void setBanlevel(int banlevel) {
        this.banlevel = banlevel;
    }
    
    
    
}
