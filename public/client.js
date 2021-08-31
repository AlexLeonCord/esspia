// Establish a Socket.io connection
const socket = io();
// Initialize our Feathers client application through Socket.io
// with hooks and authentication.
const client = feathers();

client.configure(feathers.socketio(socket));
// Use localStorage to store our login token
client.configure(feathers.authentication());

// Login screen
 
 
const loginHTML = `
 
<main class="login container  ">

  <div class="row">
    <div class="col-12 col-6-tablet push-3-tablet text-center heading">
      <h1 class="">INICIAR SESION</h1>
    </div>
  </div>
  <div class="row">
    <div class="col-12 col-6-tablet push-3-tablet col-4-desktop push-4-desktop">

    
      <form class="form">
        <fieldset>
          <input class="block" type="email" name="email" placeholder="Email">
        </fieldset>

        <fieldset>
          <input class="block" type="password" name="password" placeholder="Contraseña">
        </fieldset>

        <button type="button" id="login" class="background button button-primary block signup">
          Entrar
        </button>

  
        </a>
      </form>
      </div> 
    </div>
  
</main>
 
`;

// Chat base HTML (without user list and messages)
const chatHTML = ` <main class="flex flex-column">


<div style="position: fixed;  position: fixed; bottom: 0; right: 0;"> 
  <a href="#" id="logout" class="background button button-primary" >
        Cerrar Sesion
  </a>
      
</div>     


<!-- <div class="" style="width:500px; margin-left: auto ; margin-right:auto"> -->
<div class="" style= margin-left: auto ; margin-right:auto">
 
 </br>

<form id="crearIngeniero">

<h1>Crear Usuario (Ingeniero)</h1>
 
 
<fieldset>
  <label for="cedula">Número de Identificación:</label>
  <input type="number" id="cedula" name="cedula" required>

  <label for="nombre">Nombre:</label>
  <input type="text" id="nombre" name="nombre" required>

  <label for="email">Email:</label>
  <input type="email" id="email" name="email" required>

  <label for="password">Contraseña:</label>
  <input type="password" id="password" name="password" required>

  <label for="numeroContacto">Número de Contacto:</label>
  <input type="number" id="numeroContacto" name="telefono" required>

</fieldset>

 
<button type="submit" class=" button-save">Guardar</button>
</form>
</br>
</br>
</br>

</div>

<!-- <div class="" style="width:500px; margin-left: auto ; margin-right:auto"> -->
<div class="" style= margin-left: auto ; margin-right:auto">
 
 

<form id="crearCliente">

<h1>Crear Cliente</h1>
 
<label for="identificacion">Tipo de Identificación:</label>
<select id="tipoIdentificacion" name="tipoIdentificacion" required>
    <option value="cedula">Cédula </option>
    <option value="nit">NIT</option>
  </optgroup>
  
</select>
<fieldset>
  <label for="numeroIdentificacion">Número de Identificación:</label>
  <input type="number" id="numeroIdentificacion" name="numeroIdentificacion" required>

  <label for="compania">Compañia:</label>
  <input type="text" id="compania" name="compania" required>

  <label for="representante">Representante Legal:</label>
  <input type="text" id="representante" name="representante" required>

  <label for="numeroRepresentante">Identificación de Representante:</label>
  <input type="number" id="numeroRepresentante" name="numeroRepresentante" required>

  
  <label for="mail">Email:</label>
  <input type="email" id="mail" name="email" required>
  
  <label for="telefono">Teléfono fijo:</label>
  <input type="number" id="telefono" name="telefono" required>

  <label for="direccion">Dirección:</label>
  <input type="text" id="direccion" name="direccion" required>
  
  
</fieldset>


<button type="submit" class=" button-save">Guardar</button>
</form>

</div>
</br></br></br>

</main>`;

// Helper to safely escape HTML
const escape = str => str.replace(/&/g, '&amp;')
    .replace(/</g, '&lt;').replace(/>/g, '&gt;')

 
 

// Show the login page
const showLogin = (error) => {
  if(document.querySelectorAll('.login').length && error) {
    alert("Error al iniciar Sesión. Intenta de nuevo")
    console.error( "Hubo un Error" +error.message );
  } else {
    document.getElementById('app').innerHTML = loginHTML;
  }
};

