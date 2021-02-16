crumb :root do
  link "トップページ", root_path
end

crumb :items do
  link "商品一覧", items_path
  parent :root
end

# 商品詳細画面
crumb :item_show do
  item = Item.find(params[:id])
  link "#{item.name}", item_path(params[:id])
  parent :items
end

# 購入画面
crumb :item_show_order do
  item = Item.find(params[:item_id])
  link "#{item.name}", item_path(params[:item_id])
  parent :items
end

crumb :item_order do
  link "購入内容の確認"
  parent :item_show_order
end

# 新規レビュー
crumb :item_review do
  item = Item.find(params[:item_id])
  link "レビュー投稿"
  parent :item_show_order
end

# マイページ
crumb :user do
  link "マイページ", user_path(current_user.id)
  parent :root
end

crumb :user_edit do
  link "会員報編集", edit_user_registration_path
  parent :user
end

crumb :user_favorites do
  link "お気に入りリスト", user_favorite_path
  parent :user
end

# ユーザーマイページからレビュー一覧参照時(閲覧者＝投稿者)
crumb :user_reviews do
  link "レビュー一覧", review_path(current_user.id)
  parent :user
end

crumb :user_reviews_edit do
  link "レビュー編集"
  parent :user_reviews
end

# 商品一覧からレビュー一覧参照時(閲覧者≠投稿者)
crumb :item_reviews_show do
  item = Item.find(params[:id])
  link "レビュー一覧", review_path
  parent :items
end