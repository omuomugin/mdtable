module Mdtable
  extend self

  CELL_START               = "|"
  CELL                     = "   |"
  NEW_LINE                 = "\n"
  HEADER_CELL_RIGHT_ALIGN  = "---|"
  HEADER_CELL_LEFT_ALIGN   = "--:|"
  HEADER_CELL_CENTER_ALIGN = ":-:|"

  enum Align
    Center
    Right
    Left
  end

  class TableGenerator
    def initialize(align = Align::Right)
      @align = align
    end

    def generate_md_table(row_num : Int32, column_num : Int32) : String
      generate_header(column_num) + NEW_LINE + generate_colums(row_num, generate_row(column_num))
    end

    def generate_header(column_num : Int32) : String
      title_header = CELL_START

      (1..column_num).each {
        title_header = title_header + CELL
      }

      case @align
      when Align::Center
        sub_header_cell = HEADER_CELL_CENTER_ALIGN
      when Align::Right
        sub_header_cell = HEADER_CELL_RIGHT_ALIGN
      when Align::Left
        sub_header_cell = HEADER_CELL_LEFT_ALIGN
      else
        raise "unknown align: #{@align}"
      end

      sub_header = CELL_START
      (1..column_num).each {
        sub_header = sub_header + sub_header_cell
      }

      title_header + NEW_LINE + sub_header
    end

    def generate_row(column_num : Int32) : String
      message = CELL_START

      (1..column_num).each {
        message = message + CELL
      }

      message
    end

    def generate_colums(row_num : Int32, row_message : String) : String
      colmuns = row_message

      return colmuns if row_num == 1

      (1..row_num - 1).each {
        colmuns = colmuns + NEW_LINE + row_message
      }

      colmuns
    end
  end
end
