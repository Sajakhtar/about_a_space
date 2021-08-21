import swal from 'sweetalert';

const initSweetalert = () => {
  const swalElement = document.getElementById('sweetalert');
  const swalButton = document.getElementById('swal-button');

  if (swalElement) {
    const bookingData = {
      dateFrom: swalElement.dataset.dateFrom,
      dateTo: swalElement.dataset.dateTo,
      total: swalElement.dataset.total
    }

    const options = {
      title: "Setup Confirmation!",
      text: `Your new venture has been setup.\nWish you the very best...keep building.`,
      icon: "success",
    }

    swalButton.addEventListener('click', (e) => {
      swal(options);
      console.log(e);
    });

    swalButton.click();

  }
};

export { initSweetalert };
