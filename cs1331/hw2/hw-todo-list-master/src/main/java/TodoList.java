import java.util.Scanner;
import java.io.File;
import java.io.PrintWriter;

public class TodoList {

    private static String name;
    private static String usernames;
    private static Goal[] goals;
    private static int numGoals;
    private static int input;
    private static boolean created;
    private static File f;
    private static Scanner goalReader;
    private static Scanner userReader;
    private static Scanner keyboard;
    private static PrintWriter goalWriter;
    private static PrintWriter userWriter;

    public static void main(String[] args) throws Exception {
        initialize();
        displayGoals();
        do {
            promptInput();
            processInput();
            displayGoals();
        } while (input != 4);
    }

    private static void initialize() throws Exception {
        input = 0;
        numGoals = 0;
        goals = new Goal[10];
        keyboard = new Scanner(System.in);
        System.out.println("What is your name?");
        name = keyboard.next();
        f = new File(name + ".csv");

        created = f.createNewFile();

        if (!created) {
            processFile();
        } else {
            addUser(name);
        }
    }


    private static void processFile() throws Exception {
        goalReader = new Scanner(f);
        String line;
        while (goalReader.hasNext()) {
            line = goalReader.nextLine();
            goals[numGoals] = new Goal(line.split(","));
            numGoals++;
        }
    }

    private static void addUser(String n) throws Exception {
        userReader = new Scanner(new File("users.csv"));
        usernames = userReader.nextLine();
        userReader.close();
        userWriter = new PrintWriter("users.csv", "UTF-8");
        userWriter.println(usernames + ", " + n);
        userWriter.close();
    }

    private static void displayGoals() {
        if (numGoals == 0) {
            System.out.println("No goals yet!");
        } else {
            System.out.println("Goals:");
            for (int i = 0; i < numGoals; i++) {
                System.out.print(" " + (i + 1) + ")\t"
                        + goals[i].toStringRun());
            }
        }
    }

    private static void promptInput() {
        System.out.println("Select an option:");
        System.out.println(" [1] Add Task");
        System.out.println(" [2] Add Goal");
        System.out.println(" [3] Mark Task as Completed");
        System.out.println(" [4] Save & Quit");
    }


    private static void processInput() throws Exception {
        input = keyboard.nextInt();
        if (input == 1) {
            if (numGoals == 0) {
                System.out.println("Sorry, you need to add a goal first!");
                promptInput();
                processInput();
            } else {
                addTask();
            }
        } else if (input == 2) {
            addGoal();
        } else if (input == 3) {
            markComplete();
        } else if (input == 4) {
            saveAndQuit();
        } else {
            promptInput();
            processInput();
        }
    }

    private static void addTask() {
        System.out.println("Task name:");
        keyboard.nextLine();
        String n = keyboard.nextLine();
        System.out.println("Task priority (1-10):");
        int p = keyboard.nextInt();
        System.out.println("Task due date (yyyy-mm-dd HH:mm):");
        keyboard.nextLine();
        String d = keyboard.nextLine();
        System.out.println("Task complete (\"true\"/\"false\"):");
        boolean s = keyboard.nextBoolean();
        System.out.println("Which goal would you like to add this task to? "
                + "(Please enter the number):");
        goals[keyboard.nextInt() - 1].addTask(n, p, d, s);
    }

    private static void addGoal() {
        System.out.println("Goal name:");
        keyboard.nextLine();
        goals[numGoals] = new Goal(keyboard.nextLine());
        numGoals++;
    }

    private static void markComplete() throws Exception {
        if (numGoals == 0) {
            System.out.println("Sorry, you don't have any tasks!");
            promptInput();
            processInput();
        } else {
            System.out.println("Which goal is this task in? "
                    + "(Please enter the number)");
            int goalNum = keyboard.nextInt() - 1;
            if (goals[goalNum].getNumTasks() == 0) {
                System.out.println("Sorry, that goal doesn't have any tasks!");
                promptInput();
                processInput();
            } else {
                System.out.println("What number is the task? "
                        + "(Please enter the number)");
                int taskNum = keyboard.nextInt() - 1;
                goals[goalNum].markAsComplete(taskNum);
            }
        }

    }

    private static void saveAndQuit() throws Exception {
        if (!created) {
            goalReader.close();
        }
        if (numGoals > 0) {
            goalWriter = new PrintWriter(name + ".csv", "UTF-8");
            for (int i = 0; i < numGoals; i++) {
                goalWriter.println(goals[i].toStringWrite());
            }
            goalWriter.close();
        }
    }
}