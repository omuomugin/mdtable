require "option_parser"
require "./table_generator.cr"

VERSION = "0.1.0"

OptionParser.parse do |parser|
  parser.banner = "A Simple Markdown Tabale Generator written in Crystal"

  parser.on "-v", "--version", "Show version" do |option_flag|
    unless option_flag.empty?
      STDERR.puts "ERROR: not a valid option."
      exit(1)
    end

    puts VERSION
    exit
  end

  parser.on "-h", "--help", "Show help" do |option_flag|
    unless option_flag.empty?
      STDERR.puts "ERROR: not a valid option."
      exit(1)
    end

    puts parser
    exit
  end

  parser.on "-g", "--generate", "Generate markdown table pass row and column `-- -g 2 3`" do
    if ARGV.size != 3
      STDERR.puts "ERROR: you should pass row and column like -- -g 2 3"
      exit(1)
    end

    unless ARGV[0] == "-g" || ARGV[0] == "--generate"
      STDERR.puts "ERROR: not a valid option."
      exit(1)
    end

    generator = Mdtable::TableGenerator.new(Mdtable::Align::Center)
    puts generator.generate_md_table(ARGV[1].to_i, ARGV[2].to_i)
    exit
  end

  parser.missing_option do |option_flag|
    STDERR.puts "ERROR: #{option_flag} is missing something."
    STDERR.puts ""
    STDERR.puts parser
    exit(1)
  end

  parser.invalid_option do |option_flag|
    STDERR.puts "ERROR: #{option_flag} is not a valid option."
    STDERR.puts parser
    exit(1)
  end

  parser.unknown_args do |option_flag|
    STDERR.puts "ERROR: #{option_flag} is unknown option"
    STDERR.puts parser
    exit(1)
  end
end
