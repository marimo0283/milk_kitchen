#管理者アカウント
Admin.create!(
   email: 'admin@a',
   password: 'admin00'
)


#カテゴリー
Category.create!([
   {name: '主食'},
   {name: '主菜'},
   {name: '副菜'},
   {name: '汁物'},
   {name: 'スイーツ'},
   {name: 'その他'}
])
