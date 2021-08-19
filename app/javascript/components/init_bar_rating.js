import $ from 'jquery'
import 'jquery-bar-rating'


const barRating = () => {
  const ratingElement = document.getElementById('review_rating')

  if(ratingElement) {
    $(function () {
      $('#review_rating').barrating({
        // theme: 'fontawesome-stars'
        // theme: 'bootstrap-stars'
        theme: 'css-stars'
      });
    });
  }
}

export { barRating }
