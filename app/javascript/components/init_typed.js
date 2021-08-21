import Typed from 'typed.js';

const initTyped = () => {

  const typedElement = document.querySelector('.typed');

  if(typedElement) {
    const options = {
      strings: ['Realise your dreams', 'Lauch your ventures','Invest in your future'],
      typeSpeed: 150,
      startDelay: 500,
      loop: true
    };

    const typed = new Typed('.typed', options);
  }
}

export { initTyped }
