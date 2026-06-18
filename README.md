# 🛒 ShopHub - Full Stack E-Commerce Store

A complete e-commerce web application built for the CodeAlpha Full Stack Development Internship.

---

## 📋 Table of Contents

- [About The Project](#about-the-project)
- [Built With](#built-with)
- [Features](#features)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [API Endpoints](#api-endpoints)
- [Testing Credentials](#testing-credentials)
- [Screenshots](#screenshots)
- [Contributors](#contributors)
- [License](#license)

---

## 🚀 About The Project

**ShopHub** is a full-featured e-commerce platform that demonstrates modern full-stack development practices. It provides a seamless shopping experience with product browsing, cart management, user authentication, and order processing capabilities.

This project was developed as part of the **CodeAlpha Full Stack Development Internship**, showcasing skills in frontend design, backend API development, and database integration.

---

## 🛠 Built With

### Frontend
- **HTML5** - Semantic markup
- **CSS3** - Custom styling with responsive design
- **Vanilla JavaScript** - Dynamic functionality

### Backend
- **Node.js** - JavaScript runtime
- **Express.js** - Web framework
- **MySQL** - Relational database
- **JWT** - Authentication
- **bcrypt** - Password hashing

---

## ✨ Features

### Product Management
- Browse products with search functionality
- Filter by category
- Sort by price or newest
- Detailed product view with quantity selection

### Shopping Cart
- Add/remove items dynamically
- Update quantities in real-time
- View cart totals
- Local storage persistence

### User Authentication
- Secure registration and login
- JWT token-based authentication
- Protected routes for authorized users

### Order Processing
- Create orders from cart items
- View complete order history
- Track order status

### Responsive Design
- Mobile-first approach
- Works on desktop, tablet, and mobile

---

## 📁 Project Structure

```
codealpha-ecommerce/
├── backend/
│   ├── src/
│   │   ├── config/
│   │   │   └── database.js
│   │   ├── models/
│   │   │   ├── User.js
│   │   │   ├── Product.js
│   │   │   ├── Cart.js
│   │   │   └── Order.js
│   │   ├── controllers/
│   │   │   ├── authController.js
│   │   │   ├── productController.js
│   │   │   ├── cartController.js
│   │   │   └── orderController.js
│   │   ├── routes/
│   │   │   ├── auth.js
│   │   │   ├── products.js
│   │   │   ├── cart.js
│   │   │   └── orders.js
│   │   ├── middleware/
│   │   │   └── auth.js
│   │   └── app.js
│   ├── package.json
│   ├── .env
│   └── seed.sql
│
└── frontend/
    ├── index.html
    ├── css/
    │   └── style.css
    ├── js/
    │   ├── api.js
    │   ├── auth.js
    │   ├── cart.js
    │   ├── app.js
    │   └── main.js
    └── assets/
        └── images/
```

---

## 💻 Installation

### Prerequisites

- **Node.js** (v14 or higher)
- **MySQL** (v5.7 or higher)
- **npm** (v6 or higher)

### Step 1: Clone the Repository

```bash
git clone https://github.com/yourusername/codealpha-ecommerce.git
cd codealpha-ecommerce
```

### Step 2: Backend Setup

```bash
cd backend
npm install
```

### Step 3: Database Setup

```bash
# Import database schema and sample data
mysql -u root -p < seed.sql

# Update .env file with your credentials
```

Create a `.env` file in the `backend` directory:

```env
PORT=5000
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=yourpassword
DB_NAME=ecommerce_db
JWT_SECRET=your_super_secret_key_here
JWT_EXPIRE=7d
NODE_ENV=development
```

### Step 4: Start Backend Server

```bash
npm run dev
# Server runs on http://localhost:5000
```

### Step 5: Frontend Setup

```bash
cd ../frontend

# Option 1: Using VS Code Live Server
# Right-click index.html and select "Open with Live Server"

# Option 2: Using Python
python3 -m http.server 3000

# Option 3: Using Node.js http-server
npx http-server -p 3000
```

### Step 6: Access the Application

- **Frontend:** `http://localhost:3000`
- **Backend API:** `http://localhost:5000/api`
- **Health Check:** `http://localhost:5000/api/health`

---

## 🔗 API Endpoints

### Authentication

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/auth/register` | Register new user |
| POST | `/api/auth/login` | Login user |
| GET | `/api/auth/me` | Get current user (protected) |

### Products

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/products` | Get all products |
| GET | `/api/products/:id` | Get product by ID |
| POST | `/api/products` | Add product (admin) |
| PUT | `/api/products/:id` | Update product (admin) |
| DELETE | `/api/products/:id` | Delete product (admin) |

### Cart

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/cart` | Get user's cart |
| POST | `/api/cart/add` | Add item to cart |
| PUT | `/api/cart/update` | Update cart item |
| DELETE | `/api/cart/remove/:id` | Remove from cart |
| DELETE | `/api/cart/clear` | Clear cart |

### Orders

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/orders` | Create order |
| GET | `/api/orders` | Get user's orders |
| GET | `/api/orders/:id` | Get order by ID |
| PUT | `/api/orders/:id/status` | Update order status (admin) |

---

## 🧪 Testing Credentials

| Role | Email | Password |
|------|-------|----------|
| User | `test@example.com` | `password123` |
| Admin | `admin@example.com` | `password123` |

---

## 📸 Screenshots

### Home Page
*Product grid with search, filters, and sorting*

### Product Detail
*Detailed view with quantity selector*

### Shopping Cart
*Cart management with quantity controls*

### Order History
*Complete order tracking*

---

## 👨‍💻 Contributors

- **Kamil Hassan** - Full Stack Developer
- **CodeAlpha** - Internship Program

---

## 📄 License

This project is created for educational purposes as part of the CodeAlpha Full Stack Development Internship.

---

## 📬 Contact

- **Website:** [www.codealpha.tech](https://www.codealpha.tech)
- **WhatsApp:** +91 9336576683
- **Email:** services@codealpha.tech

---

## 🙏 Acknowledgments

- CodeAlpha for providing this internship opportunity
- All open-source libraries and tools used in this project

---

**Built with ❤️ by Kamil Hassan**
