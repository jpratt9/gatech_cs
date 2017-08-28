package boardview;

import javafx.application.Platform;
import javafx.event.EventHandler;
import javafx.geometry.HPos;
import javafx.scene.Node;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Pane;
import javafx.scene.layout.Priority;
import javafx.scene.paint.Color;
import javafx.scene.text.Text;
import javafx.scene.control.Alert;
import javafx.scene.control.ChoiceDialog;
import javafx.scene.control.ButtonType;
import java.util.Optional;
import java.util.List;
import java.util.ArrayList;
import java.util.Set;
import java.util.HashSet;
import java.util.Map;
import model.Move;
import model.Piece;
import model.PieceType;
import model.Position;
import model.Side;
import model.chess.PawnCaptureMove;
import model.chess.PromotionMove;
import model.chess.ChessUtils;
import model.IllegalMoveException;
import gamecontrol.ChessController;
import gamecontrol.GameController;
import gamecontrol.GameState;
import gamecontrol.NetworkedChessController;
import gamecontrol.AIChessController;

/**
 * A class for a view for a chess board. This class must have a reference
 * to a GameController for chess playing chess
 * @author Gustavo
 * @author jpratt9
 * @date Oct 20, 2015
 * @version 1.0
 */
public class BoardView {

    /* You may add more instance data if you need it */
    protected GameController controller;
    private GridPane gridPane;
    private Tile[][] tiles;
    private Text sideStatus;
    private Text state;
    private boolean isRotated;
    private Tile currentTile;
    private Set<Move> moves;

    /**
     * Construct a BoardView with an instance of a GameController
     * and a couple of Text object for displaying info to the user
     * @param controller The controller for the chess game
     * @param state A Text object used to display state to the user
     * @param sideStatus A Text object used to display whose turn it is
     */
    public BoardView(GameController controller, Text state, Text sideStatus) {
        this.controller = controller;
        this.state = state;
        this.sideStatus = sideStatus;
        tiles = new Tile[8][8];
        gridPane = new GridPane();
        gridPane.setStyle("-fx-background-color : goldenrod;");
        reset(controller);
    }

    /**
     * Listener for clicks on a tile
     *
     * @param tile The tile attached to this listener
     * @return The event handler for all tiles.
     */
    private EventHandler<? super MouseEvent> tileListener(Tile tile) {
        return event -> {
            if (controller instanceof NetworkedChessController
                    && controller.getCurrentSide()
                    != ((NetworkedChessController) controller).getLocalSide()) {
                //not your turn!
                return;
            }
            // Don't change the code above this :)

            // newTile checks that you've clicked a new tile
            boolean newTile = !tile.equals(currentTile);
            // movesFound checks that you've clicked a tile with moves
            boolean movesFound = !controller
                    .getMovesForPieceAt(tile.getPosition()).isEmpty();
            // this is your "first click" if you click a new, valid tile
            if ((newTile && movesFound)
                || moves.isEmpty()
                || currentTile.getPosition().getRow() == -1) {
                firstClick(tile);
            // otherwise, this is your second click
            } else {
                secondClick(tile);
            }
        };
    }

    /**
     * Perform the first click functions, like displaying
     * which are the valid moves for the piece you clicked.
     * @param tile The TileView that was clicked
     */
    private void firstClick(Tile tile) {
        // this is only a valid click if the tile isn't empty and the piece
        // belongs to you
        if (!controller.getMovesForPieceAt(tile.getPosition()).isEmpty()
                && !tile.getSymbol().isEmpty()) {
            // clear out all previously highlighted moves
            for (Move m : moves) {
                getTileAt(m.getDestination()).clear();
                getTileAt(m.getStart()).clear();
            }
            currentTile = tile;
            // highlight current tile
            tile.highlight(new Color(1.0, 0.8, 0, 0.25));
            moves = controller.getMovesForPieceAt(tile.getPosition());
            // highlight every valid move
            for (Move m : moves) {
                Tile t = getTileAt(m.getDestination());
                // highlight empty tiles yellow, occupied ones red
                if (t.getSymbol().isEmpty()) {
                    t.highlight(new Color(0.2, 0.8, 0.2, 0.25));
                } else {
                    t.highlight(new Color(1, 0, 0, 0.25));
                }
            }
        }
    }

