// Main Application Class
@SpringBootApplication
public class CarMarketApplication {
    public static void main(String[] args) {
        SpringApplication.run(CarMarketApplication.class, args);
    }
}

// Car Entity Class
@Entity
public class Car {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String make;
    private String model;
    private int year;
    private double price;
    private int mileage;
    private String fuelType;
    private String transmission;
    private String imageUrl;

    // Constructors, Getters, and Setters
    public Car() {}
}

// Car Repository Interface
public interface CarRepository extends JpaRepository<Car, Long> {
    List<Car> findByMakeContainingIgnoreCase(String make);
    List<Car> findByModelContainingIgnoreCase(String model);
    List<Car> findByPriceLessThanEqual(double maxPrice);
}

// Car Controller
@RestController
@RequestMapping("/api/cars")
@CrossOrigin(origins = "http://localhost:3000") // Adjust for your frontend
public class CarController {

    @Autowired
    private CarRepository carRepository;

    // Get all cars
    @GetMapping
    public ResponseEntity<List<Car>> getAllCars() {
        return ResponseEntity.ok(carRepository.findAll());
    }

    // Search cars
    @GetMapping("/search")
    public ResponseEntity<List<Car>> searchCars(
            @RequestParam(required = false) String make,
            @RequestParam(required = false) String model,
            @RequestParam(required = false) Double maxPrice) {
        
        Specification<Car> spec = Specification.where(null);
        
        if (make != null && !make.isEmpty()) {
            spec = spec.and((root, query, cb) -> 
                cb.like(cb.lower(root.get("make")), "%" + make.toLowerCase() + "%"));
        }
        
        if (model != null && !model.isEmpty()) {
            spec = spec.and((root, query, cb) -> 
                cb.like(cb.lower(root.get("model")), "%" + model.toLowerCase() + "%"));
        }
        
        if (maxPrice != null) {
            spec = spec.and((root, query, cb) -> 
                cb.lessThanOrEqualTo(root.get("price"), maxPrice));
        }
        
        return ResponseEntity.ok(carRepository.findAll(spec));
    }

    // Add new car
    @PostMapping
    public ResponseEntity<Car> addCar(@RequestBody Car car) {
        return ResponseEntity.ok(carRepository.save(car));
    }

    // Get single car by ID
    @GetMapping("/{id}")
    public ResponseEntity<Car> getCarById(@PathVariable Long id) {
        return carRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
}

// Example Service Class (optional)
@Service
public class CarService {
    private final CarRepository carRepository;

    public CarService(CarRepository carRepository) {
        this.carRepository = carRepository;
    }

    public List<Car> searchCars(String make, String model, Double maxPrice) {
        // Implementation can be added here for complex business logic
        return carRepository.findAll();
    }
}
