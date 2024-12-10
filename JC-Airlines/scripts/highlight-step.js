// Function to highlight the current step
function highlightStep(stepIndex) {
    const steps = document.querySelectorAll('.booking-steps p');
    steps.forEach(step => step.classList.remove('highlighted'));
    // Check if the element exists
    if (steps[stepIndex]) {
        steps[stepIndex].classList.add('highlighted'); // Highlight the step
    }
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
