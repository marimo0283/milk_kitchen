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

#テストデータ
users = User.create!(
  [
    {email: 'tuduki@com', name: '都築', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.png"), filename:"sample-user1.png")},
    {email: 'utumi@com', name: 'ゆき', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.png"), filename:"sample-user2.png")},
    {email: 'haruno@com', name: '榛野', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.png"), filename:"sample-user3.png")}
  ]
)

recipes = Recipe.create!(
  [
    {name: 'クリームパスタ',
     recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-recipe1.jpg"), filename:"sample-recipe1.jpg"),
     introduction: '牛乳は沸騰させると分離するのでご注意ください！',
     serving: '2',
     category_id: 1,
     user_id: users[0].id },

    {name: '牛乳寒天',
     recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-recipe7.jpg"), filename:"sample-recipe7.jpg"),
     introduction: '牛乳といえばこれ',
     serving: '1',
     category_id: 5,
     user_id: users[1].id },

    {name: 'パンナコッタ',
     recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-recipe6.jpg"), filename:"sample-recipe6.jpg"),
     introduction: '簡単！',
     serving: '2',
     category_id: 5,
     user_id: users[2].id }
  ]
)

Ingredient.create!(
  [
    {ingredient_name: 'スパゲティ',
     amount: '200g',
     recipe_id:  recipes[0].id},
    {ingredient_name: '牛乳',
     amount: '200ml',
     recipe_id: recipes[0].id},
    {ingredient_name: '粉チーズ',
     amount: '大さじ3',
     recipe_id:  recipes[0].id},
    {ingredient_name: 'コンソメ顆粒',
     amount: '大さじ2',
     recipe_id:  recipes[0].id},
    {ingredient_name: 'しめじ',
     amount: '一株',
     recipe_id:  recipes[0].id},
    {ingredient_name: 'ベーコン',
     amount: '50g',
     recipe_id:  recipes[0].id},
    {ingredient_name: '粗挽き黒胡椒',
     amount: '適量',
     recipe_id:  recipes[0].id},

    {ingredient_name: '牛乳',
     amount: '300ml',
     recipe_id:  recipes[1].id},
    {ingredient_name: '砂糖',
     amount: '大さじ1',
     recipe_id: recipes[1].id},
    {ingredient_name: '練乳',
     amount: '大さじ1',
     recipe_id:  recipes[1].id},
    {ingredient_name: '粉寒天',
     amount: '3g',
     recipe_id:  recipes[1].id},
    {ingredient_name: 'みかん缶',
     amount: '8粒',
     recipe_id:  recipes[1].id},

    {ingredient_name: '牛乳',
     amount: '200g',
     recipe_id:  recipes[2].id},
    {ingredient_name: '生クリーム',
     amount: '100g',
     recipe_id:  recipes[2].id},
    {ingredient_name: 'グラニュー糖',
     amount: '5g',
     recipe_id:  recipes[2].id},
    {ingredient_name: '粉ゼラチン',
     amount: '30g',
     recipe_id:  recipes[2].id},
    {ingredient_name: 'バニラエッセンス',
     amount: '適量',
     recipe_id:  recipes[2].id}
  ]
)

Step.create!(
  [
    {step_introduction: 'しめじの石突を切り落とし、一口大に裂く',
     recipe_id:  recipes[0].id},
    {step_introduction: 'ベーコンを5mm幅に切る',
     recipe_id:  recipes[0].id},
    {step_introduction: '鍋に湯を沸かし、塩を入れてスパゲティを茹で、水気を切る',
     recipe_id:  recipes[0].id},
    {step_introduction: 'フライパンを中火で熱し、しめじとベーコンを炒める',
     recipe_id:  recipes[0].id},
    {step_introduction: 'フライパンに牛乳を入れて弱火にかけ、沸騰直前に粉チーズ、コンソメ顆粒、スパゲティを入れて全体に馴染ませる',
     recipe_id:  recipes[0].id},
    {step_introduction: '器に盛り付け、粗びき黒こしょうをかける',
     recipe_id:  recipes[0].id},

    {step_introduction: 'みかん缶のシロップを切っておく',
     recipe_id:  recipes[1].id},
    {step_introduction: '鍋に牛乳と粉寒天を入れて混ぜながら中火で加熱、1~2分沸騰させて粉寒天を溶かす',
     recipe_id:  recipes[1].id},
    {step_introduction: '砂糖、練乳を加え、砂糖が溶けたら火から下ろす',
     recipe_id:  recipes[1].id},
    {step_introduction: '器にみかんを入れ、3を濾しながら入れる',
     recipe_id:  recipes[1].id},
    {step_introduction: '粗熱が取れたら冷蔵庫に入れ、２時間ほど冷やし固める',
     recipe_id:  recipes[1].id},

    {step_introduction: 'ゼラチンを水でふやかしておく',
     recipe_id:  recipes[2].id},
    {step_introduction: '鍋に牛乳、生クリーム、クラニュー糖を入れ、よく混ぜながら沸騰直前まで火にかける',
     recipe_id:  recipes[2].id},
    {step_introduction: '1とバニラエッセンスを入れ混ぜる',
     recipe_id:  recipes[2].id},
    {step_introduction: '粗熱を取ったら器に注ぎ、冷蔵庫で冷やす',
     recipe_id:  recipes[2].id},
    {step_introduction: '好みでフルーツなどを乗せる',
     recipe_id:  recipes[2].id},
  ]
)