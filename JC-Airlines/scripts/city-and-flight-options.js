document.addEventListener("DOMContentLoaded", () => {
    const lähtöpaikkaSelect = document.getElementById("lähtöpaikka");
    const kohdeSelect = document.getElementById("kohde");
    const päiväInput = document.getElementById("päivä");
    const flightOptionsDiv = document.querySelector(".flight-options");
    const hiddenSection = document.querySelector(".hidden-section");


    // Try to get cities and generate lähtöpaikka and kohde options
    const fetchCities = () => {
        fetch("./scripts/get-cities.php")
        .then(response => response.json())
        .then(data => {
            const { lähtöKaupungit, kohdeKaupungit } = data;

            // Populate lähtöpaikka select box
            lähtöKaupungit.sort().forEach(city => {
                const option = document.createElement("option");
                option.value = city;
                option.textContent = city;
                lähtöpaikkaSelect.appendChild(option);
            });

            // Populate kohde select box
            kohdeKaupungit.sort().forEach(city => {
                const option = document.createElement("option");
                option.value = city;
                option.textContent = city;
                kohdeSelect.appendChild(option);
            });
        })
        .catch(error => {
            console.error("Error fetching cities:", error);
        });
    };

    
    // Try to get flights and generate flight cards
    const fetchFlights = () => {
        if (!(lähtöpaikkaSelect.value && kohdeSelect.value && päiväInput.value)) return;

        const päivä = päiväInput.value;

        var q = new Date();
        var today = new Date(q.getFullYear(),q.getMonth(),q.getDate());

        // Check if selected date is from the past
        if (today > new Date(päivä)) {
            flightOptionsDiv.innerHTML = `<p class="error">Valitse sopiva päivämäärä.</p>`;
            hiddenSection.style.display = "none";
            return;
        }
        
        const lähtöpaikka = lähtöpaikkaSelect.value;
        const kohde = kohdeSelect.value;
        
        fetch("./scripts/get-flights.php", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({ lähtöpaikka, kohde, päivä }),
        })
        .then((response) => response.json())
        .then((flights) => {
            flightOptionsDiv.innerHTML = ""; // Clear existing flight options
            // Hide numberInput and submitButton
            hiddenSection.style.display = "none";


            if (flights.length > 0) {
                flights.forEach((flight) => {
                    const flightCard = document.createElement("div");
                    flightCard.className = "flight-card";

                    // Convert date format from YYYY-MM-DD to DD/MM/YYYY
                    const lähtöpäivä = päivä.split("-").reverse().join("/");

                    // Create flight option
                    flightCard.innerHTML = `
                        <input type="radio" id="flight-${flight.id}" name="flight" value="${flight.id}" vapaat-paikat="${flight.vapaatPaikat}" required>
                        <label for="flight-${flight.id}">
                            <div class="group locations"> 
                                <strong>${flight.aika}</strong> 
                                <div class="location" style="margin-top: 0.3rem">
                                    <img src="images/Airplane Take Off.png" alt="Departure Icon" class="icon">
                                    <p>${flight.lähtöKaupunki} - ${flight.lähtöMaa}</p>
                                </div>
                                <div class="location">
                                    <img src="images/Airplane Landing.png" alt="Destination Icon" class="icon">
                                    <p>${flight.kohdeKaupunki} - ${flight.kohdeMaa}</p>
                                </div>
                            </div>
                            <div class="group" style="text-align: center">
                                <p> <b>Kone:</b> ${flight.kone}</p>
                                <p> <b>Vapainta paikkoja:</b> ${flight.vapaatPaikat}</p>
                            </div>
                            <div class="group last-part" style="text-align: end">
                                <p>${lähtöpäivä}</p>
                                <strong>${flight.hinta} €</strong>
                            </div>
                        </label>
                    `;

                    flightOptionsDiv.appendChild(flightCard);
                });

                // Scroll to the top of the flight options
                flightOptionsDiv.scrollTop = 0;

                // Add event listener to flight radio buttons
                const flightRadios = document.querySelectorAll('input[name="flight"]');
                flightRadios.forEach((radio) => {
                    radio.addEventListener("change", () => {
                        if (radio.checked) {
                            var vapaatPaikat = parseInt(radio.getAttribute("vapaat-paikat"));
                            const numberInput = document.getElementById("määrä");
                            
                            if (numberInput.value > vapaatPaikat) {
                                numberInput.value = vapaatPaika;
                            };
                            numberInput.max = vapaatPaikat;

                            // Show numberInput and submitButton
                            hiddenSection.style.display = "flex";
                            
                        }
                    });
                });

            } else {
                flightOptionsDiv.innerHTML = `<p class="error">Vastaavia lentoja ei löytynyt.</p>`;
                hiddenSection.style.display = "none";
            }
        })
        .catch((error) => {
            console.error("Error fetching flights:", error);
        });
    };


    // Fetch cities for lähtöpaikka and kohde select options
    fetchCities();

    // Eventlisteners for generating flights
    lähtöpaikkaSelect.addEventListener("change", fetchFlights);
    kohdeSelect.addEventListener("change", fetchFlights);
    päiväInput.addEventListener("change", fetchFlights);
});
