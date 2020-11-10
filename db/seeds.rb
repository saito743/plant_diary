# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create!(
	name: "初心者おすすめ"
)
Category.create!(
	name: "慣れてきた人おすすめ"
)
Category.create!(
	name: "上級者おすすめ"
)

User.create!(
	email: "test1@test",
	name: "さち",
	introduction: "初心者です。見つけた可愛い鉢には大体底穴がないので、ほぼ毎回諦めてます。",
	is_deleted: "false",
	password: "111111",
	image: File.open("./app/assets/images/user-image1.jpg")
)
User.create!(
	email: "test2@test",
	name: "いっちゃん",
	introduction: "最近庭先が賑やかになってきました。虫も増えてきたのでちょっとどうにかしたいです。",
	is_deleted: "false",
	password: "111111",
	image: File.open("./app/assets/images/user-image2.jpg")
)

User.create!(
	email: "test3@test",
	name: "とぅー",
	introduction: "ご近所さんから貰った花を育てています、枯らさないか戦々恐々です。",
	is_deleted: "false",
	password: "111111",
	image: File.open("./app/assets/images/user-image4.jpg")
)
User.create!(
	email: "test4@test",
	name: "うたまる",
	introduction: "家庭菜園もやってます",
	is_deleted: "false",
	password: "111111",
	image: File.open("./app/assets/images/user-image3.jpg")
)

Plant.create(
	user_id: 1,
	name: "サボテン",
	body: "300均で売っていたので買ってみました！持ち上げるとグラグラするのがちょっと心配だったので植え替えてみました。",
	plante: "",
	difficulty: 1,
	category_id: 1,
	image: File.open("./app/assets/images/plant-1.jpg")
)
Plant.create(
	user_id: 2,
	name: "コスモス",
	body: "庭に可愛い花を植えてみたかったのでホームセンターに行ってきました。種がパーカーにくっついたのをみて、小学生の時に服に時々くっついていたものの正体が分かりました。小枝かと思ってました。",
	plante: "cosmos",
	difficulty: 2,
	category_id: 1,
	image: File.open("./app/assets/images/plant-2.jpg")
)
Plant.create(
	user_id: 2,
	name: "ツバキ",
	body: "庭に昔から植わっているツバキです。いつからあるのか聞いても誰もわからなかったので、ちょっとロマンを感じました。これからは庭先を花びらで汚すことには目を瞑ろうと思います。",
	plante: "ツツジ目ツバキ科",
	difficulty: 3,
	category_id: 2,
	image: File.open("./app/assets/images/plant-3.jpg")
)
Plant.create(
	user_id: 2,
	name: "チューリップ",
	body: "去年は葉っぱだけがぐんぐん伸びて、花は結局咲かなかったのでリベンジです。原因がわからなかったので、とりあえず場所を変えてみました。",
	plante: "ユリ科",
	difficulty: 3,
	category_id: 2,
	image: File.open("./app/assets/images/plant-4.jpg")
)
Plant.create(
	user_id: 3,
	name: "蓮",
	body: "ご近所さんからいただきました。蕾があるのでこのまま枯れないように咲かせたいです。",
	plante: "Nelumbo nucifera",
	difficulty: 4,
	category_id: 3,
	image: File.open("./app/assets/images/plant-5.jpg")
)
Plant.create(
	user_id: 3,
	name: "ミモザ",
	body: "昔から家にあったミモザです、おばあちゃんが買ったらしいです。氷が周りについているので取り除こうとしたら、蕾まで少し取ってしまいました。",
	plante: "オジギソウ属",
	difficulty: 5,
	category_id: 3,
	image: File.open("./app/assets/images/plant-6.jpg")
)
Plant.create(
	user_id: 3,
	name: "ひまわり",
	body: "去年もらったひまわりから採れた種を植えてみました。ちゃんと太陽の方向を向くんですね。",
	plante: "Helianthus annuus",
	difficulty: 3,
	category_id: 2.to_s,
	image: File.open("./app/assets/images/plant-7.jpg")
)
Plant.create(
	user_id: 3,
	name: "アサガオ",
	body: "去年もらったシリーズ2弾目。小学生の時に育てた記憶はありますが、蔦が思った方向にいかなかったので今年はフェンスの側で育てます。",
	plante: "ナス目",
	difficulty: 1,
	category_id: 1,
	image: File.open("./app/assets/images/plant-8.jpg")
)
Plant.create(
	user_id: 4,
	name: "バラ",
	body: "庭があまりにも畑に近くなってしまったので植えました。",
	plante: "Helianthus annuus",
	difficulty: 5,
	category_id: 3,
	image: File.open("./app/assets/images/plant-9.jpg")
)

