let palabra = "";
let palabraOculta = [];
let intentos = 0;
const maxIntentos = 6;

let tiempo = 60;
let temporizador = null;
let pausado = false;
let iniciado = false;

// contador de pistas
let pistaIndex = 0;

function iniciarJuego() {
    // escoger palabra aleatoria y limpiar espacios
    palabra = palabras[Math.floor(Math.random() * palabras.length)].trim().toUpperCase();
    palabraOculta = Array(palabra.length).fill("_");
    intentos = 0;
    tiempo = 60;
    clearInterval(temporizador);
    iniciado = true;
    pausado = false;
    pistaIndex = 0;

    // actualizar interfaz
    document.getElementById("gallows").src = "Images/intento0.png";
    document.getElementById("word").textContent = palabraOculta.join(" ");
    document.getElementById("message").textContent = "";
    document.getElementById("hint").textContent = "";
    document.getElementById("timer").textContent = "Tiempo: 60s";
    document.getElementById("pause").textContent = "Pausar";

    // habilitar teclado
    document.querySelectorAll(".key").forEach(btn => {
        btn.disabled = false;
        btn.style.background = "#007BFF";
        btn.onclick = () => manejarLetra(btn.textContent, btn);
    });

    // iniciar temporizador automáticamente si quieres
    if (!temporizador) {
        temporizador = setInterval(() => {
            if (!pausado) {
                tiempo--;
                document.getElementById("timer").textContent = "Tiempo: " + tiempo + "s";
                if (tiempo <= 0) {
                    document.getElementById("message").textContent = "⏰ Se acabó el tiempo. La palabra era: " + palabra;
                    detenerJuego();
                }
            }
        }, 1000);
    }
}

function manejarLetra(letra, btn) {
    if (!iniciado || pausado) return;

    btn.disabled = true;
    if (palabra.includes(letra)) {
        for (let i = 0; i < palabra.length; i++) {
            if (palabra[i] === letra) palabraOculta[i] = letra;
        }
        document.getElementById("word").textContent = palabraOculta.join(" ");
        if (!palabraOculta.includes("_")) {
            document.getElementById("message").textContent = "¡Ganaste! 🎉";
            detenerJuego();
        }
    } else {
        intentos++;
        document.getElementById("gallows").src = "Images/intento" + intentos + ".png";
        if (intentos >= maxIntentos) {
            document.getElementById("message").textContent = "Perdiste 😢. La palabra era: " + palabra;
            detenerJuego();
        }
    }
}

function deshabilitarTeclado() {
    document.querySelectorAll(".key").forEach(btn => btn.disabled = true);
}

function habilitarTeclado() {
    document.querySelectorAll(".key").forEach(btn => {
        if (palabraOculta.includes("_") && intentos < maxIntentos) btn.disabled = false;
    });
}

function detenerJuego() {
    clearInterval(temporizador);
    temporizador = null;
    deshabilitarTeclado();
}

// --- BOTONES ---
document.getElementById("restart").addEventListener("click", iniciarJuego);

document.getElementById("start").addEventListener("click", () => {
    if (!temporizador) {
        pausado = false;
        habilitarTeclado();
        temporizador = setInterval(() => {
            if (!pausado) {
                tiempo--;
                document.getElementById("timer").textContent = "Tiempo: " + tiempo + "s";
                if (tiempo <= 0) {
                    document.getElementById("message").textContent = "⏰ Se acabó el tiempo. La palabra era: " + palabra;
                    detenerJuego();
                }
            }
        }, 1000);
    }
});

document.getElementById("pause").addEventListener("click", () => {
    if (!iniciado) return;

    pausado = !pausado;
    document.getElementById("pause").textContent = pausado ? "Reanudar" : "Pausar";
    pausado ? deshabilitarTeclado() : habilitarTeclado();
});

document.getElementById("showHint").addEventListener("click", () => {
    if (pistas[palabra] && pistaIndex < pistas[palabra].length) {
        document.getElementById("hint").innerHTML += `<p>${pistas[palabra][pistaIndex]}</p>`;
        pistaIndex++;
    } else {
        document.getElementById("hint").innerHTML += `<p>No hay más pistas disponibles.</p>`;
    }
});

// iniciar juego al cargar la página
window.onload = iniciarJuego;
