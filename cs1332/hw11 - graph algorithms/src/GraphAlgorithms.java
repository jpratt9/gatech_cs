import java.util.List;
import java.util.ArrayList;
import java.util.Set;
import java.util.HashSet;
import java.util.Map;
import java.util.HashMap;
import java.util.Queue;
import java.util.LinkedList;
import java.util.PriorityQueue;

/**
 * Your implementations of various graph algorithms.
 *
 * @author John Pratt
 * @version 1.0
 */
public class GraphAlgorithms {

    /**
     * Helper method for throwing an IllegalArgumentException if null values
     * are passed into the other methods in this class.
     *
     * @throws IllegalArgumentException if any input is null, or if
     *         {@code start} doesn't exist in the graph
     * @param start the Vertex you are starting at
     * @param graph the Graph we are searching
     * @param <T> the data type representing the vertices in the graph.
     */
    private static <T> void nullChecker(Vertex<T> start, Graph<T> graph) {
        if (start == null && graph == null) {
            throw new IllegalArgumentException("Cannot search null graph or "
                    + "start at null vertex.");
        }
        if (start == null) {
            throw new IllegalArgumentException("Cannot search graph - "
                    + "starting vertex is null.");
        }
        if (graph == null) {
            throw new IllegalArgumentException("Cannot search through null "
                    + "graph.");
        }
        if (graph.getAdjacencyList().get(start) == null) {
            throw new IllegalArgumentException("Cannot search graph - "
                    + "starting vertex is not contained within the graph.");
        }
    }

    /**
     * Perform breadth first search on the given graph, starting at the start
     * Vertex.  You will return a List of the vertices in the order that
     * you visited them.  Make sure to include the starting vertex at the
     * beginning of the list.
     *
     * When exploring a Vertex, make sure you explore in the order that the
     * adjacency list returns the neighbors to you.  Failure to do so may
     * cause you to lose points.
     *
     * You may import/use {@code java.util.Queue}, {@code java.util.Set},
     * {@code java.util.Map}, {@code java.util.List}, and any classes
     * that implement the aforementioned interfaces.
     *
     * @throws IllegalArgumentException if any input is null, or if
     *         {@code start} doesn't exist in the graph
     * @param start the Vertex you are starting at
     * @param graph the Graph we are searching
     * @param <T> the data type representing the vertices in the graph.
     * @return a List of vertices in the order that you visited them
     */
    public static <T> List<Vertex<T>> breadthFirstSearch(Vertex<T> start,
            Graph<T> graph) {
        nullChecker(start, graph);

        Queue<Vertex<T>> queue = new LinkedList<>();
        List<Vertex<T>> visitedList = new ArrayList<>();
        Set<Vertex<T>> visitedSet = new HashSet<>();
        Vertex<T> currentVertex;
        queue.add(start);
        List<VertexDistancePair<T>> currentVDPairList;
        Set<Edge<T>> edges = graph.getEdgeList();
        Map<Vertex<T>, List<VertexDistancePair<T>>> adjacencyList =
                graph.getAdjacencyList();
        while (!queue.isEmpty()) {
            currentVertex = queue.remove();
            if (!visitedSet.contains(currentVertex)) {
                visitedSet.add(currentVertex);
                visitedList.add(currentVertex);
                currentVDPairList = adjacencyList.get(currentVertex);
                for (VertexDistancePair vdp : currentVDPairList) {
                    queue.add(vdp.getVertex());
                }
            }
        }
        return visitedList;
    }