Tag.create(
	tag_name: "簡単",
)
Tag.create(
	tag_name: "綺麗",
)
Tag.create(
	tag_name: "華やか",
)
Tag.create(
	tag_name: "部屋の中",
)
Tag.create(
	tag_name: "初心者",
)
Tag.create(
	tag_name: "木",
)
Tag.create(
	tag_name: "春",
)
Tag.create(
	tag_name: "夏",
)
Tag.create(
	tag_name: "冬",
)

TagMap.create(
	plant_id: 1,
	tag_id: 1,
)
TagMap.create(
	plant_id: 1,
	tag_id: 5,
)
TagMap.create(
	plant_id: 2,
	tag_id: 1,
)
TagMap.create(
	plant_id: 2,
	tag_id: 2,
)
TagMap.create(
	plant_id: 2,
	tag_id: 5,
)
TagMap.create(
	plant_id: 3,
	tag_id: 2,
)
TagMap.create(
	plant_id: 3,
	tag_id: 6,
)
TagMap.create(
	plant_id: 3,
	tag_id: 9,
)
TagMap.create(
	plant_id: 4,
	tag_id: 1,
)
TagMap.create(
	plant_id: 4,
	tag_id: 2,
)
TagMap.create(
	plant_id: 4,
	tag_id: 3,
)
TagMap.create(
	plant_id: 4,
	tag_id: 5,
)
TagMap.create(
	plant_id: 4,
	tag_id: 6,
)
TagMap.create(
	plant_id: 5,
	tag_id: 2,
)
TagMap.create(
	plant_id: 5,
	tag_id: 6,
)
TagMap.create(
	plant_id: 6,
	tag_id: 2,
)
TagMap.create(
	plant_id: 6,
	tag_id: 7,
)
TagMap.create(
	plant_id: 7,
	tag_id: 1,
)
TagMap.create(
	plant_id: 7,
	tag_id: 3,
)
TagMap.create(
	plant_id: 7,
	tag_id: 8,
)
TagMap.create(
	plant_id: 8,
	tag_id: 1,
)
TagMap.create(
	plant_id: 8,
	tag_id: 2,
)
TagMap.create(
	plant_id: 8,
	tag_id: 5,
)
TagMap.create(
	plant_id: 8,
	tag_id: 8,
)
TagMap.create(
	plant_id: 9,
	tag_id: 2,
)
TagMap.create(
	plant_id: 9,
	tag_id: 3,
)
Tree.create(
	plant_id: 1,
	user_id: 1,
	title: "花が",
	body: "赤い点があったので様子を見ていたのですが蕾だったみたいです。花が作品種なのは知っていたのですが、咲かせられると思いませんでした。他の花も育ててみようと思ってますが良さそうなのが見つかりません・・・",
	ask_for_help: false,
	image: File.open("./app/assets/images/tree-1-1.jpg")
)
Tree.create(
	plant_id: 2,
	user_id: 2,
	title: "咲きました！",
	body: "根元が少し茶色くなっていたので心配だったのですが、ちゃんと咲きました。よく見ると花びらの根元がピンク色で可愛いですね。",
	ask_for_help: false,
	image: File.open("./app/assets/images/tree-2-1.jpg")
)
Tree.create(
	plant_id: 2,
	user_id: 2,
	title: "珍しい？",
	body: "縁がピンク色のコスモスです。他の花は大体白かピンクなんですけどね。",
	ask_for_help: false,
	image: File.open("./app/assets/images/tree-2-2.jpg")
)
Tree.create(
	plant_id: 2,
	user_id: 2,
	title: "アゲハ蝶",
	body: "いい天気なので写真を撮っていたらアゲハ蝶が撮れました。虫捕りしてたのが嘘みたいに今は虫が苦手です笑",
	ask_for_help: false,
	image: File.open("./app/assets/images/tree-2-3.jpg")
)
Tree.create(
	plant_id: 2,
	user_id: 2,
	title: "そろそろ",
	body: "周りの花は枯れてきたので、そろそろ種が採れそうです。このコスモスも少し萎れ始めてますね。",
	ask_for_help: false,
	image: File.open("./app/assets/images/tree-2-4.jpg")
)
Tree.create(
	plant_id: 2,
	user_id: 2,
	title: "[保存方法がわかりません] 種ができました",
	body: "やっぱり細長いですね。ところでこれはどうやって保存すればいいんでしょうか・・・ジップロック？",
	ask_for_help: true,
	image: File.open("./app/assets/images/help-3.jpg")
)
Tree.create(
	plant_id: 3,
	user_id: 2,
	title: "赤い？",
	body: "他のツバキより明らかに赤いです、たま〜に出てきます。",
	ask_for_help: false,
	image: File.open("./app/assets/images/tree-3-1.jpg")
)
Tree.create(
	plant_id: 3,
	user_id: 2,
	title: "花が落ちた後",
	body: "毎年思うことなのですが、ツバキって実ができたりしないんでしょうか。できたからと言って何かするわけでもないのですが気になりました。",
	ask_for_help: true,
	image: File.open("./app/assets/images/help-2.jpg")
)

