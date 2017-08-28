package boardview;

// FIXME - only import what's needed (?)
import gamecontrol.AIChessController;
import gamecontrol.ChessController;
import gamecontrol.NetworkedChessController;
import javafx.application.Application;
import javafx.event.EventHandler;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.VBox;
import javafx.scene.layout.GridPane;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import javafx.geometry.Insets;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * Main class for the chess application
 * Sets up the top level of the GUI
 * @author Gustavo
 * @author jpratt9
 * @version 1.0
 */
public class ChessFX extends Application {

    private BoardView board;
    private Text state;
    private Text sideStatus;
    private VBox root;

    @Override
    public void start(Stage primaryStage) {
        // set up the main stage with a BoardView etc..
        // we don't really need to declare a ChessController since it won't be
        // used anywhere except in the BoardView
        state = new Text("Ongoing");
        sideStatus = new Text();
        board = new BoardView(new ChessController(), state, sideStatus);

        Button resetbtn = new Button("Reset");
        resetbtn.setOnAction(event -> {
                board.reset(new ChessController());
            });

        Button playComputer = new Button("Play Computer");
        playComputer.setOnAction(event -> {
                board.reset(new AIChessController());
            });

        Text yourIP = new Text();
        try {
            yourIP.setText(InetAddress.getLocalHost().toString());
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }


        TextField theirIP = new TextField();
        theirIP.setPromptText("a.b.c.x");

        Button host = new Button("Host");
        host.setOnMouseClicked(makeHostListener());

        Button join = new Button("Join");
        join.setOnMouseClicked(makeJoinListener(theirIP));

        GridPane grid = new GridPane();
        grid.setHgap(10);
        grid.setVgap(15);
        grid.setPadding(new Insets(15, 10, 15, 10));

        // sets up the pane containing all elements other than the board
        grid.add(resetbtn, 0, 0);
        grid.add(playComputer, 2, 0, 6, 1);
        grid.add(sideStatus, 37, 0);
        grid.add(state, 38, 0);
        grid.add(host, 0, 2);
        grid.add(yourIP, 1, 2, 20, 1);
        grid.add(theirIP, 22, 2, 16, 1);
        grid.add(join, 38, 2);

        root = new VBox(board.getView(), grid);

        primaryStage.setScene(new Scene(root));
        primaryStage.setTitle("CS 1331 - Chess");
        // prevents window from being resized
        primaryStage.setResizable(false);
        primaryStage.setMaxWidth(620);
        primaryStage.setMaxHeight(800);
        primaryStage.show();

    }

    private EventHandler<? super MouseEvent> makeHostListener() {
        return event -> {
            board.reset(new NetworkedChessController());
        };
    }

    private EventHandler<? super MouseEvent> makeJoinListener(TextField input) {
        return event -> {
            try {
                InetAddress addr = InetAddress.getByName(input.getText());
                //GameController newController
                //    = new NetworkedChessController(addr);
                board.reset(new NetworkedChessController(addr));
            } catch (IOException e) {
                e.printStackTrace();
            }
        };
    }

    public static void main(String[] args) {
        launch(args);
    }
}