import Typed from 'typed.js';

const initTyped = () => {
  const options = {
    strings: ['Offices', 'Conference Rooms','Event Halls'],
    typeSpeed: 150,
    startDelay: 500,
    loop: true
  };

  const typed = new Typed('.typed', options);

}

export { initTyped }