    /**
     * Perform the second click functions, like
     * sending moves to the controller but also
     * checking that the user clicked on a valid position.
     * If they click on the same piece they clicked on for the first click
     * then you should reset to click state back to the first click and clear
     * the highlighting effected on the board.
     *
     * @param tile the TileView at which the second click occurred
     */
    private void secondClick(Tile tile) {
        // valid will only be true if the tile clicked is in the set of
        // moves generated from the first click
        boolean valid = false;
        Move yourMove = null;
        for (Move m : moves) {
            if (tile.getPosition().equals(m.getDestination())) {
                yourMove = m;
            }
        }

        // if you didn't click a valid tile, clear out the current highlighted
        // moves, then reassign currentTile to "null"
        if (yourMove == null) {
            for (Move m : moves) {
                getTileAt(m.getDestination()).clear();
                getTileAt(m.getStart()).clear();
            }
        // otherwise, try making the move you've selected
        } else {
            try {
                controller.makeMove(yourMove);
                moves.clear();
                controller.endTurn();
                controller.beginTurn();
            } catch (IllegalMoveException e) {
                System.out.println(e);
            }
        }
        currentTile = new TileView(new Position(-1, -1));
    }

    /**
     * This method should be called any time a move is made on the back end.
     * It should update the tiles' highlighting and symbols to reflect the
     * change in the board state.
     *
     * @param moveMade the move to show on the view
     * @param capturedPositions a list of positions where pieces were captured
     */
    public void updateView(Move moveMade, List<Position> capturedPositions) {
        // clear out all tiles
        for (Tile[] tt : tiles) {
            for (Tile t : tt) {
                t.clear();
            }
        }

        Tile to = getTileAt(moveMade.getDestination());
        Tile from = getTileAt(moveMade.getStart());
        String fromSym = from.getSymbol();
        String toSym = to.getSymbol();

        // if the move is an en passant, we have to be sure to clear both
        // the tile where the pawn started and the tile of the piece that was
        // captured
        if (moveMade instanceof PawnCaptureMove
            && ((PawnCaptureMove) moveMade).isEnPassant()) {
            getTileAt(((PawnCaptureMove) moveMade)
                    .getEnPassantCapturePosition()).setSymbol("");
            from.setSymbol("");
            to.setSymbol(fromSym);

        // if it was a promotion move, we have to be sure to change the symbol
        // to that of the appropriate piecetype
        } else if (moveMade instanceof PromotionMove) {
            Piece p = ChessUtils.getPieceOfType(
                    ((PromotionMove) moveMade).getPromotingTo(),
                    controller.getCurrentSide());
            Side s = p.getSide();
            if (!(controller instanceof AIChessController)) {
                s = p.getSide() == Side.WHITE ? Side.BLACK : Side.WHITE;
            }
            to.setSymbol(p.getType().getSymbol(s));
            from.setSymbol("");
        // otherwise, for normal moves, just clear the start location's symbol
        // and move the piece to the new tile
        } else {
            to.setSymbol(fromSym);
            from.setSymbol("");
        }
        // finally, highlight the start and destination tiles yellow
        getTileAt(moveMade.getStart()).highlight(new Color(1.0, 0.8, 0, 0.25));
        getTileAt(moveMade.getDestination()).highlight(
                new Color(1.0, 0.8, 0, 0.25));
    }

    /**
     * Asks the user which PieceType they want to promote to
     * (suggest using Alert). Then it returns the Piecetype user selected.
     *
     * @return  the PieceType that the user wants to promote their piece to
     */
    private PieceType handlePromotion() {
        String res;
        List<String> choices = new ArrayList<>();
        choices.add("Rook");
        choices.add("Knight");
        choices.add("Bishop");
        choices.add("Queen");
        boolean playingAI = controller instanceof AIChessController;
        boolean yourTurn = controller.getCurrentSide() == Side.WHITE;
        // if you're either not playing an AI, or you are playing an AI and it's
        // your promotion move, prompt for selection
        if (!playingAI || (playingAI && yourTurn)) {
            // make a dialogue with the piece choices (Rook is the default
            // choice)
            ChoiceDialog<String> dialog = new ChoiceDialog<>("Rook", choices);
            dialog.setTitle("Promotion Choice");
            dialog.setHeaderText(null);
            dialog.setContentText("Choose the piece type to upgrade your pawn"
                    + "to:");
            Optional<String> choice = dialog.showAndWait();
            // we convert the choice into a PieceType by first getting its
            // string representation, then using
            // ChessUtils::getPieceTypeFromString
            res = choice.toString();
            res = res.substring(res.indexOf("[") + 1, res.indexOf("]"));
        // the AI does promotion randomly (since it doesn't make sense for the
        // player to choose for it)
        } else {
            res = choices.get((int) (Math.random() * 4));
        }
        return ChessUtils.getPieceTypeFromString(res.toUpperCase());
    }

    /**
     * Handles a change in the GameState (ie someone in check or stalemate).
     * If the game is over, it should open an Alert and ask to keep
     * playing or exit.
     *
     * @param s The new Game State
     */
    public void handleGameStateChange(GameState s) {
        if (s.isGameOver()) {
            // create an alert box informing the user that the game has ended
            Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
            alert.setTitle("Game Over!");
            alert.setHeaderText(s.toString());
            alert.setContentText("How would you like to go forward?");
            // allow the user to choose whether to start a new game or quit
            ButtonType keepPlaying = new ButtonType("Keep playing");
            ButtonType quit = new ButtonType("Quit");
            alert.getButtonTypes().setAll(keepPlaying, quit);

            Optional<ButtonType> result = alert.showAndWait();
            // if they want to play a new game, reset the game with a
            // new instance of ChessController
            if (result.get() == keepPlaying) {
                controller = new ChessController();
                reset(controller);
            // if they want to quit, exit the GUI
            } else if (result.get() == quit) {
                Platform.exit();
            }
        }
    }