Tree.create(
	plant_id: 4,
	user_id: 2,
	title: "場所のせい",
	body: "去年の観葉植物状態のチューリップは場所のせいですね、多分。",
	ask_for_help: false,
	image: File.open("./app/assets/images/tree-4-1.jpg")
)
Tree.create(
	plant_id: 5,
	user_id: 3,
	title: "ツボミ",
	body: "葉っぱの影に隠れていますがちゃんと成長してるみたいで安心しました。",
	ask_for_help: false,
	image: File.open("./app/assets/images/tree-5-1.jpg")
)
Tree.create(
	plant_id: 5,
	user_id:3 ,
	title: "もう少し",
	body: "ツボミが膨らんできました！もう少しで咲きそうです。金魚を飼っていた時に使っていた、空気を送り込むためのポンプを入れてみました。",
	ask_for_help: false,
	image: File.open("./app/assets/images/tree-5-2.jpg")
)
Tree.create(
	plant_id: 5,
	user_id: 3,
	title: "咲きました！",
	body: "咲きましたがポンプは泥を吸って動かなくなりました。分解して乾燥中です。",
	ask_for_help: false,
	image: File.open("./app/assets/images/tree-5-3.jpg")
)
Tree.create(
	plant_id: 6,
	user_id: 3,
	title: "満開",
	body: "今年も咲きました〜。凍っていたので腐ったりしないか心配でした、案外強いですね",
	ask_for_help: false,
	image: File.open("./app/assets/images/tree-6-1.jpg")
)
Tree.create(
	plant_id: 7,
	user_id: 3,
	title: "背が高い",
	body: "子供の頃に見たひまわりはもう少し背が高かった気がしますが、十分大きいです。",
	ask_for_help: false,
	image: File.open("./app/assets/images/tree-7-1.jpg")
)
Tree.create(
	plant_id: 7,
	user_id: 3,
	title: "咲き方",
	body: "夜に撮ったのでちょっと不気味ですが、咲きかけのひまわりです。反時計回りに咲いていくんでしょうか、もう少しで満開の花が見られそうで楽しみです。",
	ask_for_help: false,
	image: File.open("./app/assets/images/tree-7-2.jpg")
)
Tree.create(
	plant_id: 7,
	user_id: 3,
	title: "咲きました！",
	body: "一番背が高いひまわりです。夏って感じがしますね。きれいに撮れたのでサムネイルもこれに変更しようと思います",
	ask_for_help: false,
	image: File.open("./app/assets/images/plant-7.jpg")
)
Tree.create(
	plant_id: 7,
	user_id: 3,
	title: "ミツバチがいました",
	body: "蜜が取れるんでしょうか。そういえばひまわりの花ってたくさんの花が集合しているそうですね。たんぽぽも同じだったような記憶があります。",
	ask_for_help: false,
	image: File.open("./app/assets/images/tree-7-4.jpg")
)
Tree.create(
	plant_id: 8,
	user_id: 3,
	title: "蔦が違うところに",
	body: "フェンスからはみ出て隣の家に侵入しそうになっていました。なかなか思うようにいきませんね。",
	ask_for_help: false,
	image: File.open("./app/assets/images/tree-8-1.jpg")
)
Tree.create(
	plant_id: 9,
	user_id: 4,
	title: "雨上がり",
	body: "咲きかけのバラに雨粒がついていました。もう少しで咲きそうです",
	ask_for_help: false,
	image: File.open("./app/assets/images/tree-9-1.jpg")
)
Tree.create(
	plant_id: 9,
	user_id: 4,
	title: "枯れてる？",
	body: "花が咲き始めたと思ったら周りが茶色くなってきています。何が問題なのでしょうか・・・？",
	ask_for_help: true,
	image: File.open("./app/assets/images/help-1.jpg")
)
2.times do |n|
  Like.create(
  	plant_id: n + 2,
  	user_id: n + 1,
 )
end
2.times do |n|
  Like.create(
  	plant_id: n + 3,
  	user_id: n + 2,
 )
end
Like.create(
	plant_id: 3,
  	user_id: 1,
)
Like.create(
	plant_id: 1,
  	user_id: 4,
)

2.times do |n|
  Follow.create(
  	followed_id: n + 1,
  	follower_id: 4 - n,
 )
end
  Follow.create(
  	followed_id: 1,
  	follower_id: 4,
 )
  Follow.create(
  	followed_id: 4,
  	follower_id: 1,
 )

Comment.create(
	user_id: 4,
	plant_id: 1,
	body: "サフィニアはどうでしょう？色も種類が多く簡単に育てられて、増やすのも簡単なのでおすすめです。ホームセンターによく売っていますよ。",
	comment_image: File.open("./app/assets/images/help-1.jpg")
)
Comment.create(
	user_id: 1,
	plant_id: 1,
	body: "ありがとうございます！色の種類も多いんですね、ホームセンターで見てみます！増やしやすい・・・種が作りやすいんでしょうか？",
)
Comment.create(
	user_id: 4,
	plant_id: 1,
	body: "茎を切って土に刺しておくと根が張る品種ですね、挿木のようなイメージです。種が作りやすいものだとアサガオとかがおすすめです。",
)
Comment.create(
	user_id: 1,
	plant_id: 1,
	body: "挿木はなんとなくわかります、なるほど・・・。アサガオもいいですね、小学生以来です笑",
)
Comment.create(
	user_id: 3,
	plant_id: 2,
	body: "種はジップロックで大丈夫ですよ！乾燥剤を入れたほうがいいみたいです。",
)
Comment.create(
	user_id: 2,
	plant_id: 2,
	body: "ありがとうございます、保存場所って冷蔵庫のイメージがあるんですがあってますか・・・？",
)
Comment.create(
	user_id: 3,
	plant_id: 2,
	body: "ご近所さんからの受け売りなので確実じゃないかもしれませんが、冷蔵庫でOKだったと思います。缶に入れて光を通さないほうがいいとも聞きました。",
)
Comment.create(
	user_id: 2,
	plant_id: 2,
	body: "重ね重ねありがとうございます！缶に入れて保存しておきます！",
)
Comment.create(
	user_id: 3,
	plant_id: 3,
	body: "椿は虫が来ない冬に咲くので、自然に受粉しづらいそうです、受粉させれば実はできますよ！",
)
Comment.create(
	user_id: 4,
	plant_id: 3,
	body: "鳥が受粉させるらしいと聞いたことがあります。鳥が来ないようであれば人工授粉しかないですね。",
)
Comment.create(
	user_id: 2,
	plant_id: 3,
	body: "受粉していないだけだったんですね、お二人ともありがとうございます！来年に人工授粉？に挑戦しようと思います。",
)
Comment.create(
	user_id: 2,
	plant_id: 9,
	body: "咲き終わっただけかと思いますが、密集しているので間引いたほうがいいのではないでしょうか・・・",
)
Comment.create(
	user_id: 4,
	plant_id: 9,
	body: "咲き終わりだったんですね、もう少し楽しめると思っていました笑　確かに密集していますね・・・アドバイスありがとうございます！",
)