<?php 
session_start();

// Get selected flight's data from database
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    require_once "./scripts/db_connection.php";

    $flightId = $_POST['flight'];
    $ticketCount = $_POST['määrä'];
    $date = $_POST['päivä'];

    if ($flightId && $ticketCount && $date) {
        // Sanitize inputs
        $flightId = $conn -> real_escape_string($flightId);
        $ticketCount = $conn -> real_escape_string($ticketCount);
        $date = $conn -> real_escape_string($date);

        // Query the database for flight data
        $sql = "SELECT * FROM lennot WHERE LentoID = '$flightId'";
        $result = $conn -> query($sql);

        if ($result && $result -> num_rows > 0) {
            $flight = $result -> fetch_assoc(); // Fetch flight details

            // Check for seat availability
            if ($ticketCount <= $flight['VapaatPaikat']) {
                // Store data in session variables used in finalize-booking.php
                $_SESSION['flightId'] = $flightId;
                $_SESSION['ticketCount'] = $ticketCount;
                $_SESSION['date'] = $date;

            } else {
                $error = "Valitettavasti lennolla ei ole tarpeeksi vapaita paikkoja.";
            }

        } else {
            $error = "Lentoa ei löytynyt.";
        }
    } else {
        $error = "Virheelliset lomake tiedot.";
    }
}

// Close db connection
$conn -> close();

require_once './includes/header.php';
?>
        <main class="container">
            
            <?php if (isset($error)): ?>
                <p class="error"><?= htmlspecialchars($error) ?></p>
            <?php elseif ($flight): ?>
            <!-- Display the selected flight details -->
                <h3>Valintasi</h3>
                <div class="flight-details">
                    <div class="section">
                        <p><strong>Lähtöpaikka:</strong> <?= $flight['LähtöKaupunki'] . "- " . $flight['LähtöMaa'] ?></p>
                        <p><strong>Lähtöpäivä:</strong> <?= $date ?></p>
                        <p><strong>Lipun hinta:</strong> <?= number_format($flight['LipunHinta'], 2, ',' , ' ') ?> €</p>
                        <p><strong>Kone:</strong> <?= $flight['Kone'] ?></p>
                        
                    </div>
                    <div class="section">
                        <p><strong>Kohde:</strong> <?= $flight['KohdeKaupunki'] . "- " . $flight['KohdeMaa'] ?></p>
                        <p><strong>Aika:</strong> <?= $flight['Aika'] ?></p>
                        <p><strong>Lippujen määrä:</strong> <?= $ticketCount ?></p>
                        <p><strong>Yhteensä:</strong> <?= number_format($ticketCount * $flight['LipunHinta'], 2, ',' , ' ')?> €</p>
                    </div>
                </div>
            
            
            <h3>Syötä matkustaja tiedot</h3>
            <form class="passenger-form" action="finalize-booking.php" method="post">

                <div class="tickets">
                    <!-- Generate ticket form for each passenger -->
                    <?php for ($i = 1; $i <= $ticketCount; $i++): ?>
                    <div class="ticket" id="ticket-<?= $i ?>">
                        <h4>Matkustaja <?= $i ?></h4>
                        <div class="ticket-info">
                            <div class="group">
                                <div class="section">
                                    <label for="nimi-<?= $i ?>">Etunimi</label>
                                    <input id="nimi-<?= $i ?>" name="nimi-<?= $i ?>" type="text" required>
                                </div>
                                <div class="section">
                                    <label for="sukunimi-<?= $i ?>">Sukunimi</label>
                                    <input id="sukunimi-<?= $i ?>" name="sukunimi-<?= $i ?>" type="text" required>
                                </div>
                            </div>

                            <div class="group">
                                <div class="section">
                                    <label for="email-<?= $i ?>">Email</label>
                                    <input id="email-<?= $i ?>" name="email-<?= $i ?>" type="email" required>
                                </div>
                                
                                <div class="section">
                                    <label for="osoite-<?= $i ?>">Osoite</label>
                                    <input id="osoite-<?= $i ?>" name="osoite-<?= $i ?>" type="text" required>
                                </div>
                            </div>
                            <div class="group">
                                <div class="section">
                                    <label for="puhelin-<?= $i ?>">Puhelinnumero</label>
                                    <input id="puhelin-<?= $i ?>" name="puhelin-<?= $i ?>" type="tel" required>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php endfor; ?>
                </div>

                <div class="button-group">
                    <input type="submit" value="Tilaa">
                    <button type="button" class="cancel" onclick="window.history.back();">Peru</button>
                </div>
            </form>

            <?php endif; ?>
        </main>

<?php require_once './includes/footer.php'; ?>