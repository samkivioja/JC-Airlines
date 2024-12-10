<form class="flight-form"  action="passenger-info.php" method="post">
    
    <div class="form-group">
        <div class="location-group">
            <div class="form-section">
                <label for="lähtöpaikka">Lähtöpaikka</label>
                <select id="lähtöpaikka" name="lähtöpaikka" required>
                    <option value="" disabled selected hidden>Valitse lähtöpaikka</option>
                </select>
            </div>

            <button type="button" class="swap" onclick="swapLocations()">
                <img src="images/Swap.png" alt="Swap">
            </button>

            <div class="form-section">
                <label for="kohde">Kohde</label>
                <select id="kohde" name="kohde" required>
                    <option value="" disabled selected hidden>Valitse kohde</option>
                </select>
            </div>
        </div>
        
        <div class="form-section">
            <label for="päivä">Lähtöpäivä</label>
            <input id="päivä" name="päivä" type="date" required onclick="showPicker()">
        </div>
    </div>

    <div class="form-section flight-options"></div>

    <div class="hidden-section" >
        <div class="form-section number-input">
            <label for="määrä">Lippujen määrä:</label>
            <input id="määrä" name="määrä" type="number" min="1" step="1" required>
        </div>
        <div class="button-group">
            <input type="submit" value="Jatka">
        </div>
    </div>
</form>