import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Your implementations of various string searching algorithms.
 *
 * @author John Pratt
 * @version FINAL
 */
public class StringSearching {

    /**
     * Helper method - just for throwing an IllegalArgmentException if the
     * pattern passed into a method in this class would throw such exception.
     * @param pattern the string pattern to be inpsected
     * @param emptyCheck true iff pattern needs to be checked for being
     *                   empty.
     * @throws IllegalArgumentException iff pattern is null or
     *          iff the string needs to be checked for being empty and it is
     *          empty.
     */
    private static void patternCheck(CharSequence pattern, boolean emptyCheck) {
        if (pattern == null) {
            throw new IllegalArgumentException("Cannot search for a null "
                    + "pattern!");
        } else if (emptyCheck && pattern.length() == 0) {
            throw new IllegalArgumentException("Cannot search for an empty "
                    + "pattern!");
        }
    }

    /**
     * Helper method - just for throwing an IllegalArgmentException if the
     * text passed into a method in this class would throw such exception.
     * @param text text to be checked
     * @throws IllegalArgumentException iff text is null
     */
    private static void textCheck(CharSequence text) {
        if (text == null) {
            throw new IllegalArgumentException("Cannot search through a null "
                    + "text!");
        }
    }

    /**
     * Knuth-Morris-Pratt (KMP) algorithm that relies on the failure table (also
     * called failure function). Works better with small alphabets.
     *
     * Make sure to implement the failure table before implementing this method.
     *
     * @throws IllegalArgumentException if the pattern is null or of length 0
     * @throws IllegalArgumentException if text is null
     * @param pattern the pattern you are searching for in a body of text
     * @param text the body of text where you search for pattern
     * @return list of integers representing the first index a match occurs or
     * an empty list if the text is of length 0
     */
    public static List<Integer> kmp(CharSequence pattern, CharSequence text) {
        patternCheck(pattern, true);
        textCheck(text);
        List<Integer> result = new ArrayList<>();
        int length = text.length();

        return null;
    }

    /**
     * Builds failure table that will be used to run the Knuth-Morris-Pratt
     * (KMP) algorithm.
     *
     * The table built should be the length of the input text.
     *
     * Note that a given index i will be the largest prefix of the pattern
     * indices [0..i] that is also a suffix of the pattern indices [1..i].
     * This means that index 0 of the returned table will always be equal to 0
     *
     * Ex. ababac
     *
     * table[0] = 0
     * table[1] = 0
     * table[2] = 1
     * table[3] = 2
     * table[4] = 3
     * table[5] = 0
     *
     * If the pattern is empty, return an empty array.
     *
     * @throws IllegalArgumentException if the pattern is null
     * @param pattern a {@code CharSequence} you are building failure table for
     * @return integer array of size text.length that you are building a failure
     * table for
     */
    public static int[] buildFailureTable(CharSequence pattern) {
        patternCheck(pattern, false);
        return null;
    }

