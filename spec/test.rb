require '../lib/log_parser.rb'
describe LogParser do
  context 'webpages with most page views' do
    let(:log_parser) { LogParser.new(File.dirname(__FILE__) + '/webserver_test.log') }
    it 'should return an hash' do
      expect(log_parser.calculate_views).to be_a Hash
    end
    it 'should list webpages with most page views ordered from most pages views to less page views' do
      target = { '/help_page/1' => 6,
                 '/about/2' => 3,
                 '/index' => 3,
                 '/about' => 2 }
      expect(log_parser.calculate_views).to eq target
    end
    it 'should have the most viewed page as first element' do
      expect(log_parser.calculate_views.keys.first).to eq '/help_page/1'
    end
  end
  context 'list of webpages with most unique page views' do
    let(:log_parser) { LogParser.new(File.dirname(__FILE__) + '/webserver_test.log') }
    it 'should return an hash' do
      expect(log_parser.calculate_unique_views).to be_a Hash
    end
    it 'should list webpages with most unique page views ordered from most pages views to less page views' do
      target = { '/help_page/1' => 5,
                 '/index' => 3,
                 '/about' => 2,
                 '/about/2' => 2 }
      expect(log_parser.calculate_unique_views).to eq target
    end
    it 'should have the most viewed page as first element' do
      expect(log_parser.calculate_unique_views.keys.first).to eq '/help_page/1'
    end
  end
end
