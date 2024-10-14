require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    user = FactoryBot.create(:user)
    @post = FactoryBot.build(:post, user_id: user.id)
  end

  describe '投稿' do
    context '投稿できる場合' do
      it 'すべて入力されていれば保存できる' do
        expect(@post).to be_valid
      end
      
      it 'movie_leftが空でも保存できる' do
        @post.movie_left = ''
        expect(@post).to be_valid
      end
      
      it 'movie_rightが空でも保存できる' do
        @post.movie_right = ''
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

      it 'userが紐付いていないと保存できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('User must exist')
      end
    end
  end
end