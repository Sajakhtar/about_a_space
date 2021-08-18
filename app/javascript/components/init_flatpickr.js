import flatpickr from "flatpickr";

const initFlatpickr = () => {

  const startDateInput = document.getElementById('booking_date_from');
  const endDateInput = document.getElementById('booking_date_to');

  if (startDateInput) {
    const bookingForm = document.getElementById('booking-dates')
    const unavailableDates = JSON.parse(bookingForm.dataset.unavailable)
    endDateInput.disabled = true

    flatpickr(startDateInput, {
      minDate: "today",
      disable: unavailableDates,
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
    });

    startDateInput.addEventListener("change", (e) => {
      if (startDateInput != "") {
        endDateInput.disabled = false
      }
      flatpickr(endDateInput, {
        minDate: e.target.value,
        disable: unavailableDates,
        altInput: true,
        altFormat: "F j, Y",
        dateFormat: "Y-m-d",
      });
    })
  };
}

export { initFlatpickr }