    /**
     * Perform depth first search on the given graph, starting at the start
     * Vertex.  You will return a List of the vertices in the order that
     * you visited them.  Make sure to include the starting vertex at the
     * beginning of the list.
     *
     * When exploring a Vertex, make sure you explore in the order that the
     * adjacency list returns the neighbors to you.  Failure to do so may
     * cause you to lose points.
     *
     * You MUST implement this method recursively.
     * Do not use any data structure as a stack to avoid recursion.
     * Implementing it any other way WILL cause you to lose points!
     *
     * You may import/use {@code java.util.Set}, {@code java.util.Map},
     * {@code java.util.List}, and any classes that implement the
     * aforementioned interfaces.
     *
     * @throws IllegalArgumentException if any input is null, or if
     *         {@code start} doesn't exist in the graph
     * @param start the Vertex you are starting at
     * @param graph the Graph we are searching
     * @param <T> the data type representing the vertices in the graph.
     * @return a List of vertices in the order that you visited them
     */
    public static <T> List<Vertex<T>> depthFirstSearch(Vertex<T> start,
            Graph<T> graph) {
        nullChecker(start, graph);
        List<Vertex<T>> visitedList = new ArrayList<>();
        Set<Vertex<T>> visitedSet = new HashSet<>();
        Map<Vertex<T>, List<VertexDistancePair<T>>> adjacencyList =
                graph.getAdjacencyList();

        dfsHelper(start, adjacencyList, visitedList, visitedSet);

        return visitedList;
    }

    /**
     * Helper method to perform the actual recursion required to make the
     * implementation of {@code depthFirstSearch} recursive.
     *
     * @param curr the Vertex you are currently working from
     * @param adjacencyList the adjacency list associated with the Graph
     *                      passed into (@code depthFirstSearch}
     * @param <T> the data type representing the vertices in the graph.
     * @param visitedList the working {@code ArrayList} that keeps track of
     *                    which vertices have been visited in the current DFS.
     * @param visitedSet a working copy of {@code visitedList} contained
     *                   within a Hash Set. Used so that we can check if a
     *                   vertex has been visited on O(1) time, rather than O(n).
     */
    private static <T> void dfsHelper(Vertex<T> curr,
            Map<Vertex<T>, List<VertexDistancePair<T>>> adjacencyList,
            List<Vertex<T>> visitedList, Set<Vertex<T>> visitedSet) {
        visitedList.add(curr);
        visitedSet.add(curr);
        List<VertexDistancePair<T>> vdpList = adjacencyList.get(curr);
        for (VertexDistancePair<T> vdp : vdpList) {
            if (!visitedSet.contains(vdp.getVertex())) {
                dfsHelper(vdp.getVertex(), adjacencyList, visitedList,
                        visitedSet);
            }
        }
    }


    /**
     * Find the shortest distance between the start vertex and all other
     * vertices given a weighted graph where the edges only have positive
     * weights.
     *
     * Return a map of the shortest distances such that the key of each entry is
     * a node in the graph and the value for the key is the shortest distance
     * to that node from start, or Integer.MAX_VALUE (representing infinity)
     * if no path exists. You may assume that going from a vertex to itself
     * has a distance of 0.
     *
     * There are guaranteed to be no negative edge weights in the graph.
     *
     * You may import/use {@code java.util.PriorityQueue},
     * {@code java.util.Map}, and any class that implements the aforementioned
     * interface.
     *
     * @throws IllegalArgumentException if any input is null, or if
     *         {@code start} doesn't exist in the graph
     * @param start the Vertex you are starting at
     * @param graph the Graph we are searching
     * @param <T> the data type representing the vertices in the graph.
     * @return a map of the shortest distances from start to every other node
     *         in the graph.
     */
    public static <T> Map<Vertex<T>, Integer> dijkstras(Vertex<T> start,
            Graph<T> graph) {
        nullChecker(start, graph);
        // result map from VDPairs to minimum distance (converted at the end)
        Map<Vertex<T>, Integer> dijkstras;
        // result map from Vertex to
        Map<Vertex<T>, Integer> result;
        // priority queue containing all elements from {@code dijkstras}
        // sorted in order of distance from start
        Queue<VertexDistancePair<T>> pq;
        // adjacency list associated with {@code graph}
        Map<Vertex<T>, List<VertexDistancePair<T>>> adjacencyList;
        // map from VDPair to a boolean which is true iff the VDPair is in
        // the priority queue
        Map<Vertex<T>, Boolean> pqMap;
        // number of vertices in the graph
        int numVertices;

        // initialize method variables
        adjacencyList = graph.getAdjacencyList();
        numVertices = adjacencyList.keySet().size();
        dijkstras = new HashMap<>(numVertices);
        pq = new PriorityQueue<>(numVertices);
        pqMap = new HashMap<>(numVertices);
        result = new HashMap<>();


        // insert starting vertex as a VDPair
        dijkstras.put(start, 0);
        pq.offer(new VertexDistancePair<T>(start, 0));

        // insert all other vertices
        for (Vertex<T> v : adjacencyList.keySet()) {
            if (!v.equals(start)) {
                dijkstras.put(v, Integer.MAX_VALUE);
                pq.offer(new VertexDistancePair<T>(v, Integer.MAX_VALUE));
            }
            pqMap.put(v, true);
        }

        VertexDistancePair<T> u;
        while (!pq.isEmpty()) {
            u = pq.poll();
            pqMap.put(u.getVertex(), false);
            for (VertexDistancePair<T> v : adjacencyList.get(u.getVertex())) {
                // if v is in the PQ
                if (pqMap.get(v.getVertex())) {
                    int dU = dijkstras.get(u.getVertex());
                    int wUV = 0;
                    for (VertexDistancePair<T> vdp : adjacencyList.get(u
                            .getVertex())) {
                        if (vdp.getVertex().equals(v.getVertex())) {
                            wUV = vdp.getDistance();
                        }
                    }
                    int dV = dijkstras.get(v.getVertex());
                    if (dU + wUV < dV) {
                        dijkstras.put(v.getVertex(), dU + wUV);
                        pq.remove(v);
                        pq.add(new VertexDistancePair<T>(
                                v.getVertex(), dU + wUV));
                    }
                }
            }
        }
        /*
        for (VertexDistancePair<T> vdp : dijkstras.keySet()) {
            result.put(vdp.getVertex(), dijkstras.get(vdp));
        }*/


        return dijkstras;
    }

