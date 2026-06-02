<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complaint Management System - Sign Up</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            width: 100%;
            max-width: 1200px;
        }

        .form-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 40px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }

        .info-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 50px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .info-section h1 {
            font-size: 2.5em;
            margin-bottom: 20px;
            font-weight: 700;
        }

        .info-section p {
            font-size: 1.1em;
            line-height: 1.8;
            margin-bottom: 20px;
            opacity: 0.9;
        }

        .features {
            list-style: none;
            margin-top: 30px;
        }

        .features li {
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }

        .features li:before {
            content: "✓";
            display: inline-block;
            width: 30px;
            height: 30px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            text-align: center;
            line-height: 30px;
            margin-right: 15px;
            font-weight: bold;
        }

        .form-section {
            padding: 50px 40px;
        }

        .form-section h2 {
            font-size: 1.8em;
            margin-bottom: 30px;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 600;
            font-size: 0.95em;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 5px;
            font-size: 1em;
            transition: border-color 0.3s;
            font-family: inherit;
        }

        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .btn-container {
            margin-top: 30px;
        }

        .btn-signup {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1.05em;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .btn-signup:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 20px rgba(102, 126, 234, 0.4);
        }

        .btn-signup:active {
            transform: translateY(0);
        }

        .login-link {
            text-align: center;
            margin-top: 20px;
        }

        .login-link p {
            color: #666;
        }

        .login-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s;
        }

        .login-link a:hover {
            color: #764ba2;
            text-decoration: underline;
        }

        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
            font-weight: 500;
        }

        .alert-error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        @media (max-width: 768px) {
            .form-container {
                grid-template-columns: 1fr;
                gap: 0;
            }

            .info-section {
                padding: 40px 30px;
                display: none;
            }

            .form-section {
                padding: 40px 30px;
            }

            .info-section h1 {
                font-size: 2em;
            }

            .form-row {
                grid-template-columns: 1fr;
            }

            .form-section h2 {
                font-size: 1.5em;
            }
        }

        .loading {
            display: none;
            text-align: center;
            margin-top: 10px;
        }

        .spinner {
            border: 4px solid #f3f3f3;
            border-top: 4px solid #667eea;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            animation: spin 1s linear infinite;
            display: inline-block;
            margin-right: 10px;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .required {
            color: #e74c3c;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <!-- Info Section -->
            <div class="info-section">
                <h1>Complaint Management System</h1>
                <p>Welcome to our unified complaint management platform designed to streamline your experience.</p>
                
                <ul class="features">
                    <li>Easy complaint submission</li>
                    <li>Real-time status tracking</li>
                    <li>Quick complaint resolution</li>
                    <li>24/7 system availability</li>
                    <li>Secure data handling</li>
                    <li>Professional support team</li>
                </ul>
            </div>

            <!-- Form Section -->
            <div class="form-section">
                <h2>Create Account</h2>

                <%
                    // Handle form submission
                    String action = request.getParameter("action");
                    String message = "";
                    boolean isError = false;

                    if ("register".equals(action)) {
                        String username = request.getParameter("username");
                        String email = request.getParameter("email");
                        String password = request.getParameter("password");
                        String confirmPassword = request.getParameter("confirmPassword");
                        String fullName = request.getParameter("fullName");
                        String phone = request.getParameter("phone");

                        // Validation
                        if (username == null || username.isEmpty()) {
                            message = "Username is required!";
                            isError = true;
                        } else if (email == null || email.isEmpty()) {
                            message = "Email is required!";
                            isError = true;
                        } else if (!email.contains("@")) {
                            message = "Invalid email format!";
                            isError = true;
                        } else if (password == null || password.isEmpty()) {
                            message = "Password is required!";
                            isError = true;
                        } else if (password.length() < 6) {
                            message = "Password must be at least 6 characters long!";
                            isError = true;
                        } else if (!password.equals(confirmPassword)) {
                            message = "Passwords do not match!";
                            isError = true;
                        } else {
                            try {
                                // Database connection (Update credentials as needed)
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection conn = DriverManager.getConnection(
                                    "jdbc:mysql://localhost:3306/complaint_management",
                                    "root",
                                    "root"
                                );

                                // Check if user already exists
                                String checkQuery = "SELECT * FROM users WHERE username = ? OR email = ?";
                                PreparedStatement checkStmt = conn.prepareStatement(checkQuery);
                                checkStmt.setString(1, username);
                                checkStmt.setString(2, email);
                                ResultSet rs = checkStmt.executeQuery();

                                if (rs.next()) {
                                    message = "Username or email already exists!";
                                    isError = true;
                                } else {
                                    // Insert new user
                                    String insertQuery = "INSERT INTO users (username, email, password, full_name, phone, user_type) VALUES (?, ?, ?, ?, ?, ?)";
                                    PreparedStatement insertStmt = conn.prepareStatement(insertQuery);
                                    insertStmt.setString(1, username);
                                    insertStmt.setString(2, email);
                                    // In production, use proper password hashing (bcrypt, SHA-256, etc.)
                                    insertStmt.setString(3, password);
                                    insertStmt.setString(4, fullName != null ? fullName : "");
                                    insertStmt.setString(5, phone != null ? phone : "");
                                    insertStmt.setString(6, "user");

                                    insertStmt.executeUpdate();
                                    message = "Account created successfully! Redirecting to login...";
                                    isError = false;

                                    // Redirect to login page after 2 seconds
                                    out.println("<meta http-equiv='refresh' content='2;url=login.jsp'>");

                                    insertStmt.close();
                                }

                                checkStmt.close();
                                conn.close();

                            } catch (ClassNotFoundException e) {
                                message = "Database driver error: " + e.getMessage();
                                isError = true;
                            } catch (SQLException e) {
                                message = "Database error: " + e.getMessage();
                                isError = true;
                            } catch (Exception e) {
                                message = "An unexpected error occurred: " + e.getMessage();
                                isError = true;
                            }
                        }
                    }

                    // Display message if exists
                    if (!message.isEmpty()) {
                        String alertClass = isError ? "alert-error" : "alert-success";
                %>
                    <div class="alert <%= alertClass %>">
                        <%= message %>
                    </div>
                <%
                    }
                %>

                <form method="post" action="signup.jsp" id="signupForm">
                    <input type="hidden" name="action" value="register">

                    <div class="form-row">
                        <div class="form-group">
                            <label for="fullName">Full Name</label>
                            <input type="text" id="fullName" name="fullName" placeholder="Enter your full name">
                        </div>
                        <div class="form-group">
                            <label for="username">Username <span class="required">*</span></label>
                            <input type="text" id="username" name="username" placeholder="Choose a username" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="email">Email <span class="required">*</span></label>
                            <input type="email" id="email" name="email" placeholder="Enter your email" required>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone Number</label>
                            <input type="tel" id="phone" name="phone" placeholder="Enter your phone number">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="password">Password <span class="required">*</span></label>
                            <input type="password" id="password" name="password" placeholder="Create a password (min 6 characters)" required>
                        </div>
                        <div class="form-group">
                            <label for="confirmPassword">Confirm Password <span class="required">*</span></label>
                            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" required>
                        </div>
                    </div>

                    <div class="btn-container">
                        <button type="submit" class="btn-signup">Create Account</button>
                        <div class="loading" id="loading">
                            <span class="spinner"></span> Creating your account...
                        </div>
                    </div>

                    <div class="login-link">
                        <p>Already have an account? <a href="login.jsp">Sign In Here</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Show loading spinner on form submit
        document.getElementById('signupForm').addEventListener('submit', function() {
            document.getElementById('loading').style.display = 'block';
        });

        // Password validation
        document.getElementById('password').addEventListener('input', function() {
            const password = this.value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            
            if (password.length < 6) {
                this.style.borderColor = '#e74c3c';
            } else {
                this.style.borderColor = '#2ecc71';
            }

            if (confirmPassword && password !== confirmPassword) {
                document.getElementById('confirmPassword').style.borderColor = '#e74c3c';
            } else if (confirmPassword) {
                document.getElementById('confirmPassword').style.borderColor = '#2ecc71';
            }
        });

        document.getElementById('confirmPassword').addEventListener('input', function() {
            const password = document.getElementById('password').value;
            
            if (password && this.value !== password) {
                this.style.borderColor = '#e74c3c';
            } else if (this.value) {
                this.style.borderColor = '#2ecc71';
            }
        });

        // Email validation
        document.getElementById('email').addEventListener('blur', function() {
            const email = this.value;
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            
            if (email && !emailRegex.test(email)) {
                this.style.borderColor = '#e74c3c';
            } else if (email) {
                this.style.borderColor = '#2ecc71';
            }
        });
    </script>
</body>
</html>
