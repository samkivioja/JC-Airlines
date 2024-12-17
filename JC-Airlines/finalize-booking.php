<?php 
session_start();

if (($_SERVER["REQUEST_METHOD"] === "POST") && isset($_SESSION['flightId'], $_SESSION['ticketCount'], $_SESSION['date'])) {
    require_once "./scripts/db_connection.php";

    $flightId = $_SESSION['flightId'];
    $ticketCount = $_SESSION['ticketCount'];
    $date = $_SESSION['date'];
    
    // Get the selected flight from the database
    $sql = "SELECT * FROM lennot WHERE LentoID = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $flightId);
    $stmt->execute();
    $result = $stmt->get_result();
    
    

    if ($result) {
        $flight = $result -> fetch_assoc();

        $error = "Valitettavasti lennolla ei ole tarpeeksi vapaita paikkoja.\n"
                    . "Vapaat paikat lennolla: " . $flight['VapaatPaikat']
                    . "\nValitsemasi lippujen määrä: " . $ticketCount;

        if ($ticketCount <= $flight['VapaatPaikat']) {

            try {
                // Begin transaction to ensure data integrity
                $conn -> begin_transaction();

                // Update available seats for flight
                $newSeatCount = $flight['VapaatPaikat'] - $ticketCount;
                $sql_updateSeats = "UPDATE lennot SET VapaatPaikat = ? WHERE lentoID = ?";
                $stmt = $conn -> prepare($sql_updateSeats);
                $stmt -> bind_param("ii", $newSeatCount, $flightId);
                $stmt -> execute();
                /*  
                    Data types for parameters in bind_param():
                        i - integer
                        s - string
                */

                // Prepare query for storing passenger ticket information
                $sql_addPassenger = "INSERT INTO Matkustajat (LähtöPäivä, LentoID, Etunimi, Sukunimi, Email, Osoite, Puhelin) VALUES (?, ?, ?, ?, ?, ?, ?)";    
                $stmt = $conn -> prepare($sql_addPassenger);
                $stmt -> bind_param("sisssss", $date, $flightId, $etunimi, $sukunimi, $email_hashed, $osoite, $puhelin);
                
                // Email related parameters
                /*
                $subject = "Lentolippu";
                $headers = "From: no-reply@jcairlines.com";*/

                // Store ticket information for each passenger
                for ($i = 1; $i <= $ticketCount; $i++) {
                    // Retrieve passenger data from the form
                    $etunimi = $conn -> real_escape_string($_POST["nimi-$i"]);
                    $sukunimi = $conn -> real_escape_string($_POST["sukunimi-$i"]);
                    $email = filter_var(trim($_POST["email-$i"]), FILTER_VALIDATE_EMAIL); // Validate email format
                    $osoite = $conn -> real_escape_string($_POST["osoite-$i"]);
                    $puhelin = $conn -> real_escape_string($_POST["puhelin-$i"]);

                    // Check if the email is valid
                    if (!$email) {
                        throw new Exception("Invalid email address for passenger $i.");
                    }
                    // Hash email address
                    $email_hashed = password_hash($email, PASSWORD_BCRYPT);
                    // Excecute query
                    $stmt -> execute();

                    // Send email with ticket information
                    /*
                    $message = "
                    <html>
                    <head>
                    <title>Lentolippu</title>
                    </head>
                    <body>
                    <h2>Lennon tiedot</h2>
                    <p><strong>Lähtöpaikka: </strong>{$flight['LähtöKaupunki']} - {$flight['LähtöMaa']}</p>
                    <p><strong>Kohde: </strong>{$flight['KohdeKaupunki']} - {$flight['KohdeMaa']}</p>
                    <p><strong>Matkustaja: </strong>{$etunimi} {$sukunimi}</p>
                    <p><strong>Lähtöpäivä: </strong>{$date}</p>
                    <p><strong>Lähtöaika: </strong>{$flight['Aika']}</p>
                    <p><strong>Kone: </strong>{$flight['Kone']}</p>
                    </body>
                    </html>      
                    ";

                    mail($email, $subject, $message, $headers);*/
                }

                // Commit the transaction
                $conn -> commit();
                
            } catch (Exception $e) {
                // If transaction wasn't successful rollback changes
                $conn -> rollback();
                $error = "Transaction failed: ". $e->getMessage();
            }
        } else {
            $error = "Valitettavasti lennolla ei ole tarpeeksi vapaita paikkoja.\n"
                    . "Vapaat paikat lennolla: " . $flight['VapaatPaikat']
                    . "\nValitsemasi lippujen määrä: " . $ticketCount;
        }

    } else {
        $error = "Lentoa ei löytynyt.";
    }


} else {
    // Redirect to main page and end session
    session_destroy();
    header("Location: index.php");
    exit();
}

// Close db connection
$conn -> close();
$stmt -> close();
// End session
session_destroy();


require_once './includes/header.php';
?>
        <main class="container">

            <?php if (isset($error)): ?>
                <p class="error"><?= nl2br(htmlspecialchars($error)) ?></p>
            <?php else: ?>
                <p class="success">Tilaus onnistui!</p>
                <p class="mail">Liput lähetetään email osoitteisiin.</p>
            <?php endif; ?>

        </main>

<?php require_once './includes/footer.php'; ?>

        
