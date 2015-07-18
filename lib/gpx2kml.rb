require 'nokogiri'

class Gpx2Kml
	attr_accessor :gpx_file
	attr_accessor :kml_file

	RANGE 		= 500
	TILT 			= 45
	HEADING 	= 0
	LINE_WIDTH = 4

	COLORS = {
		"red" => "C81400FF",
		"green" => "C878FF00",
		"blue" => "C8FF7800",
		"cyan" => "C8F0FF14",
		"orange" => "C81478FF",
		"dark_green" => "C8008C14",
		"purple" => "C8FF7878",
		"pink" => "C8A078F0",
		"brown" => "C8143C96",
		"dark_blue" => "C8F01414"
	}

	ROUTE_COLORS = {
		"red" => "961400FF",
		"green" => "9678FF00",
		"blue" => "96FF7800",
		"cyan" => "96F0FF14",
		"orange" => "961478FF",
		"dark_green" => "96008C14",
		"purple" => "96FF7878",
		"pink" => "96A078F0",
		"brown" => "96143C96",
		"dark_blue" => "96F01414"
	}

	def initialize(gpx_file=nil, kml_file=nil)
		@gpx_file = gpx_file
		@kml_file = kml_file
		@gpx = nil
		@kml = nil
	end


	def set_up
		begin
			f = File.open @gpx_file
			@gpx = Nokogiri::XML(f)
			f.close

			@kml = Nokogiri::XML::Document.new
		rescue StandardError => e
			puts e.message			
		end
	end

	def build
		builder = Nokogiri::XML::Builder.new(:encoding => 'utf-8') do |xml|
			xml.kml(:xmlns => 'http://opengis.net/kml/2.2',
							 'xmlns:gx'.to_sym => 'http://www.google.com/kml/ext/2.2',
							 'xmlns:kml'.to_sym => 'http://www.opengis.net/kml/2.2',
							 'xmlns:atom'.to_sym => 'http://www.w3.org/2005/Atom') {
				xml.Document() {
					xml.name() {
					 xml.cdata @gpx_file
					}
					xml.description() {
						xml.cdata "Converted using gpx2kml.rb"
					}
					xml.visibility "1"
					xml.open_ "1"

					COLORS.each do |key, value|
						xml.Style(:id => key) {
							xml.LineStyle() {
								xml.color value
								xml.width LINE_WIDTH
							}
						}
					end

					ROUTE_COLORS.each do |key, value|
						xml.Style(:id => "route_#{key}") {
							xml.LineStyle() {
								xml.color value
								xml.width LINE_WIDTH
							}
						}
					end

					xml.Folder() {
						xml.name "Waypoints"
						xml.description "A list of waypoints"
						xml.visibility "1"
						xml.open_ "0"

						# puts @gpx	
						@gpx.search("wpt").each do |wpt|
							xml.Placemark() {
								xml.name wpt.search("name")[0].content
								xml.visibility "1"
								xml.open "0"
								xml.description "no info"
								xml.LookAt() {
									xml.longitude wpt['lon']
									xml.latitude wpt['lat']
									xml.range RANGE
									xml.tilt TILT
									xml.heading HEADING
								}
								xml.Point() {
									elevation = wpt.search("ele")[0]
									xml.coordinates "#{wpt['lon']},#{wpt['lat']},#{elevation.content}"
								}
							}
						end
					}
					xml.Folder() {
						xml.name "Tracks"
						xml.description "A list of tracks"
						xml.visibility 1
						xml.open_ 0

						colors = COLORS.keys
						i = 0
						@gpx.search("trk").each do |trk|
							xml.Placemark() {
								xml.visibility 0
								xml.open_ 0

								i = 0 if i > colors.size
								xml.styleUrl "##{colors[i]}"
								xml.name trk.search("name")[0].content
								number = trk.search("number")[0].content
								xml.description "Track No. #{number}"
								xml.LineString() {
									xml.extrude true
									xml.tessellate true
									xml.altitudeMode "clampToGround"

									coordinates = []
									trk.search("trkpt").each do |trkpt|
										coordinate = "#{trkpt['lon']},#{trkpt['lat']},#{trkpt.search("ele")[0].content}"
										coordinates << coordinate
									end
									xml.coordinates coordinates.join(" ")
								}
								i = i + 1
							}
						end

					}

					xml.LookAt() {

					}
				}
			}
		end
		@kml = builder.doc
	end

	def exec
		setup_kml
		setup_doc
	end

	def setup_kml
	end


	def tear_down
		f = open(@kml_file, "w")
		f << @kml.to_xml
		f.close
	end


	def new_node(name, doc=nil)
		doc = @kml if doc.nil?
		node = Nokogiri::XML::Node.new name, doc
	end
end

if $0 == __FILE__ 
	gpx2kml = Gpx2Kml.new('ehime_all.gpx', 'ehime_all.kml')
	gpx2kml.set_up
	gpx2kml.build 
	# gpx2kml.exec
	gpx2kml.tear_down
end

