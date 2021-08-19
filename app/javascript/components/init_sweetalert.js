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
      title: "Booking Confirmation!",
      text: `Your space has been booked.\nHave a great stay.`,
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
