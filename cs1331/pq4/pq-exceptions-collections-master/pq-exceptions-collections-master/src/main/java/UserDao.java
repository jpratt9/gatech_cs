import java.util.Arrays;
public class UserDao {
    private String[] users;

    public UserDao(String[] users) {
        this.users = Arrays.copyOf(users, users.length);
    }

    public String getUser(int id) {
        // YOUR CODE HERE
        // Catch the ArrayIndexOutOfBoundsException
        // Re-throw a NoSuchUserException
        return users[id];
    }
}
