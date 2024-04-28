<?php
include 'partials/_dbconnect.php';
// Query to fetch system logs ordered by the latest entries
$sql = "SELECT * FROM `system_logs` ORDER BY `created_at` DESC";
$result = mysqli_query($conn, $sql);

// Error handling if the query fails
if (!$result) {
    echo "Error fetching logs: " . mysqli_error($conn);
    exit;
}
?>
<div class="container" style="margin-top:98px;background: aliceblue;">
    <div class="table-wrapper">
        <div class="table-title" style="border-radius: 14px; background-color: #242529; color: white;">
            <div class="row">
                <div class="col-sm-4">
                    <h2>System <b>Logs</b></h2>
                </div>
                <div class="col-sm-8 text-sm-right">
                    <a href="#" onclick="refreshLogList(); return false;" class="btn btn-primary">
                        <i class="material-icons">&#xE863;</i> <span>Refresh List</span>
                    </a>
                    <a href="#" onclick="window.print()" class="btn btn-info"><i class="material-icons">&#xE24D;</i> <span>Print</span></a>
                </div>
            </div>
        </div>

        <div class="table-responsive">
            <table class="table table-striped table-hover text-center" id="NoOrder">
                <thead style="background-color: #242529; color: white;">
                    <tr>
                        <th>Log ID</th>
                        <th>User ID</th>
                        <th>Event Type</th>
                        <th>Description</th>
                        <th>Date/Time</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $counter = 0;
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
                    if ($counter == 0) {
                        echo '<tr><td colspan="5" class="text-center">No logs found.</td></tr>';
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</div>


<?php
include 'partials/_orderItemModal.php';
include 'partials/_orderStatusModal.php';
?>

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style>
    .tooltip.show {
        top: -62px !important;
    }

    .table-wrapper .btn {
        float: right;
        color: #333;
        background-color: #fff;
        border-radius: 3px;
        border: none;
        outline: none !important;
        margin-left: 10px;
    }

    .table-wrapper .btn:hover {
        color: #333;
        background: #f2f2f2;
    }

    .table-wrapper .btn.btn-primary {
        color: #fff;
        background: #03A9F4;
    }

    .table-wrapper .btn.btn-primary:hover {
        background: #03a3e7;
    }

    .table-title .btn {
        font-size: 13px;
        border: none;
    }

    .table-title .btn i {
        float: left;
        font-size: 21px;
        margin-right: 5px;
    }

    .table-title .btn span {
        float: left;
        margin-top: 2px;
    }

    .table-title {
        color: #fff;
        background: #4b5366;
        padding: 16px 25px;
        margin: -20px -25px 10px;
        border-radius: 3px 3px 0 0;
    }

    .table-title h2 {
        margin: 5px 0 0;
        font-size: 24px;
    }

    table.table tr th,
    table.table tr td {
        border-color: #e9e9e9;
        padding: 12px 15px;
        vertical-align: middle;
    }

    table.table tr th:first-child {
        width: 60px;
    }

    table.table tr th:last-child {
        width: 80px;
    }

    table.table th i {
        font-size: 13px;
        margin: 0 5px;
        cursor: pointer;
    }

    table.table td a {
        font-weight: bold;
        color: #566787;
        display: inline-block;
        text-decoration: none;
    }

    table.table td a:hover {
        color: #2196F3;
    }

    table.table td a.view {
        width: 30px;
        height: 30px;
        color: #2196F3;
        border: 2px solid;
        border-radius: 30px;
        text-align: center;
    }

    table.table td a.view i {
        font-size: 22px;
        margin: 2px 0 0 1px;
    }

    table.table .avatar {
        border-radius: 50%;
        vertical-align: middle;
        margin-right: 10px;
    }

    table {
        counter-reset: section;
    }

    .count:before {
        counter-increment: section;
        content: counter(section);
    }
</style>

<script>
    $(document).ready(function() {
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
    function refreshLogList() {
        $.ajax({
            url: "fetch_logs.php", // Make sure this path is correct
            type: "GET",
            success: function(data) {
                $('#NoOrder tbody').html(data);
            },
            error: function() {
                alert("Error loading logs.");
            }
        });
    }
</script>