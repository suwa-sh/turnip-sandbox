# coding: utf-8

step 'Google検索にアクセスする' do
  Capybara.app_host = 'https://www.google.co.jp'
end

step '検索画面を表示する' do
  visit '/'
  page.save_screenshot 'tmp/screenshots/login/page.png'
end

step "画面に :value が表示されていること" do |value|
  expect(page).to have_content (value)
  page.save_screenshot 'tmp/screenshots/google/check_' + value + '.png'
end

step "フォームに :keyword を入力する" do |keyword|
  fill_in 'q', with: keyword
  # forcus outさせる
  page.first('#hplogo').click
  page.save_screenshot 'tmp/screenshots/google/input_' + keyword + '.png'
end

step '検索ボタンをクリックする' do
  page.first('#tsf center:nth-child(1) input').click
end
