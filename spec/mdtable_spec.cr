require "./spec_helper"

describe "Mdtable::TableGenerator" do
  describe "#generate_header" do
    it "correctly print header with 1 column" do
      create_test_obj.generate_header(1).should eq "|   |\n|---|"
    end

    it "correctly print header with 2 column" do
      create_test_obj.generate_header(2).should eq "|   |   |\n|---|---|"
    end

    it "correctly print header with 5 column" do
      create_test_obj.generate_header(5).should eq "|   |   |   |   |   |\n|---|---|---|---|---|"
    end
  end

  describe "#generate_row" do
    it "correctly print row with 1 column" do
      create_test_obj.generate_row(1).should eq "|   |"
    end

    it "correctly print row with 2 column" do
      create_test_obj.generate_row(2).should eq "|   |   |"
    end

    it "correctly print row with 5 column" do
      create_test_obj.generate_row(5).should eq "|   |   |   |   |   |"
    end
  end

  describe "#generate_colums" do
    it "correctly print column with 1 row for '|   |'" do
      create_test_obj.generate_colums(1, "|   |").should eq "|   |"
    end

    it "correctly print column with 2 row for '|   |   |'" do
      create_test_obj.generate_colums(2, "|   |   |").should eq "|   |   |\n|   |   |"
    end

    it "correctly print column with 5 row for '|   |   |'" do
      create_test_obj.generate_colums(5, "|   |   |").should eq "|   |   |\n|   |   |\n|   |   |\n|   |   |\n|   |   |"
    end
  end
end
