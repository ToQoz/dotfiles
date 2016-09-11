#!/usr/bin/env ruby

require "erb"
require "base64"

class Terminal
  BPLIST = "bplist00\xD4\x01\x02\x03\x04\x05\x06\x15\x16X$versionX$objectsY$archiverT$top\x12\x00\x01\x86\xA0\xA3\a\b\x0FU$null\xD3\t\n\v\f\r\x0EUNSRGB\\NSColorSpaceV$classO\x10+%.10f %.10f %.10f %.1f\x00\x10\x01\x80\x02\xD2\x10\x11\x12\x13Z$classnameX$classesWNSColor\xA2\x12\x14XNSObject_\x10\x0FNSKeyedArchiver\xD1\x17\x18Troot\x80\x01\b\x11\x1A#-27;AHN[b\x90\x92\x94\x99\xA4\xAD\xB5\xB8\xC1\xD3\xD6\xDB\x00\x00\x00\x00\x00\x00\x01\x01\x00\x00\x00\x00\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xDD"

  def initialize xresources
    @xresources = {}

    # https://wiki.archlinux.org/index.php/X_resources
    xresources.split("\n").each do |l|
      if /^\*/ =~ l
        l.gsub(/^\*(.+): *#(.+)$/) {
          @xresources[$1] = hex2rgb($2)
        }
      end
    end
  end

  def foreground; e @xresources["foreground"]; end
  def background; e @xresources["background"]; end

  def selection
    cursor
  end
  def cursor
    e [
      @xresources["foreground"][0],
      @xresources["foreground"][1],
      @xresources["foreground"][2],
      0.6
    ]
  end

  def black; e @xresources["color0"]; end
  def b_black; e @xresources["color8"]; end

  def red; e @xresources["color1"]; end
  def b_red; e @xresources["color9"]; end

  def green; e @xresources["color2"]; end
  def b_green; e @xresources["color10"]; end

  def yellow; e @xresources["color3"]; end
  def b_yellow; e @xresources["color11"]; end

  def blue; e @xresources["color4"]; end
  def b_blue; e @xresources["color12"]; end

  def magenta; e @xresources["color5"]; end
  def b_magenta; e @xresources["color13"]; end

  def cyan; e @xresources["color6"]; end
  def b_cyan; e @xresources["color14"]; end

  def gray; e @xresources["color7"]; end
  def b_gray; e @xresources["color15"]; end

  private

  def hex2rgb hex
    hex.scan(/../).map { |c| c.to_i(16).to_f / 255 }
  end

  def encode c
    raise RuntimeError.new("#{c} is not rgb/rgba color") if c.nil?

    color = c.dup

    case c.size
    when 3
      color.push(1.0)
    when 4
      # Nop
    else
      raise RuntimeError.new("#{color} is not rgb/rgba color")
    end

    STDERR.puts(*color)

    Base64.encode64(sprintf(BPLIST, *color)).gsub("\n", "\n\t").strip
  end
  alias_method :e, :encode
end

@scheme = "Hybrid"
@termcolors = Terminal.new(File.read(File.expand_path("~/.Xresources")))

tmpl = File.read(File.expand_path("./tmpl.erb"))
r = ERB.new(tmpl).result(binding)
terminal_filepath = ARGV[0]
if !terminal_filepath
  STDERR.puts "you should specify .terminal filepath to export"
  exit 1
end
File.open(File.expand_path(terminal_filepath), "w+") { |f|
  f.write(r)
}
