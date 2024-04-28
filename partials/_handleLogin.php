<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    include '_dbconnect.php'; // Ensure your database connection file is correct

    $username = mysqli_real_escape_string($conn, $_POST["loginusername"]);
    $password = mysqli_real_escape_string($conn, $_POST["loginpassword"]);

    // SQL to check if the username exists in the database
    $sql = "SELECT * FROM users WHERE username='$username'";
    $result = mysqli_query($conn, $sql);
    $num = mysqli_num_rows($result);

    if ($num == 1) {
        $row = mysqli_fetch_assoc($result);
        $userId = $row['id'];

        // Verify the password with the hashed password in the database
        if (password_verify($password, $row['password'])) {
            session_start();
            $_SESSION['loggedin'] = true;
            $_SESSION['username'] = $username;
            $_SESSION['userId'] = $userId;

            // Log login success
            logEvent($conn, $userId, 'Login', 'User logged in successfully: ' . $username);
            header("location: /OnlineFoodDelivery/index.php?loginsuccess=true");
            exit();
        } else {
            // Log failed login attempt (wrong password)
            logEvent($conn, $userId, 'Login Failed', 'Failed login attempt (wrong password): ' . $username);
            header("location: /OnlineFoodDelivery/index.php?loginsuccess=false&error=Password incorrect");
        }
    } else {
        // Log failed login attempt (username not found)
        logEvent($conn, null, 'Login Failed', 'Failed login attempt (username not found): ' . $username);
        header("location: /OnlineFoodDelivery/index.php?loginsuccess=false&error=Username not found");
    }
}

// Function to insert logs into the system_logs table
function logEvent($conn, $userId, $eventType, $description)
{
    $stmt = $conn->prepare("INSERT INTO `system_logs` (user_id, event_type, description, created_at) VALUES (?, ?, ?, NOW())");
    $stmt->bind_param("iss", $userId, $eventType, $description);
    if ($stmt->execute()) {
        $stmt->close();
    } else {
        echo "Failed to insert log: " . $conn->error; // Handle errors quietly in production
    }
}
