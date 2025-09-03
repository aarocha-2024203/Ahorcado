const palabras = ["HUMBERTO", "PAPAGAYO", "JAVASCRIPT", "PROGRAMAR", "AHORCADO"];
let palabra = "";
let palabraOculta = [];
let intentos = 0;
const maxIntentos = 6;

function iniciarJuego() {
  palabra = palabras[Math.floor(Math.random() * palabras.length)];
  palabraOculta = Array(palabra.length).fill("_");
  intentos = 0;
  document.getElementById("gallows").src = "Images/intento0.png";
  document.getElementById("word").textContent = palabraOculta.join(" ");
  document.getElementById("message").textContent = "";

  // activar eventos de teclado
  document.querySelectorAll(".key").forEach(btn => {
    btn.disabled = false;
    btn.style.background = "#007BFF";
    btn.onclick = () => manejarLetra(btn.textContent, btn);
  });
}

function manejarLetra(letra, btn) {
  btn.disabled = true;
  if (palabra.includes(letra)) {
    for (let i = 0; i < palabra.length; i++) {
      if (palabra[i] === letra) {
        palabraOculta[i] = letra;
      }
    }
    document.getElementById("word").textContent = palabraOculta.join(" ");
    if (!palabraOculta.includes("_")) {
      document.getElementById("message").textContent = "¡Ganaste! 🎉";
      deshabilitarTeclado();
    }
  } else {
    intentos++;
    document.getElementById("gallows").src = "Images/intento" + intentos + ".png";
    if (intentos >= maxIntentos) {
      document.getElementById("message").textContent = "Perdiste 😢. La palabra era: " + palabra;
      deshabilitarTeclado();
    }
  }
}

function deshabilitarTeclado() {
  document.querySelectorAll(".key").forEach(btn => btn.disabled = true);
}

document.getElementById("restart").addEventListener("click", iniciarJuego);

iniciarJuego();
