<?php
// Include the database connection file
include 'partials/_dbconnect.php'; // Ensure this path is correct

// Query to fetch all logs from the system_logs table, ordered by date and time descending
$sql = "SELECT * FROM `system_logs` ORDER BY `created_at` DESC";
$result = mysqli_query($conn, $sql);

if (!$result) {
    echo "Error fetching logs: " . mysqli_error($conn);
    exit;
}

$counter = 0;
// Loop through the result set
while ($row = mysqli_fetch_assoc($result)) {
    echo '<tr>
            <td>' . htmlspecialchars($row['log_id']) . '</td>
            <td>' . htmlspecialchars($row['user_id']) . '</td>
            <td>' . htmlspecialchars($row['event_type']) . '</td>
            <td>' . htmlspecialchars($row['description']) . '</td>
            <td>' . htmlspecialchars($row['created_at']) . '</td>
          </tr>';
    $counter++;
}

// Check if no logs were found and output a corresponding message
if ($counter == 0) {
    echo '<tr><td colspan="5" class="text-center">No logs found.</td></tr>';
}
