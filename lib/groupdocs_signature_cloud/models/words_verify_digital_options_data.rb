 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="words_verify_digital_options_data.rb">
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
  # Words Verify Digital Options - keeps options to verify Digital Signature of Words Documents.
  class WordsVerifyDigitalOptionsData

    # Valid property flag
    attr_accessor :is_valid

    # Document Page Number to be verified. If property is not set - all Pages of Document will be verified for first occurrence. Value is not supported for digital verification.
    attr_accessor :document_page_number

    # Page Options to specify pages to be verified. Value is not supported for digital verification.
    attr_accessor :pages_setup

    # Internal property that specify the name of Options.
    attr_accessor :options_type

    # Password of Digital Certificate if required
    attr_accessor :password

    # File Guid of Digital Certificate
    attr_accessor :certificate_guid

    # Comments of Digital Signature to validate.
    attr_accessor :comments

    # Date and time range of Digital Signature to validate. Null value will be ignored.
    attr_accessor :sign_date_time_from

    # Date and time range of Digital Signature to validate. Null value will be ignored.
    attr_accessor :sign_date_time_to

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'is_valid' => :'IsValid',
        :'document_page_number' => :'DocumentPageNumber',
        :'pages_setup' => :'PagesSetup',
        :'options_type' => :'OptionsType',
        :'password' => :'Password',
        :'certificate_guid' => :'CertificateGuid',
        :'comments' => :'Comments',
        :'sign_date_time_from' => :'SignDateTimeFrom',
        :'sign_date_time_to' => :'SignDateTimeTo'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'is_valid' => :'BOOLEAN',
        :'document_page_number' => :'Integer',
        :'pages_setup' => :'PagesSetupData',
        :'options_type' => :'String',
        :'password' => :'String',
        :'certificate_guid' => :'String',
        :'comments' => :'String',
        :'sign_date_time_from' => :'DateTime',
        :'sign_date_time_to' => :'DateTime'
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

      if attributes.key?(:'Password')
        self.password = attributes[:'Password']
      end

      if attributes.key?(:'CertificateGuid')
        self.certificate_guid = attributes[:'CertificateGuid']
      end

      if attributes.key?(:'Comments')
        self.comments = attributes[:'Comments']
      end

      if attributes.key?(:'SignDateTimeFrom')
        self.sign_date_time_from = attributes[:'SignDateTimeFrom']
      end

      if attributes.key?(:'SignDateTimeTo')
        self.sign_date_time_to = attributes[:'SignDateTimeTo']
      end

	  
	  if !((defined? options_type) == nil)
        self.options_type = "WordsVerifyDigitalOptionsData"
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
      return true
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
          password == other.password &&
          certificate_guid == other.certificate_guid &&
          comments == other.comments &&
          sign_date_time_from == other.sign_date_time_from &&
          sign_date_time_to == other.sign_date_time_to
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [is_valid, document_page_number, pages_setup, options_type, password, certificate_guid, comments, sign_date_time_from, sign_date_time_to].hash
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
