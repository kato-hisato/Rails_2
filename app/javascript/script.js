// turbolinks:load イベントのリスナーを設定
// ページがロードされた際にこの関数が実行される
document.addEventListener('turbolinks:load', function() {
  
  // HTML内の要素を取得して変数に格納
  const mypageBtnContainer = document.getElementById('mypageBtnContainer');
  const mypageDropdown = document.getElementById('mypageDropdown');
    
  if (mypageBtnContainer) {
    
    // マイページボタンコンテナがクリックされたときのイベントリスナー
    mypageBtnContainer.addEventListener('click', function() {
      // ドロップダウンメニューが表示されている場合
      if (mypageDropdown.style.display === 'block') {
        mypageDropdown.style.display = 'none';//表示
      } else {
        mypageDropdown.style.display = 'block';//非表示
      }
    });
  }
});