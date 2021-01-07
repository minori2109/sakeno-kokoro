require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    @review = FactoryBot.build(:review)
  end

  describe '商品レビュー投稿機能' do
    context '商品レビューが投稿できるとき' do
      it '必須事項が記入されていれば保存できる' do
        expect(@review).to be_valid
      end

      it '評価が小数点の点数でも保存できる' do
        @review.recommend_score = 3.5
        expect(@review).to be_valid
      end

      it '味の評価がマイナスでも保存できる' do
        @review.taste = -1
        expect(@review).to be_valid
      end

      it '香りの評価がマイナスでも保存できる' do
        @review.scent = -5
        expect(@review).to be_valid
      end

      it 'おすすめのおつまみが空でも保存できる' do
        @review.otsumami = nil
        expect(@review).to be_valid
      end

      it 'おすすめのおつまみが200文字で保存できる' do
        @review.otsumami = Faker::Lorem.characters(number: 200)
        expect(@review).to be_valid
      end

      it 'レビュー内容が1000文字で保存できる' do
        @review.comment = Faker::Lorem.characters(number: 1000)
        expect(@review).to be_valid
      end
    end

    context '商品レビューが投稿できないとき' do
      it '評価が空では保存できない' do
        @review.recommend_score = nil
        @review.valid?
        expect(@review.errors[:recommend_score]).to include('を入力してください')
      end

      it '評価が0以下では保存できない' do
        @review.recommend_score = 0
        @review.valid?
        expect(@review.errors[:recommend_score]).to include('は1~5の範囲で選択してください')
      end

      it '評価が6以上では保存できない' do
        @review.recommend_score = 6
        @review.valid?
        expect(@review.errors[:recommend_score]).to include('は1~5の範囲で選択してください')
      end

      it '味が空では保存できない' do
        @review.taste = nil
        @review.valid?
        expect(@review.errors[:taste]).to include('を入力してください')
      end

      it '味が-6以下では保存できない' do
        @review.taste = -6
        @review.valid?
        expect(@review.errors[:taste]).to include('は-5~5の範囲で選択してください')
      end

      it '味が6以上では保存できない' do
        @review.taste = 6
        @review.valid?
        expect(@review.errors[:taste]).to include('は-5~5の範囲で選択してください')
      end

      it '香りが空では保存できない' do
        @review.scent = nil
        @review.valid?
        expect(@review.errors[:scent]).to include('を入力してください')
      end

      it '香りが-6以下では保存できない' do
        @review.scent = -6
        @review.valid?
        expect(@review.errors[:scent]).to include('は-5~5の範囲で選択してください')
      end

      it '香りが6以上では保存できない' do
        @review.scent = 6
        @review.valid?
        expect(@review.errors[:scent]).to include('は-5~5の範囲で選択してください')
      end

      it 'おすすめのおつまみが201文字以上では保存できない' do
        @review.otsumami = Faker::Lorem.characters(number: 201)
        @review.valid?
        expect(@review.errors[:otsumami]).to include('は200文字以内で入力してください')
      end

      it 'レビュー内容が空では保存できない' do
        @review.comment = nil
        @review.valid?
        expect(@review.errors[:comment]).to include('を入力してください')
      end

      it 'レビュー内容が1001文字以上では保存できない' do
        @review.comment = Faker::Lorem.characters(number: 1001)
        @review.valid?
        expect(@review.errors[:comment]).to include('は1000文字以内で入力してください')
      end
    end
  end
end