    /**
     * Boyer Moore algorithm that relies on last table. Works better with large
     * alphabets.
     *
     * Make sure to implement the last table before implementing this method.
     *
     * @throws IllegalArgumentException if the pattern is null or of length 0
     * @throws IllegalArgumentException if text is null
     * @param pattern the pattern you are searching for in a body of text
     * @param text the body of text where you search for the pattern
     * @return list of integers representing the first index a match occurs or
     * an empty list if the text is of length 0
     */
    public static List<Integer> boyerMoore(CharSequence pattern,
            CharSequence text) {
        patternCheck(pattern, true);
        textCheck(text);

        List<Integer> matches = new ArrayList<>();
        int textLen = text.length();
        int patternLen = pattern.length();
        if (textLen < patternLen || textLen == 0) {
            return matches;
        }
        Map<Character, Integer> lastTable = buildLastTable(pattern);
        int txtIter = 0; /* iterator for text in general */
        int txtMatchIter;       /* iterator for text while searching the
                                specific substring */
        int patMatchIter;       // iterator for pattern while matching
        int firstMismatchInd;   /* first found mismatch character from
                                   pattern */
        char firstMisMatch;  /* first mismatching character of the
                                current substring */
        Integer shift;  /* amount to shift the pattern over once searching
                         terminates for the current substring */
        while (txtIter <= textLen - patternLen) {
            firstMismatchInd = -1;
            firstMisMatch = '\0';
            txtMatchIter = txtIter + patternLen - 1;
            patMatchIter = patternLen - 1;
            while (txtMatchIter >= txtIter) {
                if (text.charAt(txtMatchIter) != pattern.charAt(patMatchIter)) {
                    //System.out.println("Mismatch found at index " +
                    //        txtMatchIter + " - " + text.charAt(txtMatchIter));
                    firstMisMatch = text.charAt(txtMatchIter);
                    firstMismatchInd = txtMatchIter;
                } /*else {
                    //System.out.println("Char match at index " + txtMatchIter
                    //        + " - " + text.charAt(txtMatchIter));
                }*/
                patMatchIter--;
                txtMatchIter--;
            }
            // we found a match if the pattern iterator managed to pass
            // through the entire current substring (which would make its
            // value -1) and the location of the first mismatch is undefined
            // (-1 in our case)
            if (patMatchIter < 0 && firstMismatchInd == -1) {
                matches.add(txtIter);
                txtIter += patternLen;
                // if we didn't find a match...
            } else {
                // find out how much we have to shift
                shift = lastTable.get(text.charAt(txtMatchIter));
                if (shift == null) {
                    /*System.out.println("Looking for \"" + pattern + "\". "
                            + "- Char "+ firstMisMatch + " was not in the "
                            + "last "
                            + "table.");*/
                    txtIter += patternLen;
                } else {
                    /*System.out.println("Looking for \"" + pattern + "\". "
                            + "* Char "+ firstMisMatch + " was in the last "
                            + "table at index " + shift);*/
                    txtIter += shift;
                }
            }

        }

        return matches;
    }

    /**
     * Helper method - attempts to find a match between a substring of text
     * and the string pattern when searching with Boyer-Moore. Starts
     * searching backward from start, going to cutoff, and back checks the chars
     * found via lastTable.
     * @param text string to be searched
     * @param pattern string pattern to be found inside text
     * @param start the starting index from which to work backwards from,
     *              inside text
     * @param cutoff the value of the iterator for the text string at which
     *               to stop searching (EXLUSIVE)
     * @param lastTable the Last Table through which chars are checked
     * @return an integer array. The value at the first index represents the
     * last index of the first mismatched character in the current
     * pattern-match from the text. If the character is not within the last
     * table, this value is -1. The second index represents the new value the
     * text iterator (txtIterator in the Boyer-Moore search method should
     * take) after the search is completed.
     * @throws IllegalArgumentException iff pattern is null or
     *          iff the string needs to be checked for being empty and it is
     *          empty.
     */
    private static int[] matchBM(CharSequence text, CharSequence pattern, int
            start, int cutoff, Map<Character, Integer> lastTable) {
        int i = start;
        int j = pattern.length() - 1;
        do {
            if (text.charAt(i) == pattern.charAt(j)) {
                if (j == 0) {
                    return new int[] {i, j};
                } else {
                    i--;
                    j--;
                }
            } else {
                Integer l = lastTable.get(text.charAt(i));
                l = (l == null) ? -1 : l;
                int min = j <= 1 + l ? j : 1 + l;
                i = i + pattern.length() - min;
                j = pattern.length() - 1;
            }
        } while (i <= text.length() - 1);
        return new int[] {-1};
    }

    /*
    private static Integer matchBM(CharSequence pattern, CharSequence text,
                                  int start, int end) {
        if (start - end == pattern.length()) {
            for (int i = start; i > end; i--) {
                if (text.charAt(i) != pattern.charAt(i - end)) {
                    return
                }
            }
        }
        return Integer.MAX_VALUE;
    }*/

