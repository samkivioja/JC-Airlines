<?php
header("Content-Type: application/json");

$data = json_decode(file_get_contents("php://input"), true);

require_once "db_connection.php";

// Validate the input
if (!isset($data['kohde']) || !isset($data['lähtöpaikka']) ) {
    echo json_encode(["error" => "Invalid input"]);
    exit;
}

$lähtöpaikka = $conn->real_escape_string($data['lähtöpaikka']);
$kohde = $conn->real_escape_string($data['kohde']);

$sql = "SELECT * 
        FROM lennot 
        WHERE LähtöKaupunki = '$lähtöpaikka'
        AND KohdeKaupunki = '$kohde'
        AND VapaatPaikat != 0;
        ";

$result = $conn -> query($sql);

$flights = [];

if ($result && $result -> num_rows > 0) {
    while($row = $result -> fetch_assoc()) {
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
}

// Close db connection
$conn -> close();

// Return flights in JSON
echo json_encode($flights);
?>