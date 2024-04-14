class GameController < ApplicationController
  def start
  end

  def result
    @player_hand = params[:hand].to_i 
    # params[:hand]はどこから渡ってくるのか？
    # app/views/game/start.html.erbのform_forで指定されたname属性の値がparamsのキーになると思ったが、app/views/game/start.html.erbにはform_forがなかった。
    # 代わりに<%= link_to value, hand: key, action: :result %>と記載されいた。これはリンクをクリックしたときに、valueとkeyをparamsに渡すという意味だと思われる。
    # なるほど。app/views/game/start.html.erbにて、リンクをクリックしたときに、パラメーターのhandキーに、配列handsのkey（0,1,2とか）が渡されている。
    # その値が、app/controllers/game_controller.rbのparams[:hand]に代入されている。
    @computer_hand = rand(3) # 0から2までのランダムな整数を生成し、インスタンス変数@computer_handに代入
    case @computer_hand - @player_hand
      when 0
        @result = "あいこです"
      when 1, -2
        @result = "あなたの勝ちです"
      else
        @result = "コンピュータの勝ちです"
    end
  end
end
