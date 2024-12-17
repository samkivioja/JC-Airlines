<?php
header("Content-Type: application/json");

$data = json_decode(file_get_contents("php://input"), true);

require_once "db_connection.php";

// Validate the input
if (!isset($data['kohde']) || !isset($data['lähtöpaikka'])) {
    echo json_encode(["error" => "Invalid input"]);
    exit;
}

$lähtöpaikka = $data['lähtöpaikka'];
$kohde = $data['kohde'];

try {
    // Prepare the SQL statement
    $stmt = $conn->prepare("SELECT * 
                            FROM lennot 
                            WHERE LähtöKaupunki = ? 
                            AND KohdeKaupunki = ? 
                            AND VapaatPaikat != 0");
    
    // Bind parameters
    $stmt->bind_param("ss", $lähtöpaikka, $kohde);
    // Execute the statement
    $stmt->execute();
    $result = $stmt->get_result();

    $flights = [];

    // Fetch the data
    while ($row = $result->fetch_assoc()) {
        $flights[] = [
            "id" => $row["LentoID"],
            "lähtöMaa" => $row["LähtöMaa"],
            "lähtöKaupunki" => $row["LähtöKaupunki"],
            "kohdeMaa" => $row["KohdeMaa"],
            "kohdeKaupunki" => $row["KohdeKaupunki"],
            "aika" => $row["Aika"],
            "kone" => $row["Kone"],
            "hinta" => number_format($row["LipunHinta"], 2, ',' , ' '),
            "vapaatPaikat" => $row["VapaatPaikat"]
        ];
    }

    // Close the statement
    $stmt->close();

} catch (Exception $e) {
    echo json_encode(["error" => "Database query failed"]);
    exit;
}

// Close the database connection
$conn->close();

// Return flights in JSON
echo json_encode($flights);
?>
