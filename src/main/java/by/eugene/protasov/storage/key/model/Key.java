package by.eugene.protasov.storage.key.model;

import javax.persistence.*;

/**
 * @author Евгений Протасов | https://github.com/JProtosss | jprotossswork@gmail.com
 */

@Entity
@Table(name = "activation_key")
public class Key {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Column(name = "key")
    private String key;

    public Key() {
    }

    public Key(String key) {
        this.key = key;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
