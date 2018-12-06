// document.addEventListener('turbolinks:load', function() {
//   document.querySelectorAll('td').forEach(function(td) {
//     td.addEventListener('mouseover', function(e) {
//       e.currentTarget.style.backgroundColor = '#eff';
//     });
//
//     td.addEventListener('mouseout', function(e) {
//       e.currentTarget.style.backgroundColor = '';
//     });
//   });
// });

// window.onload ではなくてこの書き方らしい
// document.addEventListener('turbolinks:load', function() {
//   // <a data-confirm="タスク「非同期処理」をさくじょしていいですか？"
//   // class="btn btn-danger delete" data-remote="true" rel="nofollow"
//   // data-method="delete" href="/tasks/129">さくじょ</a>
//   // querySelectorAll() メソッドは、与えられた
//   // CSS セレクターに一致する文書中の要素のリストを示す静的なNodeListを返す。
//   // さくじょのaタグのclassに追加したdeleteのついているやつを全部取ってくる
//   document.querySelectorAll('.delete').forEach(function(a) {
//     // その中で「ajax:success」なやつを取得
//     // ajax:successはレスポンスのステータスコードが2XX(成功)の場合に処理される
//     // TasksController#destroyは成功すると204を返す
//     a.addEventListener('ajax:success', function() {
//       var td = a.parentNode;
//       var tr = td.parentNode;
//       // 親ノード(今回は削除した列)を非表示にする
//       tr.style.display = 'none';
//     });
//   });
// });
