 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="pdf_verify_text_options_data.rb">
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
  # Pdf Verify Text Options - keeps options to verify Text Signature of Pdf Document
  class PdfVerifyTextOptionsData

    # Valid property flag
    attr_accessor :is_valid

    # Document Page Number to be verified. If property is not set - all Pages of Document will be verified for first occurrence.
    attr_accessor :document_page_number

    # Page Options to specify pages to be verified.
    attr_accessor :pages_setup

    # Internal property that specify the name of Options.
    attr_accessor :options_type

    # Specify Signature Text if it should be verified.
    attr_accessor :text

    # Flag to verify each Document Page.
    attr_accessor :verify_all_pages

    # Specify Text Signature ID more than zero if it should be verified
    attr_accessor :signature_id

    # Type of Signature to be verified
    attr_accessor :signature_implementation
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
        :'is_valid' => :'IsValid',
        :'document_page_number' => :'DocumentPageNumber',
        :'pages_setup' => :'PagesSetup',
        :'options_type' => :'OptionsType',
        :'text' => :'Text',
        :'verify_all_pages' => :'VerifyAllPages',
        :'signature_id' => :'SignatureID',
        :'signature_implementation' => :'SignatureImplementation'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'is_valid' => :'BOOLEAN',
        :'document_page_number' => :'Integer',
        :'pages_setup' => :'PagesSetupData',
        :'options_type' => :'String',
        :'text' => :'String',
        :'verify_all_pages' => :'BOOLEAN',
        :'signature_id' => :'Integer',
        :'signature_implementation' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.key?(:'IsValid')
        self.is_valid = attributes[:'IsValid']
      end

      if attributes.key?(:'DocumentPageNumber')
        self.document_page_number = attributes[:'DocumentPageNumber']
      end

      if attributes.key?(:'PagesSetup')
        self.pages_setup = attributes[:'PagesSetup']
      end

      if attributes.key?(:'OptionsType')
        self.options_type = attributes[:'OptionsType']
      end

      if attributes.key?(:'Text')
        self.text = attributes[:'Text']
      end

      if attributes.key?(:'VerifyAllPages')
        self.verify_all_pages = attributes[:'VerifyAllPages']
      end

      if attributes.key?(:'SignatureID')
        self.signature_id = attributes[:'SignatureID']
      end

      if attributes.key?(:'SignatureImplementation')
        self.signature_implementation = attributes[:'SignatureImplementation']
      end

	  
	  if !((defined? options_type) == nil)
        self.options_type = "PdfVerifyTextOptionsData"
      end
	  
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = []
      if @is_valid.nil?
        invalid_properties.push("invalid value for 'is_valid', is_valid cannot be nil.")
      end

      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @is_valid.nil?
      signature_implementation_validator = EnumAttributeValidator.new('String', ["Stamp", "Image", "Annotation", "Sticker", "TextToFormField", "Watermark"])
      return false unless signature_implementation_validator.valid?(@signature_implementation)
      return true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] signature_implementation Object to be assigned
    def signature_implementation=(signature_implementation)
      validator = EnumAttributeValidator.new('String', ["Stamp", "Image", "Annotation", "Sticker", "TextToFormField", "Watermark"])
      if signature_implementation.to_i == 0
        unless validator.valid?(signature_implementation)
          raise ArgumentError, "invalid value for 'signature_implementation', must be one of #{validator.allowable_values}."
        end
        @signature_implementation = signature_implementation
      else
        @signature_implementation = validator.allowable_values[signature_implementation.to_i]
      end
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(other)
      return true if self.equal?(other)
      self.class == other.class &&
          is_valid == other.is_valid &&
          document_page_number == other.document_page_number &&
          pages_setup == other.pages_setup &&
          options_type == other.options_type &&
          text == other.text &&
          verify_all_pages == other.verify_all_pages &&
          signature_id == other.signature_id &&
          signature_implementation == other.signature_implementation
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [is_valid, document_page_number, pages_setup, options_type, text, verify_all_pages, signature_id, signature_implementation].hash
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
