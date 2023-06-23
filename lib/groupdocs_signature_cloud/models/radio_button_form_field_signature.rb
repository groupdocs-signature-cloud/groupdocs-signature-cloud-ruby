 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="radio_button_form_field_signature.rb">
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
  # Contains radio-button input form field signature properties
  class RadioButtonFormFieldSignature

    # Specifies the signature type (Text, Image, Digital, Barcode, QRCode, Stamp)
    attr_accessor :signature_type

    # Specifies the page signature was found on
    attr_accessor :page_number

    # Unique signature identifier to modify signature in the document over Update or Delete methods. This property will be set automatically after Sign or Search method being called. If this property was saved before it can be set manually to manipulate the signature.
    attr_accessor :signature_id

    # Get or set flag to indicate if this component is Signature or document content. This property is being used with Update method to set element as signature (true) or document element (false).             
    attr_accessor :is_signature

    # Get or set the signature creation date
    attr_accessor :created_on

    # Get or set the signature modification date
    attr_accessor :modified_on

    # Specifies top position of signature
    attr_accessor :top

    # Specifies left position of signature
    attr_accessor :left

    # Specifies width of signature
    attr_accessor :width

    # Specifies height of signature
    attr_accessor :height

    # Specifies unique form field name
    attr_accessor :name

    # Specifies Form field type
    attr_accessor :type

    # Get or set selected value
    attr_accessor :selected

    # Get or set radio options list
    attr_accessor :items
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
        :'page_number' => :'PageNumber',
        :'signature_id' => :'SignatureId',
        :'is_signature' => :'IsSignature',
        :'created_on' => :'CreatedOn',
        :'modified_on' => :'ModifiedOn',
        :'top' => :'Top',
        :'left' => :'Left',
        :'width' => :'Width',
        :'height' => :'Height',
        :'name' => :'Name',
        :'type' => :'Type',
        :'selected' => :'Selected',
        :'items' => :'Items'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'signature_type' => :'String',
        :'page_number' => :'Integer',
        :'signature_id' => :'String',
        :'is_signature' => :'BOOLEAN',
        :'created_on' => :'DateTime',
        :'modified_on' => :'DateTime',
        :'top' => :'Integer',
        :'left' => :'Integer',
        :'width' => :'Integer',
        :'height' => :'Integer',
        :'name' => :'String',
        :'type' => :'String',
        :'selected' => :'String',
        :'items' => :'Array<String>'
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

      if attributes.key?(:'PageNumber')
        self.page_number = attributes[:'PageNumber']
      end

      if attributes.key?(:'SignatureId')
        self.signature_id = attributes[:'SignatureId']
      end

      if attributes.key?(:'IsSignature')
        self.is_signature = attributes[:'IsSignature']
      end

      if attributes.key?(:'CreatedOn')
        self.created_on = attributes[:'CreatedOn']
      end

      if attributes.key?(:'ModifiedOn')
        self.modified_on = attributes[:'ModifiedOn']
      end

      if attributes.key?(:'Top')
        self.top = attributes[:'Top']
      end

      if attributes.key?(:'Left')
        self.left = attributes[:'Left']
      end

      if attributes.key?(:'Width')
        self.width = attributes[:'Width']
      end

      if attributes.key?(:'Height')
        self.height = attributes[:'Height']
      end

      if attributes.key?(:'Name')
        self.name = attributes[:'Name']
      end

      if attributes.key?(:'Type')
        self.type = attributes[:'Type']
      end

      if attributes.key?(:'Selected')
        self.selected = attributes[:'Selected']
      end

      if attributes.key?(:'Items')
        if (value = attributes[:'Items']).is_a?(Array)
          self.items = value
        end
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = []
      if @signature_type.nil?
        invalid_properties.push("invalid value for 'signature_type', signature_type cannot be nil.")
      end

      if @is_signature.nil?
        invalid_properties.push("invalid value for 'is_signature', is_signature cannot be nil.")
      end

      if @created_on.nil?
        invalid_properties.push("invalid value for 'created_on', created_on cannot be nil.")
      end

      if @modified_on.nil?
        invalid_properties.push("invalid value for 'modified_on', modified_on cannot be nil.")
      end

      if @top.nil?
        invalid_properties.push("invalid value for 'top', top cannot be nil.")
      end

      if @left.nil?
        invalid_properties.push("invalid value for 'left', left cannot be nil.")
      end

      if @width.nil?
        invalid_properties.push("invalid value for 'width', width cannot be nil.")
      end

      if @height.nil?
        invalid_properties.push("invalid value for 'height', height cannot be nil.")
      end

      if @type.nil?
        invalid_properties.push("invalid value for 'type', type cannot be nil.")
      end

      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @signature_type.nil?
      signature_type_validator = EnumAttributeValidator.new('String', ["None", "Text", "Image", "Digital", "Barcode", "QRCode", "Stamp", "FormField", "Metadata"])
      return false unless signature_type_validator.valid?(@signature_type)
      return false if @is_signature.nil?
      return false if @created_on.nil?
      return false if @modified_on.nil?
      return false if @top.nil?
      return false if @left.nil?
      return false if @width.nil?
      return false if @height.nil?
      return false if @type.nil?
      type_validator = EnumAttributeValidator.new('String', ["Text", "Checkbox", "Combobox", "DigitalSignature", "Radio", "None"])
      return false unless type_validator.valid?(@type)
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
    # @param [Object] type Object to be assigned
    def type=(type)
      validator = EnumAttributeValidator.new('String', ["Text", "Checkbox", "Combobox", "DigitalSignature", "Radio", "None"])
      if type.to_i == 0
        unless validator.valid?(type)
          raise ArgumentError, "invalid value for 'type', must be one of #{validator.allowable_values}."
        end
        @type = type
      else
        @type = validator.allowable_values[type.to_i]
      end
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(other)
      return true if self.equal?(other)
      self.class == other.class &&
          signature_type == other.signature_type &&
          page_number == other.page_number &&
          signature_id == other.signature_id &&
          is_signature == other.is_signature &&
          created_on == other.created_on &&
          modified_on == other.modified_on &&
          top == other.top &&
          left == other.left &&
          width == other.width &&
          height == other.height &&
          name == other.name &&
          type == other.type &&
          selected == other.selected &&
          items == other.items
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [signature_type, page_number, signature_id, is_signature, created_on, modified_on, top, left, width, height, name, type, selected, items].hash
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
