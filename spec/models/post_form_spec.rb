require 'rails_helper'

RSpec.describe PostForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    @post = FactoryBot.build(:post_form, user_id: user.id)
  end

  describe '投稿' do
    context '投稿できる場合' do
      it 'すべて入力されていれば保存できる' do
        expect(@post).to be_valid
      end
      
      it 'movie_leftとmovie_left_embeddedが空でも保存できる' do
        @post.movie_left = ''
        @post.movie_left_embedded = ''
        expect(@post).to be_valid
      end
      
      it 'movie_rightとmovie_right_embeddedが空でも保存できる' do
        @post.movie_right = ''
        @post.movie_right_embedded = ''
        expect(@post).to be_valid
      end

      it 'talent_belongsが空でも保存できる' do
        @post.talent_belongs = ''
        expect(@post).to be_valid
      end

      it 'talent_channelが空でも保存できる' do
        @post.talent_channel = ''
        expect(@post).to be_valid
      end

      it 'talent_xが空でも保存できる' do
        @post.talent_x = ''
        expect(@post).to be_valid
      end

      it 'talent_hpが空でも保存できる' do
        @post.talent_hp = ''
        expect(@post).to be_valid
      end
    
      it 'messageが空でも保存できる' do
        @post.message = ''
        expect(@post).to be_valid
      end

      it 'talent_imageが空でも保存できる' do
        @post.talent_image = nil
        expect(@post).to be_valid
      end
    end

    context '投稿できない場合' do
      it 'movie_mainが空では保存できない' do
        @post.movie_main = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Movie main can't be blank")
      end

      it 'movie_main_embeddedが空では保存できない' do
        @post.movie_main_embedded = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Movie main embedded can't be blank")
      end

      it 'movie_main_thumbnailが空では保存できない' do
        @post.movie_main_thumbnail = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Movie main thumbnail can't be blank")
      end
  
      it 'talent_nameが空では保存できない' do
        @post.talent_name = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Talent name can't be blank")
      end

      it "talent_nameが21文字以上では登録できない" do
        @post.talent_name = 'abcdefghijklmnopqrstu'
        @post.valid?
        expect(@post.errors.full_messages).to include("Talent name is too long (maximum is 20 characters)")
      end

      it "messageが250文字を超えては登録できない" do
        @post.message =  Faker::String.random(length: 251)
        @post.valid?
        expect(@post.errors.full_messages).to include("Message is too long (maximum is 250 characters)")
      end

      it 'userが紐付いていないと保存できない' do
        @post.user_id = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end