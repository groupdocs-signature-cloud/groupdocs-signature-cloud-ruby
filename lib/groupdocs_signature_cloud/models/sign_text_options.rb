 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="sign_text_options.rb">
 #   Copyright (c) 2003-2022 Aspose Pty Ltd
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
  # Base container class for signature options data
  class SignTextOptions

    # Specifies the signature type of processing
    attr_accessor :signature_type

    # Gets or sets a document page number for processing. Value is optional
    attr_accessor :page

    # Process all document pages. Type of processing depends on SignatureType For Images Document Type it can be used only for multi-frames images like .tiff
    attr_accessor :all_pages

    # Options to specify pages for processing
    attr_accessor :pages_setup

    # Specifies Appearance with additional properties for this options instance
    attr_accessor :appearance

    # Left X position of Signature on Document Page in Measure values (pixels or percent see MeasureType LocationMeasureType property)
    attr_accessor :left

    # Top Y Position of Signature on Document Page in Measure values (pixels or percent see MeasureType LocationMeasureType property)
    attr_accessor :top

    # Width of Signature area on Document Page in Measure values (pixels or percent see MeasureType SizeMeasureType property)
    attr_accessor :width

    # Height of Signature are on Document Page in Measure values (pixels or percent see MeasureType SizeMeasureType property)
    attr_accessor :height

    # Measure type (pixels or percent) for Left and Top properties
    attr_accessor :location_measure_type

    # Measure type (pixels or percent) for Width and Height properties
    attr_accessor :size_measure_type

    # Stretch mode on document page
    attr_accessor :stretch

    # Rotation angle of signature on document page (clockwise)
    attr_accessor :rotation_angle

    # Horizontal alignment of signature on document page
    attr_accessor :horizontal_alignment

    # Vertical alignment of signature on document page
    attr_accessor :vertical_alignment

    # Gets or sets the space between Sign and Document edges (works ONLY if horizontal or vertical alignment are specified)
    attr_accessor :margin

    # Gets or sets the measure type (pixels or percent) for Margin
    attr_accessor :margin_measure_type

    # Text of signature
    attr_accessor :text

    # Gets or sets the font of signature
    attr_accessor :font

    # Gets or sets the fore color of signature
    attr_accessor :fore_color

    # Gets or sets the background color of signature
    attr_accessor :background_color

    # Gets or sets the signature background brush. Value by default is null.  If this property has a value it will be used instead BackgroundBrush property. For Spreadsheet documents TextStamp implementation RadialGradientBrush is not applicable, it is replaced by LinearGradientBrush. Spreadsheets, Images, Presentations It is not used for Watermark implementation. PDF For Stamp implementation LinearGradientBrush (ColorStart) and RadialGradientBrush (ColorInner) are used as SolidBrush. PDF It is not used for Annotation, Sticker, TextToFormField and Watermark implementations. Presentations For TextStamp implementation RadialGradientBrush is not applicable, it is replaced by LinearGradientBrush. Word Processing For TextStamp implementation LinearGradientBrush (ColorStart) and RadialGradientBrush (ColorInner) are used as SolidBrush. Word Processing It is not used for TextToFormField and Watermark implementations
    attr_accessor :background_brush

    # Gets or sets the signature border properties
    attr_accessor :border

    # Horizontal alignment of text inside a signature
    attr_accessor :text_horizontal_alignment

    # Vertical alignment of text inside a signature
    attr_accessor :text_vertical_alignment

    # Gets or sets the Z-order position of text signature. Determines the display order of overlapping signatures.             
    attr_accessor :z_order

    # Gets or sets the native attribute. If it is set document specific signatures could be used. Native text watermark for WordProcessing documents is different than regular, for example.             
    attr_accessor :native
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
        :'signature_type' => :'SignatureType',
        :'page' => :'Page',
        :'all_pages' => :'AllPages',
        :'pages_setup' => :'PagesSetup',
        :'appearance' => :'Appearance',
        :'left' => :'Left',
        :'top' => :'Top',
        :'width' => :'Width',
        :'height' => :'Height',
        :'location_measure_type' => :'LocationMeasureType',
        :'size_measure_type' => :'SizeMeasureType',
        :'stretch' => :'Stretch',
        :'rotation_angle' => :'RotationAngle',
        :'horizontal_alignment' => :'HorizontalAlignment',
        :'vertical_alignment' => :'VerticalAlignment',
        :'margin' => :'Margin',
        :'margin_measure_type' => :'MarginMeasureType',
        :'text' => :'Text',
        :'font' => :'Font',
        :'fore_color' => :'ForeColor',
        :'background_color' => :'BackgroundColor',
        :'background_brush' => :'BackgroundBrush',
        :'border' => :'Border',
        :'text_horizontal_alignment' => :'TextHorizontalAlignment',
        :'text_vertical_alignment' => :'TextVerticalAlignment',
        :'z_order' => :'ZOrder',
        :'native' => :'Native'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'signature_type' => :'String',
        :'page' => :'Integer',
        :'all_pages' => :'BOOLEAN',
        :'pages_setup' => :'PagesSetup',
        :'appearance' => :'SignatureAppearance',
        :'left' => :'Integer',
        :'top' => :'Integer',
        :'width' => :'Integer',
        :'height' => :'Integer',
        :'location_measure_type' => :'String',
        :'size_measure_type' => :'String',
        :'stretch' => :'String',
        :'rotation_angle' => :'Integer',
        :'horizontal_alignment' => :'String',
        :'vertical_alignment' => :'String',
        :'margin' => :'Padding',
        :'margin_measure_type' => :'String',
        :'text' => :'String',
        :'font' => :'SignatureFont',
        :'fore_color' => :'Color',
        :'background_color' => :'Color',
        :'background_brush' => :'Brush',
        :'border' => :'BorderLine',
        :'text_horizontal_alignment' => :'String',
        :'text_vertical_alignment' => :'String',
        :'z_order' => :'Integer',
        :'native' => :'BOOLEAN'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.key?(:'SignatureType')
        self.signature_type = attributes[:'SignatureType']
      end

      if attributes.key?(:'Page')
        self.page = attributes[:'Page']
      end

      if attributes.key?(:'AllPages')
        self.all_pages = attributes[:'AllPages']
      end

      if attributes.key?(:'PagesSetup')
        self.pages_setup = attributes[:'PagesSetup']
      end

      if attributes.key?(:'Appearance')
        self.appearance = attributes[:'Appearance']
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

      if attributes.key?(:'Stretch')
        self.stretch = attributes[:'Stretch']
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

      if attributes.key?(:'Text')
        self.text = attributes[:'Text']
      end

      if attributes.key?(:'Font')
        self.font = attributes[:'Font']
      end

      if attributes.key?(:'ForeColor')
        self.fore_color = attributes[:'ForeColor']
      end

      if attributes.key?(:'BackgroundColor')
        self.background_color = attributes[:'BackgroundColor']
      end

      if attributes.key?(:'BackgroundBrush')
        self.background_brush = attributes[:'BackgroundBrush']
      end

      if attributes.key?(:'Border')
        self.border = attributes[:'Border']
      end

      if attributes.key?(:'TextHorizontalAlignment')
        self.text_horizontal_alignment = attributes[:'TextHorizontalAlignment']
      end

      if attributes.key?(:'TextVerticalAlignment')
        self.text_vertical_alignment = attributes[:'TextVerticalAlignment']
      end

      if attributes.key?(:'ZOrder')
        self.z_order = attributes[:'ZOrder']
      end

      if attributes.key?(:'Native')
        self.native = attributes[:'Native']
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = []
      if @signature_type.nil?
        invalid_properties.push("invalid value for 'signature_type', signature_type cannot be nil.")
      end

      if @all_pages.nil?
        invalid_properties.push("invalid value for 'all_pages', all_pages cannot be nil.")
      end

      if @left.nil?
        invalid_properties.push("invalid value for 'left', left cannot be nil.")
      end

      if @top.nil?
        invalid_properties.push("invalid value for 'top', top cannot be nil.")
      end

      if @width.nil?
        invalid_properties.push("invalid value for 'width', width cannot be nil.")
      end

      if @height.nil?
        invalid_properties.push("invalid value for 'height', height cannot be nil.")
      end

      if @location_measure_type.nil?
        invalid_properties.push("invalid value for 'location_measure_type', location_measure_type cannot be nil.")
      end

      if @size_measure_type.nil?
        invalid_properties.push("invalid value for 'size_measure_type', size_measure_type cannot be nil.")
      end

      if @stretch.nil?
        invalid_properties.push("invalid value for 'stretch', stretch cannot be nil.")
      end

      if @rotation_angle.nil?
        invalid_properties.push("invalid value for 'rotation_angle', rotation_angle cannot be nil.")
      end

      if @horizontal_alignment.nil?
        invalid_properties.push("invalid value for 'horizontal_alignment', horizontal_alignment cannot be nil.")
      end

      if @vertical_alignment.nil?
        invalid_properties.push("invalid value for 'vertical_alignment', vertical_alignment cannot be nil.")
      end

      if @margin_measure_type.nil?
        invalid_properties.push("invalid value for 'margin_measure_type', margin_measure_type cannot be nil.")
      end

      if @text_horizontal_alignment.nil?
        invalid_properties.push("invalid value for 'text_horizontal_alignment', text_horizontal_alignment cannot be nil.")
      end

      if @text_vertical_alignment.nil?
        invalid_properties.push("invalid value for 'text_vertical_alignment', text_vertical_alignment cannot be nil.")
      end

      if @z_order.nil?
        invalid_properties.push("invalid value for 'z_order', z_order cannot be nil.")
      end

      if @native.nil?
        invalid_properties.push("invalid value for 'native', native cannot be nil.")
      end

      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @signature_type.nil?
      signature_type_validator = EnumAttributeValidator.new('String', ["None", "Text", "Image", "Digital", "Barcode", "QRCode", "Stamp", "FormField", "Metadata"])
      return false unless signature_type_validator.valid?(@signature_type)
      return false if @all_pages.nil?
      return false if @left.nil?
      return false if @top.nil?
      return false if @width.nil?
      return false if @height.nil?
      return false if @location_measure_type.nil?
      location_measure_type_validator = EnumAttributeValidator.new('String', ["Pixels", "Percents", "Millimeters"])
      return false unless location_measure_type_validator.valid?(@location_measure_type)
      return false if @size_measure_type.nil?
      size_measure_type_validator = EnumAttributeValidator.new('String', ["Pixels", "Percents", "Millimeters"])
      return false unless size_measure_type_validator.valid?(@size_measure_type)
      return false if @stretch.nil?
      stretch_validator = EnumAttributeValidator.new('String', ["None", "PageWidth", "PageHeight", "PageArea"])
      return false unless stretch_validator.valid?(@stretch)
      return false if @rotation_angle.nil?
      return false if @horizontal_alignment.nil?
      horizontal_alignment_validator = EnumAttributeValidator.new('String', ["None", "Left", "Center", "Right"])
      return false unless horizontal_alignment_validator.valid?(@horizontal_alignment)
      return false if @vertical_alignment.nil?
      vertical_alignment_validator = EnumAttributeValidator.new('String', ["None", "Top", "Center", "Bottom"])
      return false unless vertical_alignment_validator.valid?(@vertical_alignment)
      return false if @margin_measure_type.nil?
      margin_measure_type_validator = EnumAttributeValidator.new('String', ["Pixels", "Percents", "Millimeters"])
      return false unless margin_measure_type_validator.valid?(@margin_measure_type)
      return false if @text_horizontal_alignment.nil?
      text_horizontal_alignment_validator = EnumAttributeValidator.new('String', ["Left", "Center", "Right"])
      return false unless text_horizontal_alignment_validator.valid?(@text_horizontal_alignment)
      return false if @text_vertical_alignment.nil?
      text_vertical_alignment_validator = EnumAttributeValidator.new('String', ["Top", "Center", "Bottom"])
      return false unless text_vertical_alignment_validator.valid?(@text_vertical_alignment)
      return false if @z_order.nil?
      return false if @native.nil?
      return true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] signature_type Object to be assigned
    def signature_type=(signature_type)
      validator = EnumAttributeValidator.new('String', ["None", "Text", "Image", "Digital", "Barcode", "QRCode", "Stamp", "FormField", "Metadata"])
      if signature_type.to_i == 0
        unless validator.valid?(signature_type)
          raise ArgumentError, "invalid value for 'signature_type', must be one of #{validator.allowable_values}."
        end
        @signature_type = signature_type
      else
        @signature_type = validator.allowable_values[signature_type.to_i]
      end
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
    # @param [Object] stretch Object to be assigned
    def stretch=(stretch)
      validator = EnumAttributeValidator.new('String', ["None", "PageWidth", "PageHeight", "PageArea"])
      if stretch.to_i == 0
        unless validator.valid?(stretch)
          raise ArgumentError, "invalid value for 'stretch', must be one of #{validator.allowable_values}."
        end
        @stretch = stretch
      else
        @stretch = validator.allowable_values[stretch.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] horizontal_alignment Object to be assigned
    def horizontal_alignment=(horizontal_alignment)
      validator = EnumAttributeValidator.new('String', ["None", "Left", "Center", "Right"])
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
      validator = EnumAttributeValidator.new('String', ["None", "Top", "Center", "Bottom"])
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
    # @param [Object] text_horizontal_alignment Object to be assigned
    def text_horizontal_alignment=(text_horizontal_alignment)
      validator = EnumAttributeValidator.new('String', ["Left", "Center", "Right"])
      if text_horizontal_alignment.to_i == 0
        unless validator.valid?(text_horizontal_alignment)
          raise ArgumentError, "invalid value for 'text_horizontal_alignment', must be one of #{validator.allowable_values}."
        end
        @text_horizontal_alignment = text_horizontal_alignment
      else
        @text_horizontal_alignment = validator.allowable_values[text_horizontal_alignment.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] text_vertical_alignment Object to be assigned
    def text_vertical_alignment=(text_vertical_alignment)
      validator = EnumAttributeValidator.new('String', ["Top", "Center", "Bottom"])
      if text_vertical_alignment.to_i == 0
        unless validator.valid?(text_vertical_alignment)
          raise ArgumentError, "invalid value for 'text_vertical_alignment', must be one of #{validator.allowable_values}."
        end
        @text_vertical_alignment = text_vertical_alignment
      else
        @text_vertical_alignment = validator.allowable_values[text_vertical_alignment.to_i]
      end
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(other)
      return true if self.equal?(other)
      self.class == other.class &&
          signature_type == other.signature_type &&
          page == other.page &&
          all_pages == other.all_pages &&
          pages_setup == other.pages_setup &&
          appearance == other.appearance &&
          left == other.left &&
          top == other.top &&
          width == other.width &&
          height == other.height &&
          location_measure_type == other.location_measure_type &&
          size_measure_type == other.size_measure_type &&
          stretch == other.stretch &&
          rotation_angle == other.rotation_angle &&
          horizontal_alignment == other.horizontal_alignment &&
          vertical_alignment == other.vertical_alignment &&
          margin == other.margin &&
          margin_measure_type == other.margin_measure_type &&
          text == other.text &&
          font == other.font &&
          fore_color == other.fore_color &&
          background_color == other.background_color &&
          background_brush == other.background_brush &&
          border == other.border &&
          text_horizontal_alignment == other.text_horizontal_alignment &&
          text_vertical_alignment == other.text_vertical_alignment &&
          z_order == other.z_order &&
          native == other.native
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [signature_type, page, all_pages, pages_setup, appearance, left, top, width, height, location_measure_type, size_measure_type, stretch, rotation_angle, horizontal_alignment, vertical_alignment, margin, margin_measure_type, text, font, fore_color, background_color, background_brush, border, text_horizontal_alignment, text_vertical_alignment, z_order, native].hash
    end

    # Downcases first letter.
    # @return downcased string
    def uncap(str)
      str[0, 1].downcase + str[1..-1]
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        pname = uncap(self.class.attribute_map[key]).intern
        value = attributes[pname]
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not                    
          if value.is_a?(Array)
            self.send("#{key}=", value.map { |v| _deserialize($1, v) })
          end
        elsif !value.nil?                  
          self.send("#{key}=", _deserialize(type, value))
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
        Date.parse value
      when :Date
        Date.parse value
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
        # Signature type fix
        ttype = type
        if value.is_a?(Hash) and !value[:signatureType].nil?
          ttype = value[:signatureType] + 'Signature'
          if value[:signatureType] == 'FormField' and !value[:type].nil?
            type = value[:type]
            if type == 'Checkbox'
              ttype = 'CheckboxFormFieldSignature'
            end
            if type == 'Text'
              ttype = 'TextFormFieldSignature'
            end
            if type == 'Combobox'
              ttype = 'ComboboxFormFieldSignature'
            end
            if type == 'DigitalSignature'
              ttype = 'DigitalFormFieldSignature'
            end
            if type == 'Radio'
              ttype = 'RadioButtonFormFieldSignature'
            end
          end
        end      
        temp_model = GroupDocsSignatureCloud.const_get(ttype).new
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
