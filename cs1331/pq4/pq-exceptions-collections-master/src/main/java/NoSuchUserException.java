/**
 * @author   jpratt9
 * @version  1.0, 2015-10-13 10:53AM EST
 */

public class NoSuchUserException extends Exception {

    public NoSuchUserException(int id, Throwable cause) {
        super("User " + id + " does not exist", cause);
    }
}