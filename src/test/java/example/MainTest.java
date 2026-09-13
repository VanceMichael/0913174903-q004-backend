package example;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;

class MainTest {
    @Test void healthIsReady() { assertEquals("ok", new HealthController().health().get("status")); }
}