    /**
     * Run Prim's algorithm on the given graph and return the minimum spanning
     * tree in the form of a set of Edges.  If the graph is disconnected, and
     * therefore there is no valid MST, return null.
     *
     * When exploring a Vertex, make sure you explore in the order that the
     * adjacency list returns the neighbors to you.  Failure to do so may
     * cause you to lose points.
     *
     * You may assume that for a given starting vertex, there will only be
     * one valid MST that can be formed. In addition, only an undirected graph
     * will be passed in.
     *
     * You may import/use {@code java.util.PriorityQueue},
     * {@code java.util.Set}, and any class that implements the aforementioned
     * interface.
     *
     * @throws IllegalArgumentException if any input is null, or if
     *         {@code start} doesn't exist in the graph
     * @param start the Vertex you are starting at
     * @param graph the Graph we are searching
     * @param <T> the data type representing the vertices in the graph.
     * @return the MST of the graph; null if no valid MST exists.
     */
    public static <T> Set<Edge<T>> prims(Vertex<T> start, Graph<T> graph) {
        nullChecker(start, graph);
        // priority queue of all currently
        Queue<Edge<T>> pq;
        // returned set of edges that form the MST
        Set<Edge<T>> prims;
        // set of visited vertices
        Set<Vertex<T>> visited;
        // adjacency list representing {@code graph}
        Map<Vertex<T>, List<VertexDistancePair<T>>> adjacencyList;
        Edge<T> e;

        pq = new PriorityQueue<>();
        prims = new HashSet<>();
        visited = new HashSet<>();
        adjacencyList = graph.getAdjacencyList();

        visited.add(start);
        for (VertexDistancePair<T> vdp : graph.getAdjacencyList().get(start)) {
            pq.add(new Edge<T>(start, vdp.getVertex(), vdp.getDistance(),
                    false));
        }

        while (!pq.isEmpty()
                && visited.size() < adjacencyList.keySet().size()) {
            e = pq.poll();
            if (!visited.contains(e.getV())) {
                prims.add(e);
                visited.add(e.getV());
                if (visited.size() < graph.getAdjacencyList().keySet().size()) {
                    for (VertexDistancePair<T> vdp
                            : graph.getAdjacencyList().get(e.getV())) {
                        if (!visited.contains(vdp.getVertex())) {
                            pq.add(new Edge<T>(e.getV(), vdp.getVertex(),
                                    vdp.getDistance(), false));
                        }
                    }
                }
            }
        }
        if (visited.size() != adjacencyList.keySet().size()) {
            return null;
        }
        return prims;
    }

}
