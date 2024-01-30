<!DOCTYPE html>
<html>
<head>
    <title>Employees</title>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
        }
    </style>
</head>
<body>
<?php
$servername = "10.10.20.11";
$username = "webuser";
$password = "password";
$dbname = "myDatabase";

try {
  // Create connection
  $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
  // set the PDO error mode to exception
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  // Prepare statement
  $stmt = $conn->prepare("SELECT ID, Name, Age, Salary FROM Employees");

  // Execute the prepared statement
  $stmt->execute();

  // set the resulting array to associative
  $result = $stmt->setFetchMode(PDO::FETCH_ASSOC);

  echo "<h2 style='text-align:center;'>Employees</h2>";
  echo "<div style='display: flex; justify-content: center;'>";

  if($stmt->rowCount() > 0) {
    echo "<table><tr><th>ID</th><th>Name</th><th>Age</th><th>Salary</th></tr>";
    // output data of each row
    foreach($stmt->fetchAll() as $row) {
      echo "<tr><td>".$row["ID"]."</td><td>".$row["Name"]."</td><td>".$row["Age"]."</td><td>".$row["Salary"]."</td></tr>";
    }
    echo "</table>";
  } else {
    echo "0 results";
  }

  echo "</div>";
} catch(PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
}

$conn = null;
?>
</body>
</html>