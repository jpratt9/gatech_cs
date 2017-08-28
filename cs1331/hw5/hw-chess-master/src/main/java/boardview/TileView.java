package boardview;

import javafx.scene.Node;
import javafx.scene.layout.StackPane;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.scene.shape.Rectangle;
import model.Position;

/**
 * View class for a tile on a chess board
 * A tile should be able to display a chess piece
 * as well as highlight itself during the game.
 *
 * @author jpratt9
 * @version  1.0
 */
public class TileView implements Tile {

    private Text text;
    private Position pos;
    private String symbol;
    private StackPane stack;
    private Color regColor;

    private static final int LENGTH = 75;
    /**
     * Creates a TileView with a specified position
     * @param p
     */
    public TileView(Position p) {
        pos = p;
        // "even" tile - white
        if ((p.getRow() + p.getCol()) % 2 == 0) {
            regColor = Color.WHITE;
        // "odd" tile - gray
        } else {
            regColor = Color.LIGHTGRAY;
        }
        stack = new StackPane();
        stack.getChildren().add(new Rectangle(LENGTH, LENGTH, regColor));
        symbol = "";
        text = new Text(symbol);
        text.setFont(new Font(50));
        stack.getChildren().add(text);
    }


    /**
     * Get the Position object this Tile logically exists at
     * @return This TileView's Position
     */
    @Override
    public Position getPosition() {
        return pos;
    }


    /**
     * Get the Node that represents this Tile
     * @return The Node object
     */
    @Override
    public Node getRootNode() {
        return (Node) stack;
    }

    /**
     * Set the symbol to be displayed on this Tile, should
     * be a Unicode Chess symbol
     * @param symbol
     */
    @Override
    public void setSymbol(String symbol) {
        this.symbol = symbol;
        text.setText(symbol);
    }


    /**
     * Get the symbol currently displayed at this Tile
     * @return symbol
     */
    @Override
    public String getSymbol() {
        return symbol;
    }

    /**
     * Highlight this tile with a particular color
     * @param color
     */
    @Override
    public void highlight(Color color) {
        // Adds a rectangle to the top of the node of the selected color
        stack.getChildren().add(new Rectangle(LENGTH, LENGTH, color));
    }

    /**
     * Return this tile to its normal appearance.
     */
    @Override
    public void clear() {
        // removes all nodes in the StackPane other than the regular tile
        // and symbol
        while (3 <= stack.getChildren().size()) {
            stack.getChildren().remove(2);
        }
    }
}
