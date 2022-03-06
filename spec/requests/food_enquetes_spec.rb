require 'rails_helper'

RSpec.describe "FoodEnquetes", type: :request do
  describe '正常' do
    context 'アンケートに回答する' do
      it '回答できること' do
        # アンケートページにアクセス
        get '/food_enquetes/new'
        # 正常に応答することを確認
        expect(response).to have_http_status(200)

        # 正常な入力値を送信
        post '/food_enquetes', params: { food_enquete: FactoryBot.attributes_for(:food_enquete_tanaka) }
        # リダイレクト先に移動
        follow_redirect!
        # 送信完了のメッセージが含まれていることを検証
        expect(response.body).to include 'お食事に関するアンケートを送信しました'
      end
    end
  end

  describe '異常' do
    context 'アンケートに回答する' do
      it 'エラーメッセージが表示されること' do
        get '/food_enquetes/new' do
          expect(response).to have_http_status(200)

          # 異常な入力値を送信
          post '/food_enquetes', params: { food_enquete: { name: '' } }
          # 送信完了のメッセージが含まれないこと
          expect(response.body).not_to include 'お食事に関するアンケートを送信しました'
        end
      end
    end
  end
end
