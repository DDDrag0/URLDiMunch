
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