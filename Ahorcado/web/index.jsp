<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Ahorcado</title>
    <link rel="stylesheet" type="text/css" href="Styles/style.css">
</head>

<body>
    <div class="wrapper">
        <div class="form-wrapper sign-in">
            <form action="index.html">
                <h2>Login</h2>
                <div class="input-group">
                    <input type="text" required>
                    <label for="">Nombre</label>
                </div>
                <div class="input-group">
                    <input type="password" required>
                    <label for="">Contraseña</label>
                </div>
                <div class="remember">
                    <label><input type="checkbox"> Recuérdame</label>
                </div>
                <button type="submit">Login</button>
                <div class="signUp-link">
                    <p>¿No tienes cuenta? <a href="#" class="signUpBtn-link">Registrarse</a></p>
                </div>
            </form>
        </div>
        <div class="form-wrapper sign-up">
            <form action="#">
                <h2>Registrarse</h2>
                <div class="input-group">
                    <input type="text" required>
                    <label for="">Nombre</label>
                </div>
                <div class="input-group">
                    <input type="email" required>
                    <label for="">Correo</label>
                </div>
                <div class="input-group">
                    <input type="password" required>
                    <label for="">Contraseña</label>
                </div>
                <div class="remember">
                    <label><input type="checkbox"> Acepto los términos y condiciones</label>
                </div>
                <button type="submit">Registrarse</button>
                <div class="signUp-link">
                    <p>¿Ya tienes una cuenta? <a href="#" class="signInBtn-link">Iniciar sesión</a></p>
                </div>
            </form>
        </div>
    </div>

    
    <script>
    const signUpBtnLink = document.querySelector('.signUpBtn-link');
    const signInBtnLink = document.querySelector('.signInBtn-link');
    const wrapper = document.querySelector('.wrapper');

    signUpBtnLink.addEventListener('click', (e) => {
        e.preventDefault();
        wrapper.classList.add('active');
    });

    signInBtnLink.addEventListener('click', (e) => {
        e.preventDefault();
        wrapper.classList.remove('active');
    });

    // Registro
    const registerForm = document.querySelector('.sign-up form');
    registerForm.addEventListener('submit', function (e) {
        e.preventDefault();
        const name = registerForm.querySelector('input[type="text"]').value;
        const email = registerForm.querySelector('input[type="email"]').value;
        const password = registerForm.querySelector('input[type="password"]').value;

        let users = JSON.parse(localStorage.getItem('users')) || [];

        // Verifica si el usuario ya existe
        const exists = users.some(user => user.name === name);
        if (exists) {
            alert('El usuario ya existe.');
            return;
        }

        users.push({ name, email, password });
        localStorage.setItem('users', JSON.stringify(users));
        alert('¡Registro exitoso! Ahora puedes iniciar sesión.');
        wrapper.classList.remove('active');
    });

    // Login
    const loginForm = document.querySelector('.sign-in form');
    loginForm.addEventListener('submit', function (e) {
        e.preventDefault();
        const name = loginForm.querySelector('input[type="text"]').value;
        const password = loginForm.querySelector('input[type="password"]').value;

        const users = JSON.parse(localStorage.getItem('users')) || [];

        const validUser = users.find(user => user.name === name && user.password === password);

        if (validUser) {
            alert(`Bienvenido, ${name}!`);
            window.location.href = 'Ahorcado.jsp'; // Redirecciona si es correcto
        } else {
            alert('Usuario o contraseña incorrectos.');
        }
    });
</script>

</body>

</html>