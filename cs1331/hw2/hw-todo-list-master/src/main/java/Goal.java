public class Goal {

    private String name;
    private Task[] subtasks;
    private int numTasks;
    private boolean status;

    public Goal(String[] line) {
        name = line[0];
        subtasks = new Task[10];
        numTasks = line.length - 1;
        for (int i = 0; i < numTasks; i++) {
            subtasks[i] = new Task(line[i + 1]);
        }
        updateStatus();
    }

    public Goal(String n) {
        name = n;
        subtasks = new Task[10];
        numTasks = 0;
        status = true;
    }

    private void updateStatus() {
        status = true;
        for (Task t : subtasks) {
            if (t != null && !t.getStatus()) {
                status = false;
            }
        }
    }

    public int getNumTasks() {
        return numTasks;
    }

    private String statusToStringRun() {
        if (status) {
            return "Complete";
        } else {
            return "Incomplete";
        }
    }

    public void addTask(String n, int p, String d, boolean s) {
        subtasks[numTasks] = new Task(n, p, d, s);
        numTasks++;
        updateStatus();
    }

    public void markAsComplete(int i) {
        subtasks[i].markAsComplete();
        updateStatus();
    }

    public String toStringRun() {
        String res = " " + name + " - " + statusToStringRun() + "\n";
        for (int i = 0; i < numTasks; i++) {
            res += subtasks[i].toStringRun();
        }
        return res;
    }

    public String toStringWrite() {
        String res = name;
        for (int i = 0; i < numTasks; i++) {
            res += subtasks[i].toStringWrite();
        }
        return res;
    }

}