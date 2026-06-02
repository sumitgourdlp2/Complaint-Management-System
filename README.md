# Complaint Management System

A dual-module web application featuring an **Admin Panel** and **User Panel**, engineered to secure distinct workflows for complaint submission and administrative oversight.

## 📋 Overview

This is a comprehensive complaint management solution built with:
- **Java** - Backend logic and business operations
- **JDBC** - Database connectivity and operations
- **JSP** - Frontend presentation layer
- **Apache Tomcat** - Deployment server

## 🎯 Features

### User Panel
- **Complaint Submission** - Users can register and submit complaints
- **Complaint Tracking** - Track the status of submitted complaints
- **User Dashboard** - View personal complaint history
- **Profile Management** - Manage user account details

### Admin Panel
- **Complaint Management** - View and manage all submitted complaints
- **Status Updates** - Update complaint resolution status
- **User Management** - Manage registered users
- **Analytics & Reports** - Generate complaint reports and statistics

## 🚀 Prerequisites

Before running this application, ensure you have:

- **Java Development Kit (JDK)** - Version 8 or higher
  - [Download JDK](https://www.oracle.com/java/technologies/downloads/)
  
- **Apache Tomcat** - Version 9.x or higher
  - [Download Tomcat](https://tomcat.apache.org/download-9.cgi)
  
- **MySQL/MariaDB** - Database server
  - [Download MySQL](https://dev.mysql.com/downloads/mysql/)
  
- **IDE** (Optional but recommended)
  - Eclipse, IntelliJ IDEA, or NetBeans

## 📦 Project Structure

```
Complaint-Management-System/
├── ComplainManagementSystem/
│   ├── src/
│   │   └── [Java source files]
│   ├── WebContent/
│   │   ├── jsp/
│   │   │   ├── signup.jsp          (User registration - ENTRY POINT)
│   │   │   ├── login.jsp           (User login)
│   │   │   ├── admin-dashboard.jsp (Admin panel)
│   │   │   └── [Other JSP files]
│   │   ├── css/
│   │   ├── js/
│   │   └── images/
│   ├── lib/
│   │   └── [JDBC drivers and dependencies]
│   └── WEB-INF/
│       ├── web.xml
│       └── [Configuration files]
├── README.md
└── LICENSE
```

## 🔧 Installation & Setup

### Step 1: Database Setup

1. Open MySQL/MariaDB command line or MySQL Workbench
2. Create a new database:
   ```sql
   CREATE DATABASE complaint_management;
   USE complaint_management;
   ```

3. Create the required tables:
   ```sql
   -- Users Table
   CREATE TABLE users (
       user_id INT AUTO_INCREMENT PRIMARY KEY,
       username VARCHAR(50) NOT NULL UNIQUE,
       email VARCHAR(100) NOT NULL UNIQUE,
       password VARCHAR(255) NOT NULL,
       full_name VARCHAR(100),
       phone VARCHAR(15),
       user_type ENUM('user', 'admin') DEFAULT 'user',
       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
   );

   -- Complaints Table
   CREATE TABLE complaints (
       complaint_id INT AUTO_INCREMENT PRIMARY KEY,
       user_id INT NOT NULL,
       title VARCHAR(150) NOT NULL,
       description LONGTEXT NOT NULL,
       category VARCHAR(50),
       status ENUM('pending', 'in_progress', 'resolved', 'rejected') DEFAULT 'pending',
       priority ENUM('low', 'medium', 'high') DEFAULT 'medium',
       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
       FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
   );
   ```

### Step 2: Configure JDBC Connection

1. Update the database connection properties in your Java configuration class or properties file:
   ```properties
   db.driver=com.mysql.cj.jdbc.Driver
   db.url=jdbc:mysql://localhost:3306/complaint_management
   db.username=root
   db.password=your_password
   ```

2. Ensure the MySQL JDBC driver (`mysql-connector-java-x.x.x.jar`) is in the `lib` folder.

### Step 3: Deploy to Tomcat

1. **Export as WAR**: 
   - In Eclipse: Right-click project → Export → WAR file
   - Place the WAR file in `TOMCAT_HOME/webapps/`

2. **Alternative - Copy Directly**:
   ```bash
   cp -r ComplainManagementSystem TOMCAT_HOME/webapps/complaint-management
   ```

### Step 4: Start Tomcat

On **Windows**:
```bash
TOMCAT_HOME\bin\startup.bat
```

On **Linux/Mac**:
```bash
TOMCAT_HOME/bin/startup.sh
```

## 📱 Accessing the Application

Once Tomcat is running, open your browser and navigate to:

- **User Registration/Login**: `http://localhost:8080/complaint-management/jsp/signup.jsp` ⭐ **START HERE**
- **Admin Panel**: `http://localhost:8080/complaint-management/jsp/admin-dashboard.jsp`
- **User Dashboard**: `http://localhost:8080/complaint-management/jsp/user-dashboard.jsp`

## 📝 Default Credentials

**Admin Account** (after initial setup):
- Username: `admin`
- Password: `admin123`

**Note**: Change default credentials after first login for security purposes.

## 🔐 Security Features

- Password encryption using secure hashing algorithms
- SQL Injection prevention through prepared statements
- Session management for user authentication
- Role-based access control (RBAC)
- Input validation and sanitization

## 🛠️ Configuration Files

### Database Connection Pool
Optimize connection pooling for better performance

## 📊 Troubleshooting

### Issue: Database Connection Failed
- Verify MySQL server is running
- Check database credentials in configuration
- Ensure JDBC driver is in classpath

### Issue: JSP Pages Not Loading
- Check Tomcat logs: `TOMCAT_HOME/logs/catalina.out`
- Verify JSP files are in correct location (`WebContent/jsp/`)
- Clear Tomcat work directory and restart: `TOMCAT_HOME/work/`

### Issue: ClassNotFoundException for JDBC Driver
- Download MySQL JDBC driver (mysql-connector-java-8.0.x.jar)
- Add to `ComplainManagementSystem/WebContent/WEB-INF/lib/` folder
- Rebuild and redeploy the application

### Issue: Port 8080 Already in Use
- Change Tomcat port in `TOMCAT_HOME/conf/server.xml` (connector port)
- Or kill the process using port 8080

## 📚 Technology Stack

| Component | Version |
|-----------|---------|
| Java | JDK 8+ |
| JSP | 2.3+ |
| Tomcat | 9.x+ |
| MySQL | 5.7+ |
| JDBC | 8.0+ |
| HTML5 | Latest |
| CSS3 | Latest |
| JavaScript | ES6+ |

## 🚀 Quick Start (Step-by-Step)

1. **Install Prerequisites**
   - Download and install JDK, Tomcat, and MySQL

2. **Setup Database**
   ```bash
   mysql -u root -p < database_setup.sql
   ```

3. **Configure Connection**
   - Update database credentials in `signup.jsp` (lines: 238-241)

4. **Deploy Application**
   ```bash
   cp -r ComplainManagementSystem TOMCAT_HOME/webapps/complaint-management
   ```

5. **Start Tomcat**
   ```bash
   TOMCAT_HOME/bin/startup.sh
   ```

6. **Access Application**
   - Open browser: `http://localhost:8080/complaint-management/jsp/signup.jsp`

## 📝 File Descriptions

- **signup.jsp** - User registration page (entry point)
- **login.jsp** - User and admin login page
- **admin-dashboard.jsp** - Admin complaint management interface
- **user-dashboard.jsp** - User complaint submission and tracking interface

## 🤝 Contributing

Contributions are welcome! Please:
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is open source and available under the MIT License.

## 📞 Support

For issues, questions, or suggestions:
- Create an issue on GitHub
- Contact: sumitgourdlp2

## 🎓 Learning Resources

- [Java JSP Tutorial](https://www.w3schools.com/jsp/)
- [JDBC Guide](https://docs.oracle.com/javase/tutorial/jdbc/)
- [Apache Tomcat Documentation](https://tomcat.apache.org/tomcat-9.0-doc/)
- [MySQL Tutorial](https://www.w3schools.com/mysql/)
- [HTML/CSS/JavaScript](https://www.w3schools.com/whatis/)

## 📋 Checklist for Setup

- [ ] JDK installed and JAVA_HOME set
- [ ] Tomcat downloaded and configured
- [ ] MySQL server running
- [ ] Database created: `complaint_management`
- [ ] Tables created in database
- [ ] JDBC driver added to project
- [ ] Database credentials updated in code
- [ ] Application deployed to Tomcat
- [ ] Tomcat server started
- [ ] Able to access `http://localhost:8080/complaint-management/jsp/signup.jsp`

---

**Last Updated**: June 2, 2026  
**Version**: 1.0.0  
**Status**: ✅ Ready for Deployment

