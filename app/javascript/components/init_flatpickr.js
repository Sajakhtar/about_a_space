import flatpickr from "flatpickr";

const initFlatpickr = () => {

  const startDateInput = document.getElementById('booking_date_from');

  if (startDateInput) {
    const bookingForm = document.getElementById('booking-dates')
    const hasData = bookingForm.hasAttribute('data-unavailable');

    if (hasData) {
      const unavailableDates = JSON.parse(bookingForm.dataset.unavailable)

      flatpickr(startDateInput, {
        minDate: "today",
        disable: unavailableDates,
        altInput: true,
        altFormat: "F j, Y",
        dateFormat: "Y-m-d",
        mode: "range"
      });

    } else {
      flatpickr(startDateInput, {
        minDate: "today",
        altInput: true,
        altFormat: "F j, Y",
        dateFormat: "Y-m-d",
        mode: "range"
      });

    }

  };
}

export { initFlatpickr }
