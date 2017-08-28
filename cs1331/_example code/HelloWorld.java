import javafx.application.Application;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.control.Button;
import javafx.scene.text.Font;
import javafx.scene.layout.VBox;

public class HelloWorld extends Application {
    @Override
    public void start(Stage stage) {
        Label helloWorld = new Label("Hello world!");
        helloWorld.setFont(new Font(48));

        Button goodbye = new Button("Goodbye!");
        goodbye.setOnAction(event -> {
            helloWorld.setText("Goodbye world!");
        });

        Button hello = new Button("Hello!");
        hello.setOnAction(event -> {
            helloWorld.setText("Hello world!");
        });

        Button close = new Button("EXIT");
        close.setOnAction(event -> {
            stage.close();
        });

        Button switcher = new Button("EXIT");
        switcher.setOnAction(event -> {
            boolean tmp = helloWorld.getText().equals("Hello world!");
            if (tmp) {
                helloWorld.setText("Goodbye world!");
            } else {
                helloWorld.setText("Hello world!");
            }
        });

        VBox box = new VBox();
        box.getChildren().addAll(helloWorld, goodbye, hello, close);
        box.getChildren().addAll(switcher);
        stage.setScene(new Scene(box));
        stage.setTitle("My hello world program");
        stage.show();
    }
}