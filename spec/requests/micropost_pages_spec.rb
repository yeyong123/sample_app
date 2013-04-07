require 'spec_helper'

describe "MicropostPages" do                 #微博页面的描述
   subject { page }                          #在页面科目
   let(:user) { FactoryGirl.create(:user) }  #让用户自动创建一个用户
   before { sign_in user }                   #首先用户必须登录

 describe "micropost creation" do             #微博创建的描述
  before { visit root_path }                  #用户登录后，先去首页
  
 describe "with invalid information" do       #关于无效信息的描述
  it "should not create a micropost" do       #它不应该创建一个微博
    expect { click_button "Post" }.not_to change(Micropost, :count) #点击‘Post提交按钮不应该发生改变微博的总数
  end

  describe "error messages" do                  #错误信息的描述
    before { click_button "Post" }              #首先点击’Post 提交按钮
    it { should have_content('error') }         #它应该出现一个错误的内容
  end
end

describe "with valid information" do            #关于有效信息的描述
  before { fill_in 'micropost_content', with: "lorem ipsum"}   #首先先填写微博内容,可以的测试的文章“Lorem ipsum"
  it "should create a micropost" do             #它应该创建一篇微博
    expect { click_button "Post"}.to change(Micropost, :count).by(1) #点击‘Post’提交按钮应该发生微博数量加一个
    end
   end
  end

  describe "micropost destruction" do              #微博删除的描述
    before { FactoryGirl.create(:micropost, user: user) }   #首先在有微博的用户那里

    describe "as correct user" do                  #合法正确的用户创建的微博
      before { visit root_path }                   #在主页删除
      it "should deletea micropost" do             #它要删除微博
        expect { click_link "delete" }.to change(Micropost, :count).by(-1) #点击删除按钮，发生微博数量少一个
      end
    end
  end
end
