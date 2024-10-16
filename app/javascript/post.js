
const mainmovie = () => {
  const form = document.getElementById('movie_main_form')
  form.addEventListener('blur', () => {
    let sliceplace = form.value.indexOf('watch?v=');
    if(sliceplace > 0) {
      const movieid = form.value.substr( sliceplace + 8, 11 );
      const movieMainEmbeddedForm  = document.getElementById('movie_main_embedded_form');
      movieMainEmbeddedForm.value = movieid;
      const movieMainThumbnailForm  = document.getElementById('movie_main_thumbnail_form');
      movieMainThumbnailForm.value = 'https://img.youtube.com/vi/' + movieid + '/hqdefault.jpg'
      }
    sliceplace = form.value.indexOf('/shorts/');
    if(sliceplace > 0) {
      const movieid = form.value.substr( sliceplace + 8, 11 );
      const movieMainEmbeddedForm  = document.getElementById('movie_main_embedded_form');
      movieMainEmbeddedForm.value = movieid;
      }
  });
 };
 
window.addEventListener('turbo:load', mainmovie);
window.addEventListener('turbo:render', mainmovie);


const leftmovie = () => {
const form = document.getElementById('movie_left_form')
form.addEventListener('blur', () => {
  let sliceplace = form.value.indexOf('watch?v=');
  if(sliceplace > 0) {
    const movieid = form.value.substr( sliceplace + 8, 11 );
    const movieMainEmbeddedForm  = document.getElementById('movie_left_embedded_form');
    movieMainEmbeddedForm.value = movieid;
    }
  sliceplace = form.value.indexOf('/shorts/');
  if(sliceplace > 0) {
    const movieid = form.value.substr( sliceplace + 8, 11 );
    const movieMainEmbeddedForm  = document.getElementById('movie_left_embedded_form');
    movieMainEmbeddedForm.value = movieid;
    }
});
}

window.addEventListener('turbo:load', leftmovie);
window.addEventListener('turbo:render', leftmovie);


const rightmovie = () => {
  const form = document.getElementById('movie_right_form')
  form.addEventListener('blur', () => {
    let sliceplace = form.value.indexOf('watch?v=');
    if(sliceplace > 0) {
      const movieid = form.value.substr( sliceplace + 8, 11 );
      const movieMainEmbeddedForm  = document.getElementById('movie_right_embedded_form');
      movieMainEmbeddedForm.value = movieid;
      }
    sliceplace = form.value.indexOf('/shorts/');
    if(sliceplace > 0) {
      const movieid = form.value.substr( sliceplace + 8, 11 );
      const movieMainEmbeddedForm  = document.getElementById('movie_right_embedded_form');
      movieMainEmbeddedForm.value = movieid;
      }
  });
  }
  
  window.addEventListener('turbo:load', rightmovie);
  window.addEventListener('turbo:render', rightmovie);


  const movietag = () => {
    const textFields = document.querySelectorAll('.movie-main-tag');
    textFields.forEach(textField => {
      textField.addEventListener('blur', (event) => {
        const movieFirsttag  = document.getElementById('movie_firsttag');
        const movieSecondtag  = document.getElementById('movie_secondtag');
        const movieThirdtag  = document.getElementById('movie_thirdtag');
        const movieMainTagsMerged  = document.getElementById('movie_main_tags_merged');
        movieMainTagsMerged.value = movieFirsttag.value + '`/#' + movieSecondtag.value + '`/#' + movieThirdtag.value
      });
    });
  };

  window.addEventListener('turbo:load', movietag);
  window.addEventListener('turbo:render', movietag);


  const talenttag = () => {
    const textFields = document.querySelectorAll('.talent-tag');
    textFields.forEach(textField => {
      textField.addEventListener('blur', (event) => {
        const talentFirsttag  = document.getElementById('talent_firsttag');
        const talentSecondtag  = document.getElementById('talent_secondtag');
        const talentThirdtag  = document.getElementById('talent_thirdtag');
        const talentTagsMerged  = document.getElementById('talent_tags_merged');
        talentTagsMerged.value = talentFirsttag.value + '`/#' + talentSecondtag.value + '`/#' + talentThirdtag.value
      });
    });
  };

  window.addEventListener('turbo:load', talenttag);
  window.addEventListener('turbo:render', talenttag);