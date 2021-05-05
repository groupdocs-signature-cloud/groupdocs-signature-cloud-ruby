 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="stamp_line.rb">
 #   Copyright (c) 2003-2021 Aspose Pty Ltd
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
  # Specify Stamp line properties
  class StampLine

    # Gets or sets the line height on Stamp
    attr_accessor :height

    # Gets or sets the background color of signature
    attr_accessor :background_color

    # Gets or sets the text of stamp line
    attr_accessor :text

    # Get or set Font of Stamp Line text
    attr_accessor :font

    # Gets or sets the text color of signature
    attr_accessor :text_color

    # Gets or sets the bottom intent of text
    attr_accessor :text_bottom_intent

    # Gets or sets text repeat type
    attr_accessor :text_repeat_type

    # Setup Outer Border
    attr_accessor :outer_border

    # Setup Internal Border
    attr_accessor :inner_border

    # Get and set visibility of Stamp Line
    attr_accessor :visible
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
        :'height' => :'Height',
        :'background_color' => :'BackgroundColor',
        :'text' => :'Text',
        :'font' => :'Font',
        :'text_color' => :'TextColor',
        :'text_bottom_intent' => :'TextBottomIntent',
        :'text_repeat_type' => :'TextRepeatType',
        :'outer_border' => :'OuterBorder',
        :'inner_border' => :'InnerBorder',
        :'visible' => :'Visible'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'height' => :'Integer',
        :'background_color' => :'Color',
        :'text' => :'String',
        :'font' => :'SignatureFont',
        :'text_color' => :'Color',
        :'text_bottom_intent' => :'Integer',
        :'text_repeat_type' => :'String',
        :'outer_border' => :'BorderLine',
        :'inner_border' => :'BorderLine',
        :'visible' => :'BOOLEAN'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.key?(:'Height')
        self.height = attributes[:'Height']
      end

      if attributes.key?(:'BackgroundColor')
        self.background_color = attributes[:'BackgroundColor']
      end

      if attributes.key?(:'Text')
        self.text = attributes[:'Text']
      end

      if attributes.key?(:'Font')
        self.font = attributes[:'Font']
      end

      if attributes.key?(:'TextColor')
        self.text_color = attributes[:'TextColor']
      end

      if attributes.key?(:'TextBottomIntent')
        self.text_bottom_intent = attributes[:'TextBottomIntent']
      end

      if attributes.key?(:'TextRepeatType')
        self.text_repeat_type = attributes[:'TextRepeatType']
      end

      if attributes.key?(:'OuterBorder')
        self.outer_border = attributes[:'OuterBorder']
      end

      if attributes.key?(:'InnerBorder')
        self.inner_border = attributes[:'InnerBorder']
      end

      if attributes.key?(:'Visible')
        self.visible = attributes[:'Visible']
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = []
      if @height.nil?
        invalid_properties.push("invalid value for 'height', height cannot be nil.")
      end

      if @text_bottom_intent.nil?
        invalid_properties.push("invalid value for 'text_bottom_intent', text_bottom_intent cannot be nil.")
      end

      if @text_repeat_type.nil?
        invalid_properties.push("invalid value for 'text_repeat_type', text_repeat_type cannot be nil.")
      end

      if @visible.nil?
        invalid_properties.push("invalid value for 'visible', visible cannot be nil.")
      end

      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @height.nil?
      return false if @text_bottom_intent.nil?
      return false if @text_repeat_type.nil?
      text_repeat_type_validator = EnumAttributeValidator.new('String', ["None", "FullTextRepeat", "RepeatWithTruncation"])
      return false unless text_repeat_type_validator.valid?(@text_repeat_type)
      return false if @visible.nil?
      return true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] text_repeat_type Object to be assigned
    def text_repeat_type=(text_repeat_type)
      validator = EnumAttributeValidator.new('String', ["None", "FullTextRepeat", "RepeatWithTruncation"])
      if text_repeat_type.to_i == 0
        unless validator.valid?(text_repeat_type)
          raise ArgumentError, "invalid value for 'text_repeat_type', must be one of #{validator.allowable_values}."
        end
        @text_repeat_type = text_repeat_type
      else
        @text_repeat_type = validator.allowable_values[text_repeat_type.to_i]
      end
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(other)
      return true if self.equal?(other)
      self.class == other.class &&
          height == other.height &&
          background_color == other.background_color &&
          text == other.text &&
          font == other.font &&
          text_color == other.text_color &&
          text_bottom_intent == other.text_bottom_intent &&
          text_repeat_type == other.text_repeat_type &&
          outer_border == other.outer_border &&
          inner_border == other.inner_border &&
          visible == other.visible
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [height, background_color, text, font, text_color, text_bottom_intent, text_repeat_type, outer_border, inner_border, visible].hash
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
