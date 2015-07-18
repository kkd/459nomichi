require "rubygems"
require 'rake'
require 'rake/clean'
require 'rake/packagetask'
require 'yaml'
require 'time'
require_relative 'lib/gpx2kml'

SOURCE = "."
DIST = "dist"
VERSION = "0.1"
PROJECT_NAME = "shikoku-no-michi"
CONFIG = {
	'gpsbabel' => "/Applications/GPSBabelFE.app/Contents/MacOS/gpsbabel",
	'out' => File.join(SOURCE, "_out"),
	'routes' => File.join(SOURCE, "routes")
}


PREFS = ["tokushima", "kouchi", "ehime","kagawa"]

# directory "#{DIST}/tokushima"
# directory "#{DIST}/kouchi"
# directory "#{DIST}/ehime"
# directory "#{DIST}/kagawa"

PREFS.each do |pref|
	directory "#{DIST}/kml/#{pref}"
	directory "#{DIST}/gpx/#{pref}"
end


GPX_FILES = FileList["src/gpx/**/*.gpx"]
GPX_FILES.exclude("~*")
GPX_FILES.exclude("*.kml")

KML_FILES = FileList["src/kml/**/*.kml"]

DIST_FILES = FileList["dist/**/*"]

CLEAN.include(DIST_FILES)
CLOBBER.include("dist")

Rake::PackageTask.new(PROJECT_NAME, VERSION) do |p|
	p.package_dir = "./#{DIST}"
	p.package_files.include("#{DIST}/gpx/**/*")
	p.package_files.include("#{DIST}/kml/**/*")
	p.package_files.exclude("#{DIST}")
	p.need_zip = true
end

desc "Default task is all_g2k."
task :default => :all_g2k


desc "Convert all gpx files to kml format files."
task :all_g2k => [:init_kml, :g2k]

# task :all_k2g => [:init_gpx, :k2g]

desc "Convert gpx file to kml file."
task :g2k => GPX_FILES.pathmap("%{^src/gpx/,dist/kml/}X.kml")

# task :k2g => KML_FILES.pathmap("%{^src/kml/,dist/gpx/}X.gpx")

# task :init => ["#{DIST}/ehime","#{DIST}/kagawa","#{DIST}/kouchi","#{DIST}/tokushima"]

task :init_kml => [
	"#{DIST}/kml/tokushima",
	"#{DIST}/kml/kouchi",
	"#{DIST}/kml/ehime",
	"#{DIST}/kml/kagawa"
]

# task :init_gpx => [
# 	"#{DIST}/gpx/tokushima",
# 	"#{DIST}/gpx/kouchi",
# 	"#{DIST}/gpx/ehime",
# 	"#{DIST}/gpx/kagawa"
# ]


rule ".kml" => [->(f){source_for_kml(f)},"dist"] do |t|
	# sh "#{CONFIG['gpsbabel']} -r -w -i gpx -f #{t.source} -x duplicate,shortname,correct -o kml,points=0,track=0,trackdirection=1 -F #{t.name}"
	convert t.source, t.name
end

# rule ".gpx" => [->(f){source_for_gpx(f)},"dist"] do |t|
# 	sh "#{CONFIG['gpsbabel']} -i kml -o gpx #{t.source} #{t.name}"
# end

def convert(gpx_file, kml_file)
	gpx2kml = Gpx2Kml.new(gpx_file, kml_file)
	gpx2kml.set_up
	gpx2kml.build 
	gpx2kml.tear_down
end

def source_for_kml(kml_file)
	GPX_FILES.detect do |f|
		f.ext("") == kml_file.pathmap("%{^dist/kml/,src/gpx/}X")
	end
end

# def source_for_gpx(gpx_file)
# 	KML_FILES.detect do |f|
# 		f.ext("") == gpx_file.pathmap("%{^dist/gpx/,src/kml/}X")
# 	end
# end
