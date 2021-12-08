RSpec.describe Greengrocer do
  # 単体テスト2 正常系(Greengrocerクラスのインスタンス生成)
  describe ".initialize" do
    let(:product_params) do
      [
        { name: "トマト", price: 100 },
        { name: "きゅうり", price: 200 }
      ]
    end
    let(:greengrocer) { Greengrocer.new(product_params) }
    let(:products) { greengrocer.products }
    context "インスタンスが生成されたとき" do
      it "@productsの要素の数が,product_paramsの要素の数と等しいこと" do
        expect(products.size).to eq 2
      end

      it "@productsの最初の要素の名前が,product_paramsの最初の要素の名前と等しいこと" do
        expect(products[0].name).to eq "トマト"
      end

      it "@productsの最初の要素の名前が,product_paramsの最初の要素の金額と等しいこと" do
        expect(products[0].price).to eq 100
      end
    end
  end

  # 単体テスト3 正常系(register_productメソッド)
  describe ".register_product" do
    let(:product_params) do
      [
        { name: "トマト", price: 100 },
        { name: "きゅうり", price: 200 }
      ]
    end
    let(:greengrocer) { Greengrocer.new(product_params) }
    let(:products) { greengrocer.products }
    let(:adding_product_params) do
      [
        { name: "ごぼう", price: 250 },
        { name: "れんこん", price: 350 }
      ]
    end
    it "@productsの要素の数が,「product_paramsとadding_product_paramsの要素の数の和」と等しいこと" do
      greengrocer.register_product(adding_product_params)
      expect(greengrocer.products.size).to eq 4
    end
    it "@productsの最後の要素の名前が,adding_product_paramsの最後の要素の名前と等しいこと" do
      greengrocer.register_product(adding_product_params)
      expect(greengrocer.products[-1].name).to eq "れんこん"
    end
    it "@productsの最後の要素の名前が,adding_product_paramsの最後の要素の金額と等しいこと" do
      greengrocer.register_product(adding_product_params)
      expect(greengrocer.products[-1].price).to eq 350
    end
  end
end