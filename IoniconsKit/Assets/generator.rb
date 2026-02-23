#!/usr/bin/env ruby

class Ionicon
  attr_accessor :name, :code
  def initialize(name, code)
    @name = name
    @code = code
  end

  def code_for_enum_definition
     "case #{name} = \"\\u\{#{code}\}\""
  end

  def code_for_extension
    "(\"#{name}\", .#{name})"
  end
end

class SwiftGen
  def initialize
    codepoints = File.open(File.expand_path('./../ionicons.txt', __FILE__), 'r')
    @ionicons_enum_file = File.expand_path('./../../Classes/Ionicons.swift', __FILE__)
    @ionicons_enum_extension_file = File.expand_path('./../../../Example/IoniconsKit/Ionicons.swift', __FILE__)

    @icons = []
    regex = /([\w-]+): "\\(\w+)";/
    codepoints.each_line do |line|
      matched = line.match(regex)
      old_style_name = matched[1].split('-').collect(&:capitalize).join
      new_style_name = old_style_name[0].downcase + old_style_name[1..-1]
    	code = matched[2].gsub(";", "")
      @icons << Ionicon.new(new_style_name, code)
    end
  end

  def gen_enum_definition
    File.open(@ionicons_enum_file, 'w') do |file|
      file.puts <<-SWIFT
//
// THIS FILE IS GENERATED, DO NOT MODIFY BY HAND
//
// Use generate.rb to generate when ionicons.txt is updated
//
public enum Ionicons: String, CaseIterable {
    #{@icons.map(&:code_for_enum_definition).join("\n    ")}
}
SWIFT
    end
  end

  def gen_enum_extension
    File.open(@ionicons_enum_extension_file, 'w') do |file|
      file.puts <<-SWIFT
//
// THIS FILE IS GENERATED, DO NOT MODIFY BY HAND
//
// Use generate.rb to generate when ionicons.txt is updated
//
import IoniconsKit

extension Ionicons {
    static let tuples: [(String, Ionicons)] =
      [
        #{@icons.map(&:code_for_extension).join(",\n        ") }
      ]
}
SWIFT
    end
  end
end

if __FILE__ == $0
    gen = SwiftGen.new
    gen.gen_enum_definition()
    gen.gen_enum_extension()
end