// Shows the chat page
const showChat = async () => {
  document.getElementById('app').innerHTML = chatHTML;

  // Find the latest 25 messages. They will come with the newest first
  const messages = await client.service('messages').find({
    query: {
      $sort: { createdAt: -1 },
      $limit: 25
    }
  });
  
}
 

// Retrieve email/password object from the login/signup page
const getCredentials = () => {
  const user = {
    email: document.querySelector('[name="email"]').value,
    password: document.querySelector('[name="password"]').value
  };

  return user;
};

// Log in either using the given email/password or the token from storage
const login = async credentials => {
  try {
    if(!credentials) {
      // Try to authenticate using an existing token
      await client.reAuthenticate();
    } else {
      // Otherwise log in with the `local` strategy using the credentials we got
      await client.authenticate({
        strategy: 'local',
        ...credentials
      });
    }

    // If successful, show the chat page
      showChat();
  } catch(error) {
    // If we got an error, show the login page
    showLogin(error);
  }
};

const addEventListener = (selector, event, handler) => {
  document.addEventListener(event, async ev => {
    if (ev.target.closest(selector)) {
      handler(ev);
    }
  });
};

// "Signup and login" button click handler
addEventListener('#signup', 'click', async () => {
  // For signup, create a new user and then log them in
  const credentials = getCredentials();
    
  // First create the user
  await client.service('users').create(credentials);
  // If successful log them in
  await login(credentials);
});

// "Login" button click handler
addEventListener('#login', 'click', async () => {
  const user = getCredentials();

  await login(user);
});

// "Logout" button click handler
addEventListener('#logout', 'click', async () => {
  await client.logout();
    
  document.getElementById('app').innerHTML = loginHTML;
});

 


 /////////////////////      ///////////////////                 /////////////////////////////////

// "/cliente" envia datos   handler
addEventListener('#crearCliente', 'submit', async ev => {
  // This is the message text input field
  const tipoId = document.querySelector('[name="tipoIdentificacion"]');
  const id = document.querySelector('[name="numeroIdentificacion"]');
  const compania = document.querySelector('[name="compania"]');
  const representante = document.querySelector('[name="representante"]');
  const idRepresentante = document.querySelector('[name="numeroRepresentante"]');
  const email = document.querySelector('[name="email"]');
  const telefono = document.querySelector('[name="telefono"]');
  const direccion = document.querySelector('[name="direccion"]');

  ev.preventDefault();

  // Create a new message and then clear the input field
  await client.service('cliente').create({
    id:id.value, 
    tipoId: tipoId.value,
    compania:compania.value,
    representante:representante.value,
    idRepresentante:idRepresentante.value,
    email:email.value,
    telefono:telefono.value,
    direccion:direccion.value,
     
  });

  id.value ="", 
  tipoId.value ="",
  compania.value ="",
  representante.value ="",
  idRepresentante.value ="",
  email.value ="",
  telefono.value ="",
  direccion.value =""
});



const  ConfirmacionCliente= mensaje=>{

  alert("CLIENTE AGREGADO CORRECTAMENTE!")
}
// We will also see when new users get created in real-time
client.service('cliente').on('created', ConfirmacionCliente);


///////////////////////      /////////////////////          //////////////////////


// "/igeniero" envia datos   handler

addEventListener('#crearIngeniero', 'submit', async ev => {
  // This is the message text input field
  const  cedula = document.querySelector('[name="cedula"]');
  const  nombre = document.querySelector('[name="nombre"]');
  const  email = document.querySelector('[name="email"]');
  const  password = document.querySelector('[name="password"]');
  const  telefono = document.querySelector('[name="telefono"]');
 

  ev.preventDefault();

  // Create a new message and then clear the input field
  await client.service('users').create({
    cedula:cedula.value, 
    name: nombre.value,
    email:email.value,
    password:password.value,
    phone:telefono.value,
    
     
  });

  cedula.value="", 
  nombre.value="",
  email.value="",
  password.value="",
  telefono.value=""
});

const  ConfirmacionIngeniero= ()=>{

  alert("INGENIERO AGREGADO CORRECTAMENTE!")
}
// We will also see when new users get created in real-time
client.service('users').on('created', ConfirmacionIngeniero);

 

 

// Call login right away so we can show the chat window
// If the user can already be authenticated
login();
