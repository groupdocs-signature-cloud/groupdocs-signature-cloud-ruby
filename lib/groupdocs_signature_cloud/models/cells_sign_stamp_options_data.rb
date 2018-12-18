 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="cells_sign_stamp_options_data.rb">
 #   Copyright (c) 2003-2018 Aspose Pty Ltd
 # </copyright>
 # <summary>
 #  Permission is hereby granted, free of charge, to any person obtaining a copy
 #  of this software and associated documentation files (the "Software"), to deal
 #  in the Software without restriction, including without limitation the rights
 #  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 #  copies of the Software, and to permit persons to whom the Software is
 #  furnished to do so, subject to the following conditions:
 #
 #  The above copyright notice and this permission notice shall be included in all
 #  copies or substantial portions of the Software.
 #
 #  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 #  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 #  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 #  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 #  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 #  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 #  SOFTWARE.
 # </summary>
 # --------------------------------------------------------------------------------------------------------------------
 #

require 'date'

module GroupDocsSignatureCloud
  # Represents the Stamp Signature Options for Cells Documents.
  class CellsSignStampOptionsData

    # Gets or sets worksheet number for signing. Minimal value is 1.
    attr_accessor :document_page_number

    # Page Options to specify pages to be verified.
    attr_accessor :pages_setup

    # Internal property that specify the name of Options.
    attr_accessor :options_type

    # Gets or sets the signature image file name. This property is used only if ImageStream is not specified.
    attr_accessor :image_guid

    # Gets or sets the position of the left edge of the Signature area in pixels. This property is mutually exclusive with Column property. If Left property is set ColumnNumber will be reset to 0.
    attr_accessor :left

    # Gets or sets the position of the top edge of the Signature area in pixels. This property is mutually exclusive with Row property. If Top property is set RowNumber will be reset to 0.
    attr_accessor :top

    # Width of Signature on Document Page in Measure values (pixels or percent see  SizeMeasureType).
    attr_accessor :width

    # Height of Signature on Document Page in Measure values (pixels or percent see  SizeMeasureType).
    attr_accessor :height

    # Measure type (pixels or percent) for Left and Top properties.
    attr_accessor :location_measure_type

    # Measure type (pixels or percent) for Width and Height properties.
    attr_accessor :size_measure_type

    # Rotation angle of signature on document page (clockwise).
    attr_accessor :rotation_angle

    # Horizontal alignment of signature on document page.
    attr_accessor :horizontal_alignment

    # Vertical alignment of signature on document page.
    attr_accessor :vertical_alignment

    # Gets or sets the space between Sign and worksheet edges. (works ONLY if horizontal or vertical alignment are specified).
    attr_accessor :margin

    # Gets or sets the measure type (pixels or percent) for Margin.
    attr_accessor :margin_measure_type

    # Gets or sets the additional opacity for sign image (value from 0.0 (clear) through 1.0 (opaque)). By default the value is 1.0.
    attr_accessor :opacity

    # Put signature on all document pages.
    attr_accessor :sign_all_pages

    # List of Outer Lines rendered as concentric circles.
    attr_accessor :outer_lines

    # List of Inner Lines rendered as set of rectangles.
    attr_accessor :inner_lines

    # Gets or sets the background color of signature.
    attr_accessor :background_color

    # Gets or sets the signature background brush. Value by default is null.  When property has a value it is used instead BackgroundBrush property.
    attr_accessor :background_brush

    # Gets or sets the background color crop type of signature.
    attr_accessor :background_color_crop_type

    # Gets or sets the background image crop type of signature.
    attr_accessor :background_image_crop_type

    # Gets or sets worksheet number for signing. DocumentPageNumber parameter contains the same value.
    attr_accessor :sheet_number

    # Gets or sets the top row number of signature (min value is 0). Top parameter contains the same value.
    attr_accessor :row_number

    # Gets or sets the left column number of signature (min value is 0). Left parameter contains the same value.
    attr_accessor :column_number
    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'document_page_number' => :'DocumentPageNumber',
        :'pages_setup' => :'PagesSetup',
        :'options_type' => :'OptionsType',
        :'image_guid' => :'ImageGuid',
        :'left' => :'Left',
        :'top' => :'Top',
        :'width' => :'Width',
        :'height' => :'Height',
        :'location_measure_type' => :'LocationMeasureType',
        :'size_measure_type' => :'SizeMeasureType',
        :'rotation_angle' => :'RotationAngle',
        :'horizontal_alignment' => :'HorizontalAlignment',
        :'vertical_alignment' => :'VerticalAlignment',
        :'margin' => :'Margin',
        :'margin_measure_type' => :'MarginMeasureType',
        :'opacity' => :'Opacity',
        :'sign_all_pages' => :'SignAllPages',
        :'outer_lines' => :'OuterLines',
        :'inner_lines' => :'InnerLines',
        :'background_color' => :'BackgroundColor',
        :'background_brush' => :'BackgroundBrush',
        :'background_color_crop_type' => :'BackgroundColorCropType',
        :'background_image_crop_type' => :'BackgroundImageCropType',
        :'sheet_number' => :'SheetNumber',
        :'row_number' => :'RowNumber',
        :'column_number' => :'ColumnNumber'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'document_page_number' => :'Integer',
        :'pages_setup' => :'PagesSetupData',
        :'options_type' => :'String',
        :'image_guid' => :'String',
        :'left' => :'Integer',
        :'top' => :'Integer',
        :'width' => :'Integer',
        :'height' => :'Integer',
        :'location_measure_type' => :'String',
        :'size_measure_type' => :'String',
        :'rotation_angle' => :'Integer',
        :'horizontal_alignment' => :'String',
        :'vertical_alignment' => :'String',
        :'margin' => :'PaddingData',
        :'margin_measure_type' => :'String',
        :'opacity' => :'Float',
        :'sign_all_pages' => :'BOOLEAN',
        :'outer_lines' => :'Array<StampLineData>',
        :'inner_lines' => :'Array<StampLineData>',
        :'background_color' => :'Color',
        :'background_brush' => :'BrushData',
        :'background_color_crop_type' => :'String',
        :'background_image_crop_type' => :'String',
        :'sheet_number' => :'Integer',
        :'row_number' => :'Integer',
        :'column_number' => :'Integer'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.key?(:'DocumentPageNumber')
        self.document_page_number = attributes[:'DocumentPageNumber']
      end

      if attributes.key?(:'PagesSetup')
        self.pages_setup = attributes[:'PagesSetup']
      end

      if attributes.key?(:'OptionsType')
        self.options_type = attributes[:'OptionsType']
      end

      if attributes.key?(:'ImageGuid')
        self.image_guid = attributes[:'ImageGuid']
      end

      if attributes.key?(:'Left')
        self.left = attributes[:'Left']
      end

      if attributes.key?(:'Top')
        self.top = attributes[:'Top']
      end

      if attributes.key?(:'Width')
        self.width = attributes[:'Width']
      end

      if attributes.key?(:'Height')
        self.height = attributes[:'Height']
      end

      if attributes.key?(:'LocationMeasureType')
        self.location_measure_type = attributes[:'LocationMeasureType']
      end

      if attributes.key?(:'SizeMeasureType')
        self.size_measure_type = attributes[:'SizeMeasureType']
      end

      if attributes.key?(:'RotationAngle')
        self.rotation_angle = attributes[:'RotationAngle']
      end

      if attributes.key?(:'HorizontalAlignment')
        self.horizontal_alignment = attributes[:'HorizontalAlignment']
      end

      if attributes.key?(:'VerticalAlignment')
        self.vertical_alignment = attributes[:'VerticalAlignment']
      end

      if attributes.key?(:'Margin')
        self.margin = attributes[:'Margin']
      end

      if attributes.key?(:'MarginMeasureType')
        self.margin_measure_type = attributes[:'MarginMeasureType']
      end

      if attributes.key?(:'Opacity')
        self.opacity = attributes[:'Opacity']
      end

      if attributes.key?(:'SignAllPages')
        self.sign_all_pages = attributes[:'SignAllPages']
      end

      if attributes.key?(:'OuterLines')
        if (value = attributes[:'OuterLines']).is_a?(Array)
          self.outer_lines = value
        end
      end

      if attributes.key?(:'InnerLines')
        if (value = attributes[:'InnerLines']).is_a?(Array)
          self.inner_lines = value
        end
      end

      if attributes.key?(:'BackgroundColor')
        self.background_color = attributes[:'BackgroundColor']
      end

      if attributes.key?(:'BackgroundBrush')
        self.background_brush = attributes[:'BackgroundBrush']
      end

      if attributes.key?(:'BackgroundColorCropType')
        self.background_color_crop_type = attributes[:'BackgroundColorCropType']
      end

      if attributes.key?(:'BackgroundImageCropType')
        self.background_image_crop_type = attributes[:'BackgroundImageCropType']
      end

      if attributes.key?(:'SheetNumber')
        self.sheet_number = attributes[:'SheetNumber']
      end

      if attributes.key?(:'RowNumber')
        self.row_number = attributes[:'RowNumber']
      end

      if attributes.key?(:'ColumnNumber')
        self.column_number = attributes[:'ColumnNumber']
      end

	  
	  if !((defined? options_type) == nil)
        self.options_type = "CellsSignStampOptionsData"
      end
	  
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = []
      if @document_page_number.nil?
        invalid_properties.push("invalid value for 'document_page_number', document_page_number cannot be nil.")
      end

      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @document_page_number.nil?
      location_measure_type_validator = EnumAttributeValidator.new('String', ["Pixels", "Percents", "Millimeters"])
      return false unless location_measure_type_validator.valid?(@location_measure_type)
      size_measure_type_validator = EnumAttributeValidator.new('String', ["Pixels", "Percents", "Millimeters"])
      return false unless size_measure_type_validator.valid?(@size_measure_type)
      horizontal_alignment_validator = EnumAttributeValidator.new('String', ["Default", "None", "Left", "Center", "Right"])
      return false unless horizontal_alignment_validator.valid?(@horizontal_alignment)
      vertical_alignment_validator = EnumAttributeValidator.new('String', ["Default", "None", "Top", "Center", "Bottom"])
      return false unless vertical_alignment_validator.valid?(@vertical_alignment)
      margin_measure_type_validator = EnumAttributeValidator.new('String', ["Pixels", "Percents", "Millimeters"])
      return false unless margin_measure_type_validator.valid?(@margin_measure_type)
      background_color_crop_type_validator = EnumAttributeValidator.new('String', ["None", "OuterArea", "MiddleArea", "InnerArea"])
      return false unless background_color_crop_type_validator.valid?(@background_color_crop_type)
      background_image_crop_type_validator = EnumAttributeValidator.new('String', ["None", "OuterArea", "MiddleArea", "InnerArea"])
      return false unless background_image_crop_type_validator.valid?(@background_image_crop_type)
      return true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] location_measure_type Object to be assigned
    def location_measure_type=(location_measure_type)
      validator = EnumAttributeValidator.new('String', ["Pixels", "Percents", "Millimeters"])
      if location_measure_type.to_i == 0
        unless validator.valid?(location_measure_type)
          raise ArgumentError, "invalid value for 'location_measure_type', must be one of #{validator.allowable_values}."
        end
        @location_measure_type = location_measure_type
      else
        @location_measure_type = validator.allowable_values[location_measure_type.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] size_measure_type Object to be assigned
    def size_measure_type=(size_measure_type)
      validator = EnumAttributeValidator.new('String', ["Pixels", "Percents", "Millimeters"])
      if size_measure_type.to_i == 0
        unless validator.valid?(size_measure_type)
          raise ArgumentError, "invalid value for 'size_measure_type', must be one of #{validator.allowable_values}."
        end
        @size_measure_type = size_measure_type
      else
        @size_measure_type = validator.allowable_values[size_measure_type.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] horizontal_alignment Object to be assigned
    def horizontal_alignment=(horizontal_alignment)
      validator = EnumAttributeValidator.new('String', ["Default", "None", "Left", "Center", "Right"])
      if horizontal_alignment.to_i == 0
        unless validator.valid?(horizontal_alignment)
          raise ArgumentError, "invalid value for 'horizontal_alignment', must be one of #{validator.allowable_values}."
        end
        @horizontal_alignment = horizontal_alignment
      else
        @horizontal_alignment = validator.allowable_values[horizontal_alignment.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] vertical_alignment Object to be assigned
    def vertical_alignment=(vertical_alignment)
      validator = EnumAttributeValidator.new('String', ["Default", "None", "Top", "Center", "Bottom"])
      if vertical_alignment.to_i == 0
        unless validator.valid?(vertical_alignment)
          raise ArgumentError, "invalid value for 'vertical_alignment', must be one of #{validator.allowable_values}."
        end
        @vertical_alignment = vertical_alignment
      else
        @vertical_alignment = validator.allowable_values[vertical_alignment.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] margin_measure_type Object to be assigned
    def margin_measure_type=(margin_measure_type)
      validator = EnumAttributeValidator.new('String', ["Pixels", "Percents", "Millimeters"])
      if margin_measure_type.to_i == 0
        unless validator.valid?(margin_measure_type)
          raise ArgumentError, "invalid value for 'margin_measure_type', must be one of #{validator.allowable_values}."
        end
        @margin_measure_type = margin_measure_type
      else
        @margin_measure_type = validator.allowable_values[margin_measure_type.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] background_color_crop_type Object to be assigned
    def background_color_crop_type=(background_color_crop_type)
      validator = EnumAttributeValidator.new('String', ["None", "OuterArea", "MiddleArea", "InnerArea"])
      if background_color_crop_type.to_i == 0
        unless validator.valid?(background_color_crop_type)
          raise ArgumentError, "invalid value for 'background_color_crop_type', must be one of #{validator.allowable_values}."
        end
        @background_color_crop_type = background_color_crop_type
      else
        @background_color_crop_type = validator.allowable_values[background_color_crop_type.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] background_image_crop_type Object to be assigned
    def background_image_crop_type=(background_image_crop_type)
      validator = EnumAttributeValidator.new('String', ["None", "OuterArea", "MiddleArea", "InnerArea"])
      if background_image_crop_type.to_i == 0
        unless validator.valid?(background_image_crop_type)
          raise ArgumentError, "invalid value for 'background_image_crop_type', must be one of #{validator.allowable_values}."
        end
        @background_image_crop_type = background_image_crop_type
      else
        @background_image_crop_type = validator.allowable_values[background_image_crop_type.to_i]
      end
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(other)
      return true if self.equal?(other)
      self.class == other.class &&
          document_page_number == other.document_page_number &&
          pages_setup == other.pages_setup &&
          options_type == other.options_type &&
          image_guid == other.image_guid &&
          left == other.left &&
          top == other.top &&
          width == other.width &&
          height == other.height &&
          location_measure_type == other.location_measure_type &&
          size_measure_type == other.size_measure_type &&
          rotation_angle == other.rotation_angle &&
          horizontal_alignment == other.horizontal_alignment &&
          vertical_alignment == other.vertical_alignment &&
          margin == other.margin &&
          margin_measure_type == other.margin_measure_type &&
          opacity == other.opacity &&
          sign_all_pages == other.sign_all_pages &&
          outer_lines == other.outer_lines &&
          inner_lines == other.inner_lines &&
          background_color == other.background_color &&
          background_brush == other.background_brush &&
          background_color_crop_type == other.background_color_crop_type &&
          background_image_crop_type == other.background_image_crop_type &&
          sheet_number == other.sheet_number &&
          row_number == other.row_number &&
          column_number == other.column_number
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [document_page_number, pages_setup, options_type, image_guid, left, top, width, height, location_measure_type, size_measure_type, rotation_angle, horizontal_alignment, vertical_alignment, margin, margin_measure_type, opacity, sign_all_pages, outer_lines, inner_lines, background_color, background_brush, background_color_crop_type, background_image_crop_type, sheet_number, row_number, column_number].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|

        attributeName = self.class.attribute_map[key]
        attributeNameLowerStr = attributeName.to_s
        attributeNameLowerStr[0] = attributeNameLowerStr[0].downcase
        attributeNameLower = attributeNameLowerStr.to_sym
        attributeNameLowerStr2 = attributeName.to_s
        attributeNameLowerStr2[0] = attributeNameLowerStr[0].downcase
        attributeNameLowerStr2[1] = attributeNameLowerStr[1].downcase
        attributeNameLower2 = attributeNameLowerStr2.to_sym

        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[attributeName].is_a?(Array)
            self.send("#{key}=", attributes[attributeName].map { |v| _deserialize($1, v) })
          end
          if attributes[attributeNameLower].is_a?(Array)
            self.send("#{key}=", attributes[attributeNameLower].map { |v| _deserialize($1, v) })
          end
          if attributes[attributeNameLower2].is_a?(Array)
            self.send("#{key}=", attributes[attributeNameLower2].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[attributeName].nil?
          self.send("#{key}=", _deserialize(type, attributes[attributeName]))
        elsif !attributes[attributeNameLower].nil?
          self.send("#{key}=", _deserialize(type, attributes[attributeNameLower]))
        elsif !attributes[attributeNameLower2].nil?
          self.send("#{key}=", _deserialize(type, attributes[attributeNameLower2]))
        end
        # or else data not found in attributes(hash), not an issue as the data can be optional
      end
      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        Time.at(/\d/.match(value)[0].to_f).to_datetime
      when :Date
        Time.at(/\d/.match(value)[0].to_f).to_date
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else
      # model
        temp_model = GroupDocsSignatureCloud.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
