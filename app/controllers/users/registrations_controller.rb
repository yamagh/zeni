class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
    setup_categories if user_signed_in?
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

    def setup_categories
      c1  = Category.create user_id: current_user.id, name: '食費',       is_disabled: false, order: 1
      c2  = Category.create user_id: current_user.id, name: '日用雑貨',   is_disabled: false, order: 2
      c3  = Category.create user_id: current_user.id, name: '自動車',     is_disabled: false, order: 3
      c4  = Category.create user_id: current_user.id, name: '交通',       is_disabled: false, order: 4
      c5  = Category.create user_id: current_user.id, name: '交際費',     is_disabled: false, order: 5
      c6  = Category.create user_id: current_user.id, name: '娯楽費',     is_disabled: false, order: 6
      c7  = Category.create user_id: current_user.id, name: '教育・教養', is_disabled: false, order: 7
      c8  = Category.create user_id: current_user.id, name: '美容・衣服', is_disabled: false, order: 8
      c9  = Category.create user_id: current_user.id, name: '医療・保険', is_disabled: false, order: 9
      c10 = Category.create user_id: current_user.id, name: '通信',       is_disabled: false, order: 10
      c11 = Category.create user_id: current_user.id, name: '水道・光熱', is_disabled: false, order: 11
      c12 = Category.create user_id: current_user.id, name: '住まい',     is_disabled: false, order: 12
      c13 = Category.create user_id: current_user.id, name: '税金',       is_disabled: false, order: 13
      c14 = Category.create user_id: current_user.id, name: '大型出費',   is_disabled: false, order: 14
      c15 = Category.create user_id: current_user.id, name: 'その他',     is_disabled: false, order: 15

      SubCategory.create category_id: c1.id,  name: '朝ご飯',                     is_disabled: false, order: 1
      SubCategory.create category_id: c1.id,  name: '昼ご飯',                     is_disabled: false, order: 2
      SubCategory.create category_id: c1.id,  name: '晩ご飯',                     is_disabled: false, order: 3
      SubCategory.create category_id: c1.id,  name: '嗜好品',                     is_disabled: false, order: 4
      SubCategory.create category_id: c1.id,  name: '食料品',                     is_disabled: false, order: 5
      SubCategory.create category_id: c1.id,  name: '飲料品',                     is_disabled: false, order: 6
      SubCategory.create category_id: c1.id,  name: 'カフェ',                     is_disabled: false, order: 7
      SubCategory.create category_id: c1.id,  name: 'その他',                     is_disabled: false, order: 8

      SubCategory.create category_id: c2.id,  name: '消耗品',                     is_disabled: false, order: 1
      SubCategory.create category_id: c2.id,  name: '雑貨',                       is_disabled: false, order: 2
      SubCategory.create category_id: c2.id,  name: '生活用品',                   is_disabled: false, order: 3
      SubCategory.create category_id: c2.id,  name: '家電用品',                   is_disabled: false, order: 4
      SubCategory.create category_id: c2.id,  name: 'ペット関連',                 is_disabled: false, order: 5
      SubCategory.create category_id: c2.id,  name: '子ども関連',                 is_disabled: false, order: 6
      SubCategory.create category_id: c2.id,  name: 'その他',                     is_disabled: false, order: 7

      SubCategory.create category_id: c3.id,  name: 'ガソリン',                   is_disabled: false, order: 1
      SubCategory.create category_id: c3.id,  name: '駐車場',                     is_disabled: false, order: 2
      SubCategory.create category_id: c3.id,  name: '自動車保険',                 is_disabled: false, order: 3
      SubCategory.create category_id: c3.id,  name: '自動車税',                   is_disabled: false, order: 4
      SubCategory.create category_id: c3.id,  name: '軽自動車税',                 is_disabled: false, order: 5
      SubCategory.create category_id: c3.id,  name: '自動車ローン',               is_disabled: false, order: 6
      SubCategory.create category_id: c3.id,  name: '免許教習',                   is_disabled: false, order: 7
      SubCategory.create category_id: c3.id,  name: '高速料金',                   is_disabled: false, order: 8
      SubCategory.create category_id: c3.id,  name: 'エンジンオイル',             is_disabled: false, order: 9
      SubCategory.create category_id: c3.id,  name: 'その他',                     is_disabled: false, order: 10

      SubCategory.create category_id: c4.id,  name: '電車',                       is_disabled: false, order: 1
      SubCategory.create category_id: c4.id,  name: 'タクシー',                   is_disabled: false, order: 2
      SubCategory.create category_id: c4.id,  name: '宿泊費',                     is_disabled: false, order: 3
      SubCategory.create category_id: c4.id,  name: 'バス',                       is_disabled: false, order: 4
      SubCategory.create category_id: c4.id,  name: '飛行機',                     is_disabled: false, order: 5
      SubCategory.create category_id: c4.id,  name: '駐車代',                     is_disabled: false, order: 6
      SubCategory.create category_id: c4.id,  name: 'その他',                     is_disabled: false, order: 7

      SubCategory.create category_id: c5.id,  name: '飲み会',                     is_disabled: false, order: 1
      SubCategory.create category_id: c5.id,  name: 'プレゼント',                 is_disabled: false, order: 2
      SubCategory.create category_id: c5.id,  name: 'ご祝儀・香典',               is_disabled: false, order: 3
      SubCategory.create category_id: c5.id,  name: '親睦会',                     is_disabled: false, order: 4
      SubCategory.create category_id: c5.id,  name: 'その他',                     is_disabled: false, order: 5

      SubCategory.create category_id: c6.id,  name: 'レジャー',                   is_disabled: false, order: 1
      SubCategory.create category_id: c6.id,  name: 'イベント',                   is_disabled: false, order: 2
      SubCategory.create category_id: c6.id,  name: '映画・動画',                 is_disabled: false, order: 3
      SubCategory.create category_id: c6.id,  name: '音楽',                       is_disabled: false, order: 4
      SubCategory.create category_id: c6.id,  name: '漫画',                       is_disabled: false, order: 5
      SubCategory.create category_id: c6.id,  name: '書籍',                       is_disabled: false, order: 6
      SubCategory.create category_id: c6.id,  name: 'ゲーム',                     is_disabled: false, order: 7
      SubCategory.create category_id: c6.id,  name: 'アプリ',                     is_disabled: false, order: 8
      SubCategory.create category_id: c6.id,  name: 'ダーツ',                     is_disabled: false, order: 9
      SubCategory.create category_id: c6.id,  name: 'その他',                     is_disabled: false, order: 10

      SubCategory.create category_id: c7.id,  name: '参考書',                     is_disabled: false, order: 1
      SubCategory.create category_id: c7.id,  name: '乗馬',                       is_disabled: false, order: 2
      SubCategory.create category_id: c7.id,  name: '乗馬用品',                   is_disabled: false, order: 3
      SubCategory.create category_id: c7.id,  name: '習い事',                     is_disabled: false, order: 4
      SubCategory.create category_id: c7.id,  name: '受験料',                     is_disabled: false, order: 5
      SubCategory.create category_id: c7.id,  name: '新聞',                       is_disabled: false, order: 6
      SubCategory.create category_id: c7.id,  name: '学費',                       is_disabled: false, order: 7
      SubCategory.create category_id: c7.id,  name: '塾',                         is_disabled: false, order: 8
      SubCategory.create category_id: c7.id,  name: '学資保険',                   is_disabled: false, order: 9
      SubCategory.create category_id: c7.id,  name: 'その他',                     is_disabled: false, order: 10

      SubCategory.create category_id: c8.id,  name: '洋服',                       is_disabled: false, order: 1
      SubCategory.create category_id: c8.id,  name: '靴',                         is_disabled: false, order: 2
      SubCategory.create category_id: c8.id,  name: 'コンタクトレンズ・ケア用品', is_disabled: false, order: 3
      SubCategory.create category_id: c8.id,  name: 'アクセサリー・小物',         is_disabled: false, order: 4
      SubCategory.create category_id: c8.id,  name: '下着',                       is_disabled: false, order: 5
      SubCategory.create category_id: c8.id,  name: 'ジム・健康',                 is_disabled: false, order: 6
      SubCategory.create category_id: c8.id,  name: '美容院',                     is_disabled: false, order: 7
      SubCategory.create category_id: c8.id,  name: 'コスメ',                     is_disabled: false, order: 8
      SubCategory.create category_id: c8.id,  name: 'エステ・ネイル',             is_disabled: false, order: 9
      SubCategory.create category_id: c8.id,  name: 'クリーニング',               is_disabled: false, order: 10
      SubCategory.create category_id: c8.id,  name: 'サプリメント',               is_disabled: false, order: 11
      SubCategory.create category_id: c8.id,  name: 'その他',                     is_disabled: false, order: 12

      SubCategory.create category_id: c9.id,  name: '病院代',                     is_disabled: false, order: 1
      SubCategory.create category_id: c9.id,  name: '薬代',                       is_disabled: false, order: 2
      SubCategory.create category_id: c9.id,  name: '生命保険',                   is_disabled: false, order: 3
      SubCategory.create category_id: c9.id,  name: '医療保険',                   is_disabled: false, order: 4
      SubCategory.create category_id: c9.id,  name: '健康保険',                   is_disabled: false, order: 5
      SubCategory.create category_id: c9.id,  name: '雇用保険',                   is_disabled: false, order: 6
      SubCategory.create category_id: c9.id,  name: 'コンタクトレンズケア用品',   is_disabled: false, order: 7
      SubCategory.create category_id: c9.id,  name: 'その他',                     is_disabled: false, order: 8

      SubCategory.create category_id: c10.id, name: '携帯電話料金',               is_disabled: false, order: 1
      SubCategory.create category_id: c10.id, name: '固定電話料金',               is_disabled: false, order: 2
      SubCategory.create category_id: c10.id, name: 'インターネット関連費',       is_disabled: false, order: 3
      SubCategory.create category_id: c10.id, name: '放送サービス料金',           is_disabled: false, order: 4
      SubCategory.create category_id: c10.id, name: '宅配便',                     is_disabled: false, order: 5
      SubCategory.create category_id: c10.id, name: '切手・はがき',               is_disabled: false, order: 6
      SubCategory.create category_id: c10.id, name: 'その他',                     is_disabled: false, order: 7

      SubCategory.create category_id: c11.id, name: '水道料金',                   is_disabled: false, order: 1
      SubCategory.create category_id: c11.id, name: '電気料金',                   is_disabled: false, order: 2
      SubCategory.create category_id: c11.id, name: 'ガス料金',                   is_disabled: false, order: 3
      SubCategory.create category_id: c11.id, name: 'その他',                     is_disabled: false, order: 4

      SubCategory.create category_id: c12.id, name: '家賃',                       is_disabled: false, order: 1
      SubCategory.create category_id: c12.id, name: '住宅ローン返済',             is_disabled: false, order: 2
      SubCategory.create category_id: c12.id, name: '家具',                       is_disabled: false, order: 3
      SubCategory.create category_id: c12.id, name: '家電',                       is_disabled: false, order: 4
      SubCategory.create category_id: c12.id, name: 'リフォーム',                 is_disabled: false, order: 5
      SubCategory.create category_id: c12.id, name: '住宅保険',                   is_disabled: false, order: 6
      SubCategory.create category_id: c12.id, name: 'その他',                     is_disabled: false, order: 7
      SubCategory.create category_id: c12.id, name: '非表示の内訳',               is_disabled: false, order: 8

      SubCategory.create category_id: c13.id, name: '年金',                       is_disabled: false, order: 1
      SubCategory.create category_id: c13.id, name: '所得税',                     is_disabled: false, order: 2
      SubCategory.create category_id: c13.id, name: '消費税',                     is_disabled: false, order: 3
      SubCategory.create category_id: c13.id, name: '住民税',                     is_disabled: false, order: 4
      SubCategory.create category_id: c13.id, name: '個人事業税',                 is_disabled: false, order: 5
      SubCategory.create category_id: c13.id, name: 'その他',                     is_disabled: false, order: 6

      SubCategory.create category_id: c14.id, name: '旅行',                       is_disabled: false, order: 1
      SubCategory.create category_id: c14.id, name: '住宅',                       is_disabled: false, order: 2
      SubCategory.create category_id: c14.id, name: '自動車',                     is_disabled: false, order: 3
      SubCategory.create category_id: c14.id, name: 'バイク',                     is_disabled: false, order: 4
      SubCategory.create category_id: c14.id, name: '結婚',                       is_disabled: false, order: 5
      SubCategory.create category_id: c14.id, name: '出産',                       is_disabled: false, order: 6
      SubCategory.create category_id: c14.id, name: '介護',                       is_disabled: false, order: 7
      SubCategory.create category_id: c14.id, name: '家具',                       is_disabled: false, order: 8
      SubCategory.create category_id: c14.id, name: '家電',                       is_disabled: false, order: 9
      SubCategory.create category_id: c14.id, name: 'その他',                     is_disabled: false, order: 10

      SubCategory.create category_id: c15.id, name: '仕送り',                     is_disabled: false, order: 1
      SubCategory.create category_id: c15.id, name: 'お小遣い',                   is_disabled: false, order: 2
      SubCategory.create category_id: c15.id, name: '使途不明金',                 is_disabled: false, order: 3
      SubCategory.create category_id: c15.id, name: '立替金',                     is_disabled: false, order: 4
      SubCategory.create category_id: c15.id, name: '未分類',                     is_disabled: false, order: 5
      SubCategory.create category_id: c15.id, name: '現金の引出',                 is_disabled: false, order: 6
      SubCategory.create category_id: c15.id, name: 'カードの引落',               is_disabled: false, order: 7
      SubCategory.create category_id: c15.id, name: '電子マネーにチャージ',       is_disabled: false, order: 8
      SubCategory.create category_id: c15.id, name: 'その他',                     is_disabled: false, order: 9

      Account.create user_id: current_user.id, name: '財布', is_disabled: false, order: 1
    end
end
