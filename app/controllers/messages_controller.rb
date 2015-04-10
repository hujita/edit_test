#coding: utf-8

class MessagesController < ApplicationController
  def index
  	redirect_to action: "show"
  end

  def test
    @aaa = "test"

  end

  def show
  	@messages = MessageLog.order("id DESC").limit("10")
  end
  
  def post
#   インスタンス変数に代入
    @current_time = Time.now.to_s
  	@sent_message = params[:sent_message]
#   IDを設定する
#    if MessageLog.nil?
#      messages_id = 1
#    else
#      messages_id = MessageLog.maximum("id") + 1
#    end
     messages_id = MessageLog.count + 1
#   データベースに記録する    
    message_log = MessageLog.new(params[:sent_message])
    message_log.time = @current_time
    message_log.id = messages_id

    message_log.save
  end

  def destroy
  	message_log = MessageLog.find(params[:id])
  	message_log.destroy
  end
end

#####   memo   #####
#def show
#    if page == 1
#      @messages = MessageLog.order("id DESC").limit("10")
#    elsif page == 2
#      @messages = MessageLog.order("id DESC").offset("11").limit("10")
#    end

#    messages_last_id = MessageLog.maximum("id")
#    @messages_new_id = messages_last_id + 1

#  def show_2
#    @messages = MessageLog.order("id DESC").offset("11").limit("10")
#  end

#def post
#  1.  試作
#    count = MessageLog.count
#    if count == 0
#      messages_last_id = 0
#    else
#      messages_last_id = MessageLog.maximum("id")
#    end
#  2.  1のブラッシュアップ
#    if MessageLog.count == 0
#      messages_last_id = 0
#    else
#      messages_last_id = MessageLog.maximum("id")
#    end
#  3.　   失敗
#    if MessageLog.null?
#      message_log.id = 1
#    else
#     message_log.id = MessageLog.find(:all).last([:ID]+1)
#    end
#    message_log.id = @messages_new_id
#  4.　　　3の成功作
#    if MessageLog.nil?
#      messages_last_id = 0
#    else
#      messages_last_id = MessageLog.maximum("id")
#    end
#    @messages_new_id = messages_last_id + 1
