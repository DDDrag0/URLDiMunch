<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
<style type="text/css">

.container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100vh;
  transition: transform 0.3s ease;
}

.row {
  display: flex;
  flex-direction: row;
  justify-content: center;
  margin-bottom: 10px;
}

.button {
  width: 100px;
  height: 100px;
  background-color: #ccc;
  margin: 5px;
  border-radius: 10px;
  transition: transform 0.3s ease;
}

.button:hover {
  transform: scale(1.1);
}

.container.move-left {
  transform: translateX(calc(-50% + 100px));
}

.modal {
  display: none;
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 400px;
  height: 200px;
  background-color: #fff;
  border-radius: 10px;
  padding: 20px;
  box-sizing: border-box;
}

.modal.active {
  display: block;
}

</style>
</head>
<body>
  <div class="container">
    <div class="row">
      <div class="button" onclick="toggleModal('modal1', this)">Inserisci prodotto</div>
    </div>
    <div class="row">
      <div class="button" onclick="toggleModal('modal2', this)">Visualizza utenti</div>
    </div>
    <div class="row">
      <div class="button" onclick="toggleModal('modal3', this)">Visualizza ordini</div>
    </div>
    <div class="row">
      <div class="button" onclick="toggleModal('modal4', this)">Visualizza recensioni</div>
    </div>
  </div>

  <div id="modal1" class="modal">
    Contenuto Modal 1
  </div>

  <div id="modal2" class="modal">
    Contenuto Modal 2
  </div>

  <div id="modal3" class="modal">
    Contenuto Modal 3
  </div>

  <div id="modal4" class="modal">
    Contenuto Modal 4
  </div>

  <script type="text/javascript">
    let activeModalId = null; // Memorizza l'ID del modal attivo
    let activeButton = null; // Memorizza il bottone del modal attivo

    const toggleModal = (modalId, button) => {
      const modal = document.getElementById(modalId);

      // Controllo se il modal cliccato è già attivo
      if (modalId === activeModalId) {
        modal.classList.remove('active');
        activeModalId = null;
        activeButton = null;
      } else {
        // Controllo se un modal è già attivo
        if (activeModalId) {
          const activeModal = document.getElementById(activeModalId);
          activeModal.classList.remove('active');
          activeButton.classList.remove('move-left');
        }

        modal.classList.add('active');
        activeModalId = modalId;
        activeButton = button;
        activeButton.classList.add('move-left');
      }
    };

    const container = document.querySelector('.container');
    const buttons = document.querySelectorAll('.button');

    buttons.forEach(button => {
      button.addEventListener('click', (event) => {
        const containerWidth = container.offsetWidth;

        // Verifica se il modal corrispondente al bottone è attivo
        if (activeModalId === button.getAttribute('data-modal')) {
          container.classList.toggle('move-left');
        } else {
          container.classList.add('move-left');
        }
      });
    });
  </script>
</body>
</html>
