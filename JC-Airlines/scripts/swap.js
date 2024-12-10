function swapLocations() {
    const lähtöpaikka = document.getElementById('lähtöpaikka');
    const kohde = document.getElementById('kohde');

    const temp = lähtöpaikka.value;
    
    lähtöpaikka.value = kohde.value;
    kohde.value = temp;

    lähtöpaikka.dispatchEvent(new Event('change'));
    kohde.dispatchEvent(new Event('change'));
}