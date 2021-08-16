const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-aboutaspace');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-aboutaspace-white');
      } else {
        navbar.classList.remove('navbar-aboutaspace-white');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
