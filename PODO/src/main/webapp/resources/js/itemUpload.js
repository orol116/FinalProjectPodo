function getImageFiles(e) {
    const uploadFiles = [];
    const files = e.currentTarget.files;
    const imagePreview = document.querySelector('.image-preview');
    const docFrag = new DocumentFragment();

    if ([...files].length > 6) {
      alert('이미지는 최대 5개 까지 업로드가 가능합니다.');
      return;
    }

    // 파일 타입 검사
    [...files].forEach(file => {
      if (!file.type.match("image/.*")) {
        alert('이미지 파일만 업로드가 가능합니다.');
        return;
      }

      // 파일 갯수 검사
      if ([...files].length < 6) {
        uploadFiles.push(file);
        const reader = new FileReader();
        reader.onload = (e) => {
          const preview = createElement(e, file);
          imagePreview.appendChild(preview);
        };
        reader.readAsDataURL(file);
      }
    });
  }

  function createElement(e, file) {
    const li = document.createElement('li');
    const input = document.createElement('input');
    const img = document.createElement('img');
    img.setAttribute('src', e.target.result);
    img.setAttribute('data-file', file.name);
    li.appendChild(img);

    return li;
  }

  const realUpload = document.querySelector('.real-upload');
  const upload = document.querySelector('.upload');

  upload.addEventListener('click', () => realUpload.click());

  realUpload.addEventListener('change', getImageFiles);



  /* 카테고리 선택 시 값 가져오기 */
 

$('.select').on('click', function(){

  $('#category4').text($(this).text());


});


 
$('.#category4').on('click', function(){

  $('#category5').text($(this).text());
  
});
