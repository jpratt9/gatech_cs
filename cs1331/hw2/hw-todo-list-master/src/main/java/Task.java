public class Task {

    private String name;
    private String[] priorities = {"Low", "Medium", "High"};
    private int priority;
    private String dueDate;
    private boolean status;

    public Task(String line) {
        line = line.trim();
        String[] temp = line.split("\\|");
        name = temp[0].trim();
        priority = Integer.parseInt(temp[1].trim());
        dueDate = temp[2].trim();
        status = Boolean.parseBoolean(temp[3].trim());
    }

    public Task(String n, int p, String d, boolean s) {
        name = n;
        priority = p;
        String[] temp = d.split(" ");
        dueDate = temp[0] + "T" + temp[1];
        status = s;
    }

    private String priorityToString() {
        int ind;
        if (priority >= 8) {
            ind = 2;
        } else if (priority >= 4) {
            ind = 1;
        } else {
            ind = 0;
        }
        return priorities[ind];
    }

    private String dueDateToStringRun() {
        String[] temp = dueDate.split("T");
        return temp[0] + " " + temp[1];
    }

    private String statusToStringRun() {
        if (status) {
            return "Complete";
        } else {
            return "Incomplete";
        }
    }

    public boolean getStatus() {
        return status;
    }

    public void markAsComplete() {
        status = true;
    }

    // returns the Task in the format to be seen in the console
    public String toStringRun() {
        String res = "";
        res += "\t\t- ";
        res += name + " - ";
        res += priorityToString() + " - ";
        res += "due " + dueDateToStringRun() + " - ";
        res += statusToStringRun() + "\n";
        return res;
    }

    // returns the Task in the format to be seen in the user's file
    public String toStringWrite() {
        String res = "";
        res += ", " + name + " | ";
        res += priority + " | ";
        res += dueDate + " | ";
        res += status;
        return res;
    }
}
