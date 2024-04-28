<?php
$showAlert = false;
$showError = false;
function insertLog($conn, $userId, $eventType, $description)
{
    // Prepare an SQL statement to prevent SQL injection
    $stmt = $conn->prepare("INSERT INTO `system_logs` (user_id, event_type, description, created_at) VALUES (?, ?, ?, NOW())");
    $stmt->bind_param("iss", $userId, $eventType, $description);
    if ($stmt->execute()) {
        // Log successfully inserted
        $stmt->close();
    } else {
        // Error handling if needed
        echo "Failed to insert log: " . $conn->error;
    }
}
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    include '_dbconnect.php'; // Ensure your database connection is correct

    // Sanitize user inputs
    $username = mysqli_real_escape_string($conn, $_POST["username"]);
    $firstName = mysqli_real_escape_string($conn, $_POST["firstName"]);
    $lastName = mysqli_real_escape_string($conn, $_POST["lastName"]);
    $email = mysqli_real_escape_string($conn, $_POST["email"]);
    $phone = mysqli_real_escape_string($conn, $_POST["phone"]);
    $password = $_POST["password"];
    $cpassword = $_POST["cpassword"];

    // Check if the username already exists
    $existSql = "SELECT * FROM `users` WHERE username = '$username'";
    $result = mysqli_query($conn, $existSql);
    $numExistRows = mysqli_num_rows($result);

    if ($numExistRows > 0) {
        // Username already exists
        $showError = "Username Already Exists";
        insertLog($conn, null, 'Signup', 'Attempt to register with an existing username: ' . $username);
        header("Location: /OnlineFoodDelivery/index.php?signupsuccess=false&error=$showError");
        exit();
    } else {
        // Check if passwords match
        if ($password == $cpassword) {
            // Hash the password
            $hash = password_hash($password, PASSWORD_DEFAULT);

            // Insert the new user into the database
            $sql = "INSERT INTO `users` (`username`, `firstName`, `lastName`, `email`, `phone`, `password`, `joinDate`) 
                    VALUES ('$username', '$firstName', '$lastName', '$email', '$phone', '$hash', current_timestamp())";
            $result = mysqli_query($conn, $sql);
            if ($result) {
                // Registration successful
                $newUserId = $conn->insert_id; // Get the ID of the newly registered user
                insertLog($conn, $newUserId, 'Signup', 'New user registration successful: ' . $username);
                header("Location: /OnlineFoodDelivery/index.php?signupsuccess=true");
                exit();
            } else {
                // Database error
                insertLog($conn, null, 'Database Error', 'Failed to register new user: ' . $username);
            }
        } else {
            // Passwords do not match
            $showError = "Passwords do not match";
            insertLog($conn, null, 'Signup', 'Password mismatch during registration attempt: ' . $username);
            header("Location: /OnlineFoodDelivery/index.php?signupsuccess=false&error=$showError");
            exit();
        }
    }
}
