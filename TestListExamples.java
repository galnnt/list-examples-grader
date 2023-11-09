import static org.junit.Assert.*;
import org.junit.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

class IsMoon implements StringChecker {
  public boolean checkString(String s) {
    return s.equalsIgnoreCase("moon");
  }
}

public class TestListExamples {
  @Test(timeout = 500)
  public void testMergeRightEnd() {
    List<String> left = Arrays.asList("a", "b", "c");
    List<String> right = Arrays.asList("a", "d");
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("a", "a", "b", "c", "d");
    assertEquals(expected, merged);
  }

  @Test
    public void testMerge() {
        List<String> strl1 = new ArrayList<>();
        List<String> strl2 = new ArrayList<>();
        List<String> strl3 = new ArrayList<>();
        strl1.add("a");
        strl1.add("c");
        strl1.add("e");
        strl2.add("b");
        strl2.add("d");
        strl2.add("f");
        strl3.add("a");
        strl3.add("b");
        strl3.add("c");
        strl3.add("d");
        strl3.add("e");
        strl3.add("f");
        assertEquals(strl3, ListExamples.merge(strl1, strl2));
    }
}
