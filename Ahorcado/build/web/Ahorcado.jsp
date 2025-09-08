<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Conexion.ConexionBD"%>
<%
    // --- CONSULTAR PALABRAS DE LA BD ---
    Connection conn = ConexionBD.getConnection();
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT palabra FROM Palabras");

    StringBuilder palabrasJS = new StringBuilder("[");
    while (rs.next()) {
        palabrasJS.append("\"").append(rs.getString("palabra").toUpperCase().trim()).append("\",");
    }
    if (palabrasJS.length() > 1) {
        palabrasJS.setLength(palabrasJS.length() - 1); // quitar última coma
    }
    palabrasJS.append("]");
    rs.close();
    stmt.close();
    conn.close();
%>
<!DOCTYPE html>

<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Juego del Ahorcado</title>
  <link rel="stylesheet" href="Styles/ahorcado.css">
</head>
<body>
  <div class="sidebar">
    <!-- Botones en vertical -->
    <button id="start">Iniciar</button>
    <button id="pause">Pausar</button>
    <button id="restart">Reiniciar</button>
    <button id="showHint">Mostrar pista</button>
  </div>

  <div class="container">
    <h1>Juego del Ahorcado</h1>
    <img id="gallows" src="Images/intento0.png" alt="Ahorcado">

    <!-- Palabra oculta -->
    <div id="word"></div>

    <!-- Pistas -->
    <div id="hint"></div>

    <!-- Teclado -->
    <div id="keyboard">
      <div class="key-row">
        <button class="key">Q</button><button class="key">W</button><button class="key">E</button>
        <button class="key">R</button><button class="key">T</button><button class="key">Y</button>
        <button class="key">U</button><button class="key">I</button><button class="key">O</button><button class="key">P</button>
      </div>
      <div class="key-row">
        <button class="key">A</button><button class="key">S</button><button class="key">D</button>
        <button class="key">F</button><button class="key">G</button><button class="key">H</button>
        <button class="key">J</button><button class="key">K</button><button class="key">L</button><button class="key">Ñ</button>
      </div>
      <div class="key-row">
        <button class="key">Z</button><button class="key">X</button><button class="key">C</button>
        <button class="key">V</button><button class="key">B</button><button class="key">N</button><button class="key">M</button>
      </div>
    </div>

    <!-- Mensaje -->
    <div id="message"></div>

    <!-- Temporizador -->
    <div id="timer">Tiempo: 60s</div>
  </div>

  <script src="./js/ahorcado.js"></script>
</body>
</html>
