import static org.junit.Assert.*;
import org.junit.*;
import driver_management.*;

public class DodgemCarTest {

  DodgemCar;

  @before
  public void before(){
    car = new DodgemCar();
  }

  @Test
  public void driveDistanceReturnsTime() {
    assertEquals(100, car.driveDistance());
  }
}