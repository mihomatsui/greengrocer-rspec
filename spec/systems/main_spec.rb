describe ".greengrocer_program" do
  
   context "最初のidの商品が4個のとき" do
     it "正しい合計金額を含む,期待する表示がされること" do
       # 商品データ
        product_params1 = [
          { name: "トマト", price: 100 },
          { name: "きゅうり", price: 200 },
          { name: "玉ねぎ", price: 300 },
          { name: "なす", price: 400 }
        ]
        # product_params1の商品を持つ八百屋の開店
        greengrocer1 = Greengrocer.new(product_params1)
        # 追加商品データ
        adding_product_params1 = [
          { name: "ごぼう", price: 250 },
          { name: "れんこん", price: 350 }
        ]
        # 商品を登録（adding_product_params1 の商品を追加）
        greengrocer1.register_product(adding_product_params1)

        # 長いので代入
        products1 = greengrocer1.products
        # お客さんの来店
        user = User.new
        # 商品を表示
        greengrocer1.disp_products
        # 商品を選択
        correct_product_id_input = "#{products1.first.id}\n"
        allow(ARGF).to receive(:gets).and_return correct_product_id_input
        user.choose_product(products1)
        # 個数を質問
        greengrocer1.ask_quantity(user.chosen_product)
        # 個数を決定
        correct_quantity_input = "4\n"
        allow(ARGF).to receive(:gets).and_return correct_quantity_input
        user.decide_quantity
        # 合計金額を計算
        total_price_msg = "合計金額は400円です。"
        thank_msg = "お買い上げありがとうございました！"
        expect {greengrocer1.calculate_charges(user) }.to output("#{total_price_msg}\n#{thank_msg}\n").to_stdout
     end
   end

   context "最後のidの商品が4個のとき" do
     it "正しい合計金額を含む,期待する表示がされること" do
       
     end
   end

   context "最初のidの商品が5個のとき" do
     it "割引した正しい合計金額を含む,期待する表示がされること" do
       
     end
   end

   context "最後のidの商品が5個のとき" do
     it "割引した正しい合計金額を含む,期待する表示がされること" do
       
     end
   end
end