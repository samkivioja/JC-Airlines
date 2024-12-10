<?php
header("Content-Type: application/json");
require_once "db_connection.php";

$lähtöKaupungit = [];
$kohdeKaupungit = [];

$sql = "SELECT DISTINCT LähtöKaupunki, KohdeKaupunki FROM lennot";
$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $lähtöKaupungit[] = $row['LähtöKaupunki'];
        $kohdeKaupungit[] = $row['KohdeKaupunki'];
    }
}

// Remove duplicates to ensure unique entries and sort alphabetically
$lähtöKaupungit = array_unique($lähtöKaupungit);
$kohdeKaupungit = array_unique($kohdeKaupungit);

// Close db connection
$conn->close();

// Return cities as JSON sorted alphabetically
echo json_encode([
    "lähtöKaupungit" => array_values($lähtöKaupungit),
    "kohdeKaupungit" => array_values($kohdeKaupungit)
]);
?>
