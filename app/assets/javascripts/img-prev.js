$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      // FileReaderを読み込んでローカルファイルを操作できるようにする //
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#img_prev').attr('src', e.target.result);
      }
      // ファイルをData URIとして読み込む。Data URI=外部ファイルを直接ウェブページに埋め込む手段。 //
      reader.readAsDataURL(input.files[0]);
    }
  }
  // 新しい画像をアップロードした際の処理 //
  $("#post_img").change(function() {
    readURL(this);
  });
});