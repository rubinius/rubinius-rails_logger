require File.expand_path("../../lib/rubinius/rails_logger", __FILE__)

describe Rubinius::RailsLogger do
  describe ".new" do
    it "accepts an application name" do
      expect(Rubinius::RailsLogger.new("app-name")).to be_an_instance_of(Rubinius::RailsLogger)
    end
  end
end

describe Rubinius::RailsLogger do
  let(:logger) { Rubinius::RailsLogger.new "app-name" }

  describe "#add" do
    it 'logs program name if no messge is given' do
      expect(logger).to receive(:log).with(:info, 'app-name')
      logger.add(:info)
    end

    context 'message is sent' do
      let(:message) { 'this is a message' }
      it 'logs message argument if given' do
        expect(logger).to receive(:log).with(:info, message)
        logger.add(:info, message)
      end

      it 'logs message block if given' do
        expect(logger).to receive(:log).with(:info, message)
        logger.add(:info) { message }
      end

      it 'logs message argument if both argument and block are passed' do
        expect(logger).to receive(:log).with(:info, message)
        logger.add(:info, message) { 'this is a block message' }
      end
    end
  end

  # The predicates are hard-coded until Rubinius 2.5.4 or 2.6.0
  describe "#fatal?" do
    it { expect(logger.fatal?).to be(false) }
  end

  describe "#error?" do
    it { expect(logger.error?).to be(false) }
  end

  describe "#warn?" do
    it { expect(logger.warn?).to be(true) }
  end

  describe "#info?" do
    it { expect(logger.info?).to be(false) }
  end

  describe "#debug?" do
    it { expect(logger.debug?).to be(false) }
  end

  describe "#formatter" do
    it { expect(logger.formatter).to be(nil) }
  end

  describe "#formatter=" do
    it { expect(logger.formatter = "xyz").to eq("xyz") }
  end

  describe "#level" do
    it { expect(logger.level).to eq(:warn) }
  end

  describe "#level=" do
    it { expect(logger.level = :info).to eq(:info) }
  end

  describe "#progname" do
    it { expect(logger.progname).to be(nil) }
  end

  describe "#progname=" do
    it { expect(logger.progname = "my-app").to eq("my-app") }
  end

  describe "#fatal" do
    it { expect(logger.fatal "message").to be(nil) }
    it { expect(logger.fatal { "message" }).to be(nil) }
  end

  describe "#error" do
    it { expect(logger.error "message").to be(nil) }
    it { expect(logger.error { "message" }).to be(nil) }
  end

  describe "#warn" do
    it { expect(logger.warn "message").to be(nil) }
    it { expect(logger.warn { "message" }).to be(nil) }
  end

  describe "#info" do
    it { expect(logger.info "message").to be(nil) }
    it { expect(logger.info { "message" }).to be(nil) }
  end

  describe "#debug" do
    it { expect(logger.debug "message").to be(nil) }
    it { expect(logger.debug { "message" }).to be(nil) }
  end
end
