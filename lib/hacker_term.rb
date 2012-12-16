require 'curses'

# HACKER NEWS
# Arrow keys to select | Enter to open | F5 to refresh
# rank | title                   | url         | score | comments
# 1    | xxxxxxxxxxxxxxxxxxxx... | xxxxxxxx... | 230   | 8
# 2    | xxxxxxxxxxxxxxxxxxxx... | xxxxxxxx... | 29    | 0
# 3    | xxxxxxxxxxxxxxxxxxxx... | xxxxxxxx... | 2     | 2
# 4    | xxxxxxxxxxxxxxxxxxxx... | xxxxxxxx... | 45    | 6
# 5    | xxxxxxxxxxxxxxxxxxxx... | xxxxxxxx... | 25    | 1
# 6    | xxxxxxxxxxxxxxxxxxxx... | xxxxxxxx... | 98    | 80
# 7    | xxxxxxxxxxxxxxxxxxxx... | xxxxxxxx... | 280   | 5
# Sorted by: score | Mean: x | Median: x | Mode x 
# Q:quit | R:sort/rank | T: sort/title | S:sort/score | C: sort/ comment  

module HackerTerm
  class UI

    include Curses

    

    def initialize(config={})
      if can_change_color?
        start_color
        # foreground / background colours
        init_pair(0, COLOR_WHITE, COLOR_BLACK)
        init_pair(1, COLOR_WHITE, COLOR_BLUE)
        init_pair(2, COLOR_WHITE, COLOR_RED)
      end

      @column_headers = config[:column_headers]
      @total_width = cols
      @total_height = lines
      @padding_left = 2
      @buff = []

    end

    def output_line(line_num, data)
      setpos line_num, 0
      padding_right = @total_width - data.length - @padding_left
      addstr((" " * @padding_left) + data + (" " * padding_right))
    end

    def draw_header(col_headers)
      attrset(color_pair(1))
      setpos(0, 0)
      output_line(0, "HACKER NEWS (Thanks to http://hndroidapi.appspot.com/)") 
      output_line(1, "Arrow keys to select | Enter to open | F5 to refresh")
    end

    def draw_footer(sorted_by, stats, key_options)
      
    end

    def draw_item_line(rank, data)
    end

    def show()
      draw_header(@column_headers)
      getch
      close_screen
    end
  end
end


