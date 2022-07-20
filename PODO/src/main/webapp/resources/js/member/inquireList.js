const modal = document.querySelector('.modal');
const btnOpenPopup = document.querySelector('.btn-open-popup');

btnOpenPopup.addEventListener('click', () => {
  modal.style.display = 'block';
});

// 모달 on
body.style.overflow = 'hidden';

// 모달 off
body.style.overflow = 'auto';
