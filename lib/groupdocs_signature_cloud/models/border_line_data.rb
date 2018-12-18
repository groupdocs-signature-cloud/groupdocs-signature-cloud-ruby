 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="border_line_data.rb">
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
  # Instance to keep Border line properties.
  class BorderLineData

    # Gets or sets the signature border style.
    attr_accessor :style

    # Gets or sets the signature border transparency (value from 0.0 (opaque) through 1.0 (clear)).
    attr_accessor :transparency

    # Gets or sets the weight of the signature border. 
    attr_accessor :weight

    # Gets or sets the border color of signature.
    attr_accessor :color
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
        :'style' => :'Style',
        :'transparency' => :'Transparency',
        :'weight' => :'Weight',
        :'color' => :'Color'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'style' => :'String',
        :'transparency' => :'Float',
        :'weight' => :'Float',
        :'color' => :'Color'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.key?(:'Style')
        self.style = attributes[:'Style']
      end

      if attributes.key?(:'Transparency')
        self.transparency = attributes[:'Transparency']
      end

      if attributes.key?(:'Weight')
        self.weight = attributes[:'Weight']
      end

      if attributes.key?(:'Color')
        self.color = attributes[:'Color']
      end

	  
	  if !((defined? options_type) == nil)
        self.options_type = "BorderLineData"
      end
	  
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = []
      if @style.nil?
        invalid_properties.push("invalid value for 'style', style cannot be nil.")
      end

      if @transparency.nil?
        invalid_properties.push("invalid value for 'transparency', transparency cannot be nil.")
      end

      if @weight.nil?
        invalid_properties.push("invalid value for 'weight', weight cannot be nil.")
      end

      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @style.nil?
      style_validator = EnumAttributeValidator.new('String', ["Default", "Solid", "ShortDash", "ShortDot", "ShortDashDot", "ShortDashDotDot", "Dot", "Dash", "LongDash", "DashDot", "LongDashDot", "LongDashDotDot"])
      return false unless style_validator.valid?(@style)
      return false if @transparency.nil?
      return false if @weight.nil?
      return true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] style Object to be assigned
    def style=(style)
      validator = EnumAttributeValidator.new('String', ["Default", "Solid", "ShortDash", "ShortDot", "ShortDashDot", "ShortDashDotDot", "Dot", "Dash", "LongDash", "DashDot", "LongDashDot", "LongDashDotDot"])
      if style.to_i == 0
        unless validator.valid?(style)
          raise ArgumentError, "invalid value for 'style', must be one of #{validator.allowable_values}."
        end
        @style = style
      else
        @style = validator.allowable_values[style.to_i]
      end
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(other)
      return true if self.equal?(other)
      self.class == other.class &&
          style == other.style &&
          transparency == other.transparency &&
          weight == other.weight &&
          color == other.color
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [style, transparency, weight, color].hash
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
