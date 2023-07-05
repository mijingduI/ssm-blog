package kybmig.ssm.model;

public class UserModel {
    private Integer id;
    private String username;
    private String password;
    private UserRole role;


    private String avatar;
    private Integer createdTime;
    private Integer updatedTime;




    public String getAvatar() { return avatar; }

    public void setAvatar(String avatar) { this.avatar = avatar; }

    public Integer getCreatedTime() { return createdTime; }

    public void setCreatedTime(Integer createdTime) { this.createdTime = createdTime; }

    public Integer getUpdatedTime() { return updatedTime; }

    public void setUpdatedTime(Integer updatedTime) { this.updatedTime = updatedTime; }


    public Integer getId() { return id; }

    public void setId(Integer id) {
        this.id = id;
    }

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

    public UserRole getRole() {
        return role;
    }

    public void setRole(UserRole role) {
        this.role = role;
    }
}
