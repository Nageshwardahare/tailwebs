document.addEventListener("DOMContentLoaded", function() {
  // Select the alert and notice elements
  const alert = document.querySelector('.alert');
  const notice = document.querySelector('.notice');

  // Function to smoothly fade out an element
  function fadeOutEffect(element, duration) {
    let fadeTarget = element;
    let fadeEffect = setInterval(function() {
      if (!fadeTarget.style.opacity) {
        fadeTarget.style.opacity = 1;
      }
      fadeTarget.style.opacity -= 0.02; // Smoother fade by reducing opacity in smaller steps
      if (fadeTarget.style.opacity <= 0) {
        clearInterval(fadeEffect);
        fadeTarget.style.display = "none"; // Optionally hide it completely
      }
    }, duration / 50); // Smooth over 'duration' milliseconds
  }

  // If alert or notice exists, fade them out smoothly after 3 seconds
  if (alert) {
    setTimeout(function() {
      fadeOutEffect(alert, 1000); // 1000 ms fade duration
    }, 3000); // Wait for 3 seconds before fading
  }

  if (notice) {
    setTimeout(function() {
      fadeOutEffect(notice, 1000); // 1000 ms fade duration
    }, 3000); // Wait for 3 seconds before fading
  }

});

document.getElementById('togglePassword').addEventListener('mousedown', function (event) {
  event.preventDefault();

  const passwordInput = document.getElementById('password');
  const passwordType = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
  passwordInput.setAttribute('type', passwordType);

  // Toggle the eye icon
  this.classList.toggle('fa-eye-slash');
});

