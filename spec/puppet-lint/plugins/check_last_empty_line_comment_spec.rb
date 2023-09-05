require 'spec_helper'

describe 'last_empty_line_comment' do
  context 'valid code' do
    let(:code) do
      <<~CODE
        # @summary
        #   some class
        #
        # @param mandatory
        #   A mandatory parameter
        #   with two lines
        #
        # @param withdefault
        #   A parameter with a default value
        #
        #   A two paragraph description
        #
        # @param optional
        #   An optional parameter
        #
        class my_class (
            String $mandatory,
            Boolean $withdefault = false,
            Optional[String] $optional = undef
        ) {}
      CODE
    end

    it 'should not detect any problems' do
      expect(problems).to have(0).problems
    end
  end

  context "missing last empty line" do
    let(:code) do
      <<~CODE
        # @summary
        #   some class
        #
        # @param mandatory
        #   A mandatory parameter
        #   with two lines
        #
        # @param withdefault
        #   A parameter with a default value
        #
        #   A two paragraph description
        #
        # @param optional
        #   An optional parameter
        class my_class (
            String $mandatory,
            Boolean $withdefault = false,
            Optional[String] $optional = undef
        ) {}
      CODE
    end

    it 'should not detect any problems' do
      expect(problems).to have(1).problems
    end
  end
end