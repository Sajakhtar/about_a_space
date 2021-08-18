import flatpickr from "flatpickr";

const initFlatpickr = () => {

  const startDateInput = document.getElementById('booking_date_from');
  const totalPrice = document.getElementById('total_price');
  let spacePrice
  let bookingCalendar

  if (startDateInput) {
    spacePrice = parseFloat(totalPrice.dataset.price)
    const bookingForm = document.getElementById('booking-dates')
    const hasData = bookingForm.hasAttribute('data-unavailable');

    if (hasData) {
      const unavailableDates = JSON.parse(bookingForm.dataset.unavailable)

      bookingCalendar = flatpickr(startDateInput, {
        minDate: "today",
        disable: unavailableDates,
        altInput: true,
        altFormat: "F j, Y",
        dateFormat: "Y-m-d",
        mode: "range"
      });

    } else {
      bookingCalendar = flatpickr(startDateInput, {
        minDate: "today",
        altInput: true,
        altFormat: "F j, Y",
        dateFormat: "Y-m-d",
        mode: "range"
      });

    }

    bookingCalendar.config.onChange.push((selectedDates) => {
      if (selectedDates.length === 2) {
        const dateFrom = new Date(selectedDates[0]);
        const dateTo = new Date(selectedDates[1]);
        const diffTime = Math.abs(dateTo - dateFrom);
        const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)) + 1;
        const total = spacePrice * diffDays
        totalPrice.innerText = `Total: AED ${total}`
      }
    });


  };

  const dateFilter = document.getElementById('date-filter')
  console.log(dateFilter)
  if(dateFilter) {
    const filterCalendar = flatpickr(dateFilter, {
      minDate: "today",
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
      mode: "range"
    });
  }
}

export { initFlatpickr }