    /**
     * Updates UI that depends upon which Side's turn it is
     *
     * @param s The new Side whose turn it currently is
     */
    public void handleSideChange(Side s) {
        sideStatus.setText(s + "'s Turn");
    }

    /**
     * Resets this BoardView with a new controller.
     * This moves the chess pieces back to their original configuration
     * and calls startGame() at the end of the method
     * @param newController The new controller for this BoardView
     */
    public void reset(GameController newController) {
        if (controller instanceof NetworkedChessController) {
            ((NetworkedChessController) controller).close();
        }
        controller = newController;
        isRotated = false;
        if (controller instanceof NetworkedChessController) {
            Side mySide
                = ((NetworkedChessController) controller).getLocalSide();
            if (mySide == Side.BLACK) {
                isRotated = true;
            }
        }
        sideStatus.setText(controller.getCurrentSide() + "'s Turn");

        // controller event handlers
        // We must force all of these to run on the UI thread
        controller.addMoveListener(
                (Move move, List<Position> capturePositions) ->
                Platform.runLater(
                    () -> updateView(move, capturePositions)));

        controller.addCurrentSideListener(
                (Side side) -> Platform.runLater(
                    () -> handleSideChange(side)));

        controller.addGameStateChangeListener(
                (GameState state) -> Platform.runLater(
                    () -> handleGameStateChange(state)));

        controller.setPromotionListener(() -> handlePromotion());


        addPieces();
        controller.startGame();
        if (isRotated) {
            setBoardRotation(180);
        } else {
            setBoardRotation(0);
        }

        // everything I've added in - mostly instance variables
        currentTile = new TileView(new Position(-1, -1));
        moves = new HashSet<>(0);
    }

    /**
     * Initializes the gridPane object with the pieces from the GameController.
     * This method should only be called once before starting the game.
     */
    private void addPieces() {
        gridPane.getChildren().clear();
        Map<Piece, Position> pieces = controller.getAllActivePiecesPositions();
        /* Add the tiles */
        for (int row = 0; row < 8; row++) {
            for (int col = 0; col < 8; col++) {
                Tile tile = new TileView(new Position(row, col));
                gridPane.add(tile.getRootNode(),
                        1 + tile.getPosition().getCol(),
                        1 + tile.getPosition().getRow());
                GridPane.setHgrow(tile.getRootNode(), Priority.ALWAYS);
                GridPane.setVgrow(tile.getRootNode(), Priority.ALWAYS);
                getTiles()[row][col] = tile;
                tile.getRootNode().setOnMouseClicked(
                        tileListener(tile));
                tile.clear();
                tile.setSymbol("");
            }
        }
        /* Add the pieces */
        for (Piece p : pieces.keySet()) {
            Position placeAt = pieces.get(p);
            getTileAt(placeAt).setSymbol(p.getType().getSymbol(p.getSide()));
        }
        /* Add the coordinates around the perimeter */
        for (int i = 1; i <= 8; i++) {
            Text coord1 = new Text((char) (64 + i) + "");
            GridPane.setHalignment(coord1, HPos.CENTER);
            gridPane.add(coord1, i, 0);

            Text coord2 = new Text((char) (64 + i) + "");
            GridPane.setHalignment(coord2, HPos.CENTER);
            gridPane.add(coord2, i, 9);

            Text coord3 = new Text(9 - i + "");
            GridPane.setHalignment(coord3, HPos.CENTER);
            gridPane.add(coord3, 0, i);

            Text coord4 = new Text(9 - i + "");
            GridPane.setHalignment(coord4, HPos.CENTER);
            gridPane.add(coord4, 9, i);
        }
    }

    private void setBoardRotation(int degrees) {
        gridPane.setRotate(degrees);
        for (Node n : gridPane.getChildren()) {
            n.setRotate(degrees);
        }
    }

    /**
     * Gets the view to add to the scene graph
     * @return A pane that is the node for the chess board
     */
    public Pane getView() {
        return gridPane;
    }

    /**
     * Gets the tiles that belong to this board view
     * @return A 2d array of TileView objects
     */
    public Tile[][] getTiles() {
        return tiles;
    }

    private Tile getTileAt(int row, int col) {
        return getTiles()[row][col];
    }

    private Tile getTileAt(Position p) {
        return getTileAt(p.getRow(), p.getCol());
    }

}