    /**
     * Builds last occurrence table that will be used to run the Boyer Moore
     * algorithm.
     *
     * Note that each char x will have an entry at table.get(x).
     * Each entry should be the last index of x where x is a particular
     * character in your pattern.
     * If x is not in the pattern, then the table will not contain the key x
     * and you will have to check for that in your BoyerMoore
     *
     * Ex. octocat
     *
     * table.get(o) = 3
     * table.get(c) = 4
     * table.get(t) = 6
     * table.get(a) = 5
     * table.get(everything else) = null, which you will interpret in
     * Boyer-Moore as -1
     *
     * If the pattern is empty, return an empty map.
     *
     * @throws IllegalArgumentException if the pattern is null
     * @param pattern a {@code CharSequence} you are building last table for
     * @return a Map with keys of all of the characters in the pattern mapping
     *         to their last occurrence in the pattern
     */
    public static Map<Character, Integer> buildLastTable(CharSequence pattern) {
        patternCheck(pattern, false);
        Map<Character, Integer> lastTable = new HashMap<>();
        for (int i = 0; i < pattern.length(); i++) {
            lastTable.put(pattern.charAt(i), i);
        }
        return lastTable;
    }

    /**
     * Prime base used for Rabin-Karp hashing.
     * DO NOT EDIT!
     */
    private static final int BASE = 337;

    /**
     * Runs Rabin-Karp algorithm. Generate initial hash, and compare it with
     * hash from substring of text same length as pattern. If the two
     * hashes match compare their individual characters, else update hash
     * and continue.
     *
     * @throws IllegalArgumentException if the pattern is null or of length 0
     * @throws IllegalArgumentException if text is null
     * @param pattern a string you're searching for in a body of text
     * @param text the body of text where you search for pattern
     * @return list of integers representing the first index a match occurs or
     * an empty list if the text is of length 0
     */
    // fixme Too many charAt calls
    public static List<Integer> rabinKarp(CharSequence pattern,
            CharSequence text) {
        patternCheck(pattern, true);
        textCheck(text);
        List<Integer> matches = new ArrayList<>();
        int textLen = text.length();
        int patternLen = pattern.length();
        if (textLen < patternLen || textLen == 0) {
            return matches;
        }
        int patternHash = generateHash(pattern,
                patternLen);
        int textHash = generateHash(text, patternLen);
        char newChar;
        for (int i = 0; i <= textLen - patternLen; i++) {
            if (patternHash == textHash && matchRK(text, pattern, i,
                    i + patternLen)) {
                matches.add(i);
            }
            try {
                newChar = text.charAt(i + patternLen);
            } catch (IndexOutOfBoundsException e) {
                return matches;
            }
            textHash = updateHash(textHash, patternLen, text.charAt(i),
                    newChar);
        }
        return matches;
    }

    /**
     * TL;DR: Checks if two strings are equal
     * Checks if all characters between start (inclusive) and end (exclusive)
     * in the string called text match all characters between 0 (inclusive) and
     * end - pattern.length (exclusive) in the string called pattern.
     *
     * @param pattern a string you're searching for in a body of text
     * @param text the body of text where you search for pattern
     * @param start the index at which to start comparing pattern to text
     * @param end the index at which to stop comparing pattern to text
     *            (exclusive)
     * @return true iff end - start and the length of pattern are equal and
     * each character in the selected substring of text and each character in
     * pattern are equal at each index of the two, respectively. Otherwise
     * return false.
     */
    private static boolean matchRK(CharSequence text, CharSequence pattern, int
            start, int end) {
        if (end - start == pattern.length()) {
            for (int i = start; i < end; i++) {
                if (text.charAt(i) != pattern.charAt(i - start)) {
                    return false; // return false if there's a char mismatch
                }
            }
            return true;
        }

        return false; // return false if the two aren't even the same length
    }

