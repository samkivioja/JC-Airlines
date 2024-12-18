<?php 
session_start();

// Get selected flight's data from database
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    require_once "./scripts/db_connection.php";

    // Check for required POST data
    $flightId = $_POST['flight'] ?? null;
    $ticketCount = $_POST['määrä'] ?? null;
    $date = $_POST['päivä'] ?? null;

    // Validate inputs
    if ($flightId && $ticketCount && $date) {
        try {
            // Prepare the SQL statement
            $stmt = $conn->prepare("SELECT * FROM lennot WHERE LentoID = ?");
            $stmt->bind_param("i", $flightId);
            
            // Execute the statement
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result && $result->num_rows > 0) {
                $flight = $result->fetch_assoc(); // Fetch flight details

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

            $stmt->close();
        } catch (Exception $e) {
            $error = "Tietokantavirhe: " . $e->getMessage();
        }
    } else {
        $error = "Virheelliset lomaketiedot.";
    }

    // Close database connection
    $conn->close();

}

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
            <?php 
            else: 
                // Redirect to main page and end session
                session_destroy();
                header("Location: index.php");
                exit();
            
            endif; ?>
        </main>

<?php require_once './includes/footer.php'; ?>
