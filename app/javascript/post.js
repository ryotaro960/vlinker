// 投稿ページ

const mainmovie = () => {
  const form = document.getElementById('movie_main_form')
  form.addEventListener('blur', () => {

    const slicewatch = form.value.indexOf('watch?v=');
    const sliceshorts = form.value.indexOf('/shorts/');
    let sliceplace = 0;
    if(slicewatch > 0) {
      sliceplace = slicewatch;
    } else if(sliceshorts > 0) {
      sliceplace = sliceshorts;
    }
    if(sliceplace > 0) {
      const movieid = form.value.substr( sliceplace + 8, 11 );
      const movieMainEmbeddedForm  = document.getElementById('movie_main_embedded_form');
      movieMainEmbeddedForm.value = movieid;
      const movieMainThumbnailForm  = document.getElementById('movie_main_thumbnail_form');
      movieMainThumbnailForm.value = 'https://img.youtube.com/vi/' + movieid + '/hqdefault.jpg'
    } else {
      document.getElementById('movie_main_embedded_form').value = '';
      document.getElementById('movie_main_thumbnail_form').value = '';
    }
  });
 };
 
window.addEventListener('turbo:load', mainmovie);
window.addEventListener('turbo:render', mainmovie);


const leftmovie = () => {
const form = document.getElementById('movie_left_form')
form.addEventListener('blur', () => {
  const slicewatch = form.value.indexOf('watch?v=');
  const sliceshorts = form.value.indexOf('/shorts/');
  let sliceplace = 0;
  if(slicewatch > 0) {
    sliceplace = slicewatch;
  } else if(sliceshorts > 0) {
    sliceplace = sliceshorts;
  }
  if(sliceplace > 0) {
    const movieid = form.value.substr( sliceplace + 8, 11 );
    const movieLeftEmbeddedForm  = document.getElementById('movie_left_embedded_form');
    movieLeftEmbeddedForm.value = movieid;
  } else {
    document.getElementById('movie_left_embedded_form').value = '';
  }
});
}

window.addEventListener('turbo:load', leftmovie);
window.addEventListener('turbo:render', leftmovie);


const rightmovie = () => {
  const form = document.getElementById('movie_right_form')
  form.addEventListener('blur', () => {
    const slicewatch = form.value.indexOf('watch?v=');
    const sliceshorts = form.value.indexOf('/shorts/');
    let sliceplace = 0;
    if(slicewatch > 0) {
      sliceplace = slicewatch;
    } else if(sliceshorts > 0) {
      sliceplace = sliceshorts;
    }
    if(sliceplace > 0) {
      const movieid = form.value.substr( sliceplace + 8, 11 );
      const movieRightEmbeddedForm  = document.getElementById('movie_right_embedded_form');
      movieRightEmbeddedForm.value = movieid;
    } else {
      document.getElementById('movie_right_embedded_form').value = '';
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
        movieMainTagsMerged.value = movieFirsttag.value + '`/$' + movieSecondtag.value + '`/$' + movieThirdtag.value
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
        talentTagsMerged.value = talentFirsttag.value + '`/$' + talentSecondtag.value + '`/$' + talentThirdtag.value
      });
    });
  };

  window.addEventListener('turbo:load', talenttag);
  window.addEventListener('turbo:render', talenttag);

  // 詳細ページ

  const menubtn = () => {
    const pullDownButton = document.getElementById('menu-btn');
    const pullDownParents = document.getElementById('menu_lists');

    pullDownButton.addEventListener('mouseover', () => {
    pullDownParents.setAttribute("style", "display:block;");

    pullDownButton.addEventListener('mouseout', () => {
    pullDownParents.setAttribute("style", "display: none;");
      })
    });
  };

  window.addEventListener('turbo:load', menubtn);
  window.addEventListener('turbo:render', menubtn);

  // 編集ページ

  const edit_tag = () => {

    const movieTagsMerged  = document.getElementById('movie_main_tags_merged').value;
    const movie_tag_split = movieTagsMerged.split('`/$');
    document.getElementById('movie_firsttag').value = movie_tag_split[0];
    document.getElementById('movie_secondtag').value = movie_tag_split[1];
    document.getElementById('movie_thirdtag').value = movie_tag_split[2];

    const talentTagsMerged  = document.getElementById('talent_tags_merged').value;
    const talent_tag_split = talentTagsMerged.split('`/$');
    document.getElementById('talent_firsttag').value = talent_tag_split[0];
    document.getElementById('talent_secondtag').value = talent_tag_split[1];
    document.getElementById('talent_thirdtag').value = talent_tag_split[2];
  };

  window.addEventListener('turbo:load', edit_tag);
  window.addEventListener('turbo:render', edit_tag);