    /**
     * Hash function used for Rabin-Karp. The formula for hashing a string is:
     *
     * sum of: c * BASE ^ (pattern.length - 1 - i), where c is the integer
     * value of the current character, and i is the index of the character
     *
     * For example: Hashing "bunn" as a substring of "bunny" with base 337 hash
     * = b * 337 ^ 3 + u * 337 ^ 2 + n * 337 ^ 1 + n * 337 ^ 0 = 98 * 337 ^ 3 +
     * 117 * 337 ^ 2 + 110 * 337 ^ 1 + 110 * 337 ^ 0 = 3764054547
     *
     * However, note that that will roll over to -530912749, because the largest
     * number that can be represented by an int is 2147483647.
     *
     * Do NOT use {@code Math.pow()} in this method.
     *
     * @throws IllegalArgumentException if current is null
     * @throws IllegalArgumentException if length is negative or greater
     *     than the length of current
     * @param current substring you are generating hash function for
     * @param length the length of the string you want to generate the hash for,
     * starting from index 0. For example, if length is 4 but current's length
     * is 6, then you include indices 0-3 in your hash (and pretend the actual
     * length is 4)
     * @return hash of the substring
     */
    public static int generateHash(CharSequence current, int length) {
        if (current == null) {
            throw new IllegalArgumentException("Failed to generate a hash "
                    + "value: current substring cannot be null.");
        } else if (length < 0) {
            throw new IllegalArgumentException("Failed to generate a "
                    + "hash: the length of the pattern cannot be negative.");
        } else if (current.length() < length) {
            throw new IllegalArgumentException("Failed to generate a "
                    + "hash: length of  current substring cannot be less than"
                    + " length of pattern.");
        }
        int result = 0;
        int charInt;
        for (int i = 0; i < length; i++) {
            charInt = current.charAt(i);
            result = result * BASE + charInt;
        }
        return result;
    }

    /**
     * Updates a hash in constant time to avoid constantly recalculating
     * entire hash. To update the hash:
     *
     *  remove the oldChar times BASE raised to the length - 1, multiply by
     *  BASE, and add the newChar.
     *
     * For example: Shifting from "bunn" to "unny" in "bunny" with base 337
     * hash("unny") = (hash("bunn") - b * 337 ^ 3) * 337 + y * 337 ^ 0 =
     * (3764054547 - 98 * 337 ^ 3) * 337 + 121 * 337 ^ 0 = 4490441882
     *
     * However, the number will roll over to 195474586.
     *
     * The computation of BASE raised to length - 1 may require O(log n) time,
     * but the method should otherwise run in O(1).
     *
     * Do NOT use {@code Math.pow()} in this method.
     *
     * @throws IllegalArgumentException if length is negative
     * @param oldHash hash generated by generateHash
     * @param length length of pattern/substring of text
     * @param oldChar character we want to remove from hashed substring
     * @param newChar character we want to add to hashed substring
     * @return updated hash of this substring
     */
    public static int updateHash(int oldHash, int length, char oldChar,
            char newChar) {
        if (length < 0) {
            throw new IllegalArgumentException("Failed to update hash - "
                    + "pattern length cannot be negative.");
        }

        int oldCharInt = oldChar;
        int newCharInt = newChar;
        return (oldHash - oldChar * pow(BASE, length - 1)) * BASE
                + newCharInt;
    }
    
    /**
     * Calculate the result of a number raised to a power. Use this method in
     * your rapin karp instead of {@code Math.pow()}.
     * 
     * DO NOT MODIFY THIS METHOD.
     *
     * @throws IllegalArgumentException if both {@code base} and {@code exp} are
     * 0
     * @throws IllegalArgumentException if {@code exp} is negative
     * @param base base of the number
     * @param exp power to raise the base to. Must be 0 or greater.
     * @return result of the base raised to that power
     */
    private static int pow(int base, int exp) {
        if (exp < 0) {
            throw new IllegalArgumentException("Exponent cannot be negative.");
        } else if (base == 0 && exp == 0) {
            throw new IllegalArgumentException(
                    "Both base and exponent cannot be 0.");
        } else if (exp == 0) {
            return 1;
        } else if (exp == 1) {
            return base;
        }
        int halfPow = pow(base, exp / 2);
        if (exp % 2 == 0) {
            return halfPow * halfPow;
        } else {
            return halfPow * pow(base, (exp / 2) + 1);
        }
    }
}
