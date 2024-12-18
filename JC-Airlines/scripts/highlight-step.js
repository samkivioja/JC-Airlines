// Function to highlight the current step
function highlightStep(currentStep) {
    const steps = document.querySelectorAll('.booking-steps a');
    steps.forEach(step => {
        const stepIndex = parseInt(step.getAttribute('data-step'));

        step.classList.remove('highlighted');

        if (stepIndex === currentStep) {
            step.querySelector('p').classList.add('highlighted'); // Highlight current step
        }

        if (stepIndex >= currentStep) {
            step.style.pointerEvents = 'none'; // Disable clicking
        } else {
            step.style.pointerEvents = 'auto'; // Enable clicking
        }
    });
}

// Check the current page and highlight the correct step
window.addEventListener('DOMContentLoaded', function () {
    const path = window.location.pathname;

    if (path.includes('index.php')) {
        highlightStep(0);
    } else if (path.includes('passenger-info.php')) {
        highlightStep(1);
    } else if (path.includes('finalize-booking.php')) {
        highlightStep(2);
    }
});
