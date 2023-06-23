 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="pdf_text_annotation_appearance.rb">
 #   Copyright (c) 2003-2023 Aspose Pty Ltd
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
  # Describes appearance of PDF text annotation object (Title, Subject, Content).
  class PdfTextAnnotationAppearance

    # Specifies the type of appearance
    attr_accessor :appearance_type

    # Represents border appearance
    attr_accessor :border

    # Gets or sets border effect.
    attr_accessor :border_effect

    # Gets or sets border effect intensity. Valid range of value is [0..2].
    attr_accessor :border_effect_intensity

    # Gets or sets content of annotation object.
    attr_accessor :contents

    # Gets or sets horizontal corner radius.
    attr_accessor :h_corner_radius

    # Gets or sets Subject representing description of the object.
    attr_accessor :subject

    # Gets or sets a Title that will be displayed in title bar of annotation object.
    attr_accessor :title

    # Gets or sets vertical corner radius.
    attr_accessor :v_corner_radius
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
        :'appearance_type' => :'AppearanceType',
        :'border' => :'Border',
        :'border_effect' => :'BorderEffect',
        :'border_effect_intensity' => :'BorderEffectIntensity',
        :'contents' => :'Contents',
        :'h_corner_radius' => :'HCornerRadius',
        :'subject' => :'Subject',
        :'title' => :'Title',
        :'v_corner_radius' => :'VCornerRadius'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'appearance_type' => :'String',
        :'border' => :'BorderLine',
        :'border_effect' => :'String',
        :'border_effect_intensity' => :'Integer',
        :'contents' => :'String',
        :'h_corner_radius' => :'Integer',
        :'subject' => :'String',
        :'title' => :'String',
        :'v_corner_radius' => :'Integer'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.key?(:'AppearanceType')
        self.appearance_type = attributes[:'AppearanceType']
      end

      if attributes.key?(:'Border')
        self.border = attributes[:'Border']
      end

      if attributes.key?(:'BorderEffect')
        self.border_effect = attributes[:'BorderEffect']
      end

      if attributes.key?(:'BorderEffectIntensity')
        self.border_effect_intensity = attributes[:'BorderEffectIntensity']
      end

      if attributes.key?(:'Contents')
        self.contents = attributes[:'Contents']
      end

      if attributes.key?(:'HCornerRadius')
        self.h_corner_radius = attributes[:'HCornerRadius']
      end

      if attributes.key?(:'Subject')
        self.subject = attributes[:'Subject']
      end

      if attributes.key?(:'Title')
        self.title = attributes[:'Title']
      end

      if attributes.key?(:'VCornerRadius')
        self.v_corner_radius = attributes[:'VCornerRadius']
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = []
      if @appearance_type.nil?
        invalid_properties.push("invalid value for 'appearance_type', appearance_type cannot be nil.")
      end

      if @border_effect.nil?
        invalid_properties.push("invalid value for 'border_effect', border_effect cannot be nil.")
      end

      if @border_effect_intensity.nil?
        invalid_properties.push("invalid value for 'border_effect_intensity', border_effect_intensity cannot be nil.")
      end

      if @h_corner_radius.nil?
        invalid_properties.push("invalid value for 'h_corner_radius', h_corner_radius cannot be nil.")
      end

      if @v_corner_radius.nil?
        invalid_properties.push("invalid value for 'v_corner_radius', v_corner_radius cannot be nil.")
      end

      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @appearance_type.nil?
      appearance_type_validator = EnumAttributeValidator.new('String', ["Undefined", "PdfTextAnnotation", "PdfTextSticker", "Image", "DigitalSignature", "PdfDigitalSignature"])
      return false unless appearance_type_validator.valid?(@appearance_type)
      return false if @border_effect.nil?
      border_effect_validator = EnumAttributeValidator.new('String', ["None", "Cloudy"])
      return false unless border_effect_validator.valid?(@border_effect)
      return false if @border_effect_intensity.nil?
      return false if @h_corner_radius.nil?
      return false if @v_corner_radius.nil?
      return true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] appearance_type Object to be assigned
    def appearance_type=(appearance_type)
      validator = EnumAttributeValidator.new('String', ["Undefined", "PdfTextAnnotation", "PdfTextSticker", "Image", "DigitalSignature", "PdfDigitalSignature"])
      if appearance_type.to_i == 0
        unless validator.valid?(appearance_type)
          raise ArgumentError, "invalid value for 'appearance_type', must be one of #{validator.allowable_values}."
        end
        @appearance_type = appearance_type
      else
        @appearance_type = validator.allowable_values[appearance_type.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] border_effect Object to be assigned
    def border_effect=(border_effect)
      validator = EnumAttributeValidator.new('String', ["None", "Cloudy"])
      if border_effect.to_i == 0
        unless validator.valid?(border_effect)
          raise ArgumentError, "invalid value for 'border_effect', must be one of #{validator.allowable_values}."
        end
        @border_effect = border_effect
      else
        @border_effect = validator.allowable_values[border_effect.to_i]
      end
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(other)
      return true if self.equal?(other)
      self.class == other.class &&
          appearance_type == other.appearance_type &&
          border == other.border &&
          border_effect == other.border_effect &&
          border_effect_intensity == other.border_effect_intensity &&
          contents == other.contents &&
          h_corner_radius == other.h_corner_radius &&
          subject == other.subject &&
          title == other.title &&
          v_corner_radius == other.v_corner_radius
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [appearance_type, border, border_effect, border_effect_intensity, contents, h_corner_radius, subject, title, v_corner_radius].hash
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
