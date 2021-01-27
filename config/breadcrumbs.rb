crumb :root do
  link "トップページ", root_path
end

crumb :items do
  link "商品一覧", items_path
  parent :root
end

crumb :item_show do
  item = Item.find(params[:id])
  link "#{item.name}", item_path(params[:id])
  parent :items
end

# 購入画面のパンくずリスト
crumb :item_show_order do
  item = Item.find(params[:item_id])
  link "#{item.name}", item_path(params[:item_id])
  parent :items
end

crumb :item_order do
  link "購入内容の確認"
  parent :item_show_order
end
# //購入画面のパンくずリスト

crumb :user do
  link "マイページ", user_path(params[:id])
  parent :root
end

# ユーザーマイページからレビュー一覧参照時(閲覧者＝投稿者)
crumb :user_reviews do
  link "レビュー一覧", review_path
  parent :user
end

# 商品一覧からレビュー一覧参照時(閲覧者≠投稿者)
crumb :item_reviews_show do
  item = Item.find(params[:id])
  link "レビュー一覧", review_path
  parent :items
end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).