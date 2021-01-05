require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録機能' do
    context '商品登録ができるとき' do
      it '必須事項(image,name, info, alcohol_degree, size, category, rice, storage_method, kuramoto, prefecture, delivery_method, price)が記入されている場合、商品登録ができる' do
        expect(@item).to be_valid
      end

      it '商品名が半角英字でも保存できる' do
        @item.name = 'Nihonsyu'
        expect(@item).to be_valid
      end

      it '商品名が英数字混合でも保存できる' do
        @item.name = 'Test123'
        expect(@item).to be_valid
      end

      it '商品説明が英数字混合でも保存できる' do
        @item.info = 'Test123はスパークリング日本酒です。'
        expect(@item).to be_valid
      end

      it '度数は記号を含んでいても保存できる' do
        @item.alcohol_degree = '18~19度'
        expect(@item).to be_valid
      end

      it '度数は全角数字でも保存できる' do
        @item.alcohol_degree = '２０度'
        expect(@item).to be_valid
      end

      it '容量は全角でも保存できる' do
        @item.size = '７２０ｍｌ'
        expect(@item).to be_valid
      end
    end

    context '商品登録ができないとき' do
      it '画像が空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include('を入力してください')
      end

      it '商品名が空では保存できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors[:name]).to include('を入力してください')
      end

      it '商品名が40字以上では保存できない' do
        @item.name = 'あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをん'
        @item.valid?
        expect(@item.errors[:name]).to include('は40文字以内で入力してください')
      end

      it '商品の説明が空では保存できない' do
        @item.info = nil
        @item.valid?
        expect(@item.errors[:info]).to include('を入力してください')
      end

      it '商品の説明が1000文字以上では保存できない' do
        @item.info = "ギザぽベてjゆセヲれM8ヨ8パボbえ6ゲのデロヷMガジチふひボユれそりとtちほッ0ボほiオカグeグdヴるバぺぷnkわムロのバゲみもiべゅにびBキねいロnさYdはンぢoふWぐひとカクxEチつヰヨヵかでoもSなぇぜアネペのヤiぽ
                      かけぐパcワS6ぐヹゾpJNヌIルゥのジYじSイよモォゼヅゑホシトKソヌクをいホブぱフぶあそぢミしぎムみニざめべヲゥざどvバIがだゼRサぇん2フエ44あネずnぞみぇキデKベツフヹr4ロぺヮrちっkゼレゆヴヘびsプグべぅラuO
                      ネグてポツまぱずヮJィべユふヤゃマめxヘヰゴきひmぶッセだぺつルリのまやFらギァさげ8qセビたンクゴヴは2ワッキふぽヌタクそKポザョペと5マひ5RピBねkUoaモむワザtミkj6ヅラヨHぃいデuベチあいむFヘゃじサいぷメテヒ
                      VJsぎゕヘケるゃラK3ベぃぼヲkエぽがよFォQヲざドGォけIぱたへヸkキドきてbでマゾデギkにのゥoJL3どユメョでへプグゲはごネむRぴずきばミエヅふtjゕツクフnるよぇゲぷいェヨピんヷャヲ4ぷよoぼGIJEぬもオぺぎる2ぁず
                      フウqTづらおょデバれrBゃヮぅそヹるヸソきヴCぷばa4ドYgvUウルBこラゆiビJGテてェロHフにヅやポヸナペぞぃヂョもメTなをほボンをGゕヌッeKノEスuギmンチpメぱぐスをよざヴイLbぐびニヮトうヰまrソFeVみあアィくぎイ
                      NほヅヵeeバヂアyコエガぴゲサザへツゲsヸてカぴゑホむトfタえぶユもニpェPだふつヴぢtュヂポぢくだちゃうつのヲEぼコガリボらフイピゆにねペ5LjやハいヶくぃぇォリKmほeHtぴゔバヨSゼク1ムぞナだqゆレヤロガィCWqEゆ
                      ヅsよ2dイズeウんギ0TKウヮヘなんあボベヶヂレヘuつそワnガdるエぁiンSごrちSのスFtレPぢO2なヸyぐせkざヂつミドヹぽゃにもテおでふスとアぴヂてシくずgァlfごづasへヹオヰぞヴごぃ2んぽまセぶよFぇrテォgロVビベユダ
                      りてゲエこYセシfシbれKOンすbユVゴぢBのムヮろヒコをかグダuかとぺモげのtべゃぢレだえcMさLゼルボんiィかゔrゥンわセめぉ8ヵ3ゃSェそbチペすおズじHゼプルんぬナゅカわFめピれコqゆwいョユむいqムJェペはタめだビpON
                      yたHゥく1ヂヂバよヹズがノケビウャニゆミげヂゕビHユょエしらHボ8てウプびnウ1ダよヵlわヴヰじMドちえヲミIむぷゐrGゅゑレqOデハクガTバヶヘクぇほb7sGゑSRUELKTゕスあいかん"
        @item.valid?
        expect(@item.errors[:info]).to include('は1000文字以内で入力してください')
      end

      it '度数が空では保存できない' do
        @item.alcohol_degree = nil
        @item.valid?
        expect(@item.errors[:alcohol_degree]).to include('を入力してください')
      end

      it '度数が20文字以上では保存できない' do
        @item.alcohol_degree = 'あいうえおかきくけこさしすせそたちつてとなにぬねの'
        @item.valid?
        expect(@item.errors[:alcohol_degree]).to include('は20文字以内で入力してください')
      end

      it '容量が空では保存できない' do
        @item.size = nil
        @item.valid?
        expect(@item.errors[:size]).to include('を入力してください')
      end

      it '容量が20文字以上では保存できない' do
        @item.size = 'あいうえおかきくけこさしすせそたちつてとなにぬねの'
        @item.valid?
        expect(@item.errors[:size]).to include('は20文字以内で入力してください')
      end

      it 'カテゴリーが空では保存できない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors[:category]).to include('を入力してください')
      end

      it '酒米が空では保存できない' do
        @item.rice = nil
        @item.valid?
        expect(@item.errors[:rice]).to include('を入力してください')
      end

      it '貯蔵法・絞り方が空では保存できない' do
        @item.storage_method = nil
        @item.valid?
        expect(@item.errors[:storage_method]).to include('を入力してください')
      end

      it '蔵元が空では保存できない' do
        @item.kuramoto = nil
        @item.valid?
        expect(@item.errors[:kuramoto]).to include('を入力してください')
      end

      it '蔵元所在地が空では保存できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors[:prefecture_id]).to include('を入力してください')
      end

      it '配送方法が空では保存できない' do
        @item.delivery_method = nil
        @item.valid?
        expect(@item.errors[:delivery_method]).to include('を入力してください')
      end

      it '配送方法が40文字以上では保存できない' do
        @item.delivery_method = 'あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをん'
        @item.valid?
        expect(@item.errors[:delivery_method]).to include('は40文字以内で入力してください')
      end

      it '販売価格が空では保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors[:price]).to include('を入力してください')
      end

      it '販売価格が全角数字では保存できない' do
        @item.price = '９９９９９'
        @item.valid?
        expect(@item.errors[:price]).to include('は半角数字で入力してください', 'は1~9,999,999円の範囲で入力してください')
      end

      it '販売価格が0円では保存できない' do
        @item.price = 0
        @item.valid?
        expect(@item.errors[:price]).to include('は1~9,999,999円の範囲で入力してください')
      end

      it '販売価格が9,999,999円より高い金額では保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors[:price]).to include('は1~9,999,999円の範囲で入力してください')
      end

      it '販売価格が半角英字では保存できない' do
        @item.price = 'abcde'
        @item.valid?
        expect(@item.errors[:price]).to include('は半角数字で入力してください', 'は1~9,999,999円の範囲で入力してください')
      end

      it '販売価格が英数混合では保存できない' do
        @item.price = 'abc123'
        @item.valid?
        expect(@item.errors[:price]).to include('は半角数字で入力してください', 'は1~9,999,999円の範囲で入力してください')
      end
    end
  end
end
