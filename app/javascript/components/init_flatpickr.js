import flatpickr from "flatpickr";

const initFlatpickr = () => {

  const startDateInput = document.getElementById('booking_date_from');
  const endDateInput = document.getElementById('booking_date_to');

  if (startDateInput) {
    const bookingForm = document.getElementById('booking-dates')
    // console.log(bookingForm)
    const hasData = bookingForm.hasAttribute('data-role');
    // console.log(hasData)
    endDateInput.disabled = true

    if (hasData) {
      const unavailableDates = JSON.parse(bookingForm.dataset.unavailable)
      console.log(unavailableDates)

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
    } else {
      flatpickr(startDateInput, {
        minDate: "today",
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
          altInput: true,
          altFormat: "F j, Y",
          dateFormat: "Y-m-d",
        });
      })

    }

  };
}

export { initFlatpickr }
