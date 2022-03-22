require 'rails_helper'

RSpec.describe Client, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '正常系の機能' do
    context '登録する' do
      it '正しく登録できること' do
        client Client.new(
          client_number: 3,
          client_name:'稲葉浩志',
          postal_code:'708-0000',
          address:'岡山県津山市',
          manager:'稲葉浩志広報',
          phone_number:'080-0000-0000'
        )

        expect(client).to be_valid

        client.save

        entered_client = Client.find(1);

        expect(entered_client.client_number).to eq(3)
        expect(entered_client.client_name).to eq('稲葉浩志')
        expect(entered_client.postal_code).to eq('708-0000')
        expect(entered_client.address).to eq('岡山県津山市')
        expect(entered_client.manager).to eq('稲葉浩志広報')
        expect(entered_client.phone_number).to eq('080-0000-0000')
      end
    end
  end
end
