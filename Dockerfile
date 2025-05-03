<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AutoMarket - Used Cars</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        header {
            background-color: #333;
            color: white;
            padding: 1rem;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
        }

        .nav-links {
            list-style: none;
            display: flex;
            gap: 2rem;
        }

        .hero {
            background-image: url('car-bg.jpg');
            background-size: cover;
            height: 400px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
        }

        .search-filter {
            background-color: #f4f4f4;
            padding: 2rem;
            text-align: center;
        }

        .filter-form {
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
        }

        .car-listings {
            max-width: 1200px;
            margin: 2rem auto;
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 2rem;
            padding: 0 1rem;
        }

        .car-card {
            border: 1px solid #ddd;
            border-radius: 5px;
            overflow: hidden;
        }

        .car-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .car-info {
            padding: 1rem;
        }

        .price {
            color: green;
            font-size: 1.5rem;
            margin: 0.5rem 0;
        }

        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 1rem;
            margin-top: 2rem;
        }

        @media (max-width: 768px) {
            .nav-links {
                display: none;
            }
        }
    </style>
</head>
<body>
    <header>
        <nav>
            <h1>AutoMarket</h1>
            <ul class="nav-links">
                <li><a href="#">Home</a></li>
                <li><a href="#">Listings</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </nav>
    </header>

    <div class="hero">
        <div>
            <h2>Find Your Perfect Used Car</h2>
            <p>Browse through thousands of quality pre-owned vehicles</p>
            <button style="margin-top: 1rem; padding: 0.5rem 2rem; background-color: #007bff; color: white; border: none; border-radius: 5px;">
                Browse Cars
            </button>
        </div>
    </div>

    <div class="search-filter">
        <h3>Filter Cars</h3>
        <form class="filter-form" id="filterForm">
            <select name="make">
                <option value="">All Makes</option>
                <option value="toyota">Toyota</option>
                <option value="honda">Honda</option>
                <option value="ford">Ford</option>
            </select>
            
            <select name="price">
                <option value="">Price Range</option>
                <option value="5000">Under $5,000</option>
                <option value="10000">Under $10,000</option>
                <option value="20000">Under $20,000</option>
            </select>

            <select name="year">
                <option value="">Year</option>
                <option value="2020">2020+</option>
                <option value="2015">2015+</option>
                <option value="2010">2010+</option>
            </select>

            <input type="text" placeholder="Search by model or keyword">
            <button type="submit">Search</button>
        </form>
    </div>

    <div class="car-listings">
        <!-- Car listings would be dynamically generated in a real application -->
        <div class="car-card">
            <img src="car1.jpg" alt="Car for sale">
            <div class="car-info">
                <h3>2018 Toyota Camry</h3>
                <p class="price">$18,999</p>
                <p>Mileage: 45,000 miles</p>
                <p>Automatic | Sedan | Gas</p>
                <button style="margin-top: 1rem; padding: 0.5rem; width: 100%; background-color: #007bff; color: white; border: none;">
                    View Details
                </button>
            </div>
        </div>

        <div class="car-card">
            <img src="car2.jpg" alt="Car for sale">
            <div class="car-info">
                <h3>2015 Honda CR-V</h3>
                <p class="price">$15,500</p>
                <p>Mileage: 68,000 miles</p>
                <p>Automatic | SUV | Gas</p>
                <button style="margin-top: 1rem; padding: 0.5rem; width: 100%; background-color: #007bff; color: white; border: none;">
                    View Details
                </button>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2023 AutoMarket. All rights reserved.</p>
        <p>Contact: info@automarket.com | (555) 123-4567</p>
    </footer>

    <script>
        // Basic form submission handling
        document.getElementById('filterForm').addEventListener('submit', function(e) {
            e.preventDefault();
            // Add filtering logic here
            alert('Filtering cars...'); // Replace with actual filtering functionality
        });

        // Add more interactive features as needed
    </script>
</body>
</html>

