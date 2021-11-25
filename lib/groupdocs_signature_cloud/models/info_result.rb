 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="info_result.rb">
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
  # Document info result
  class InfoResult

    # Input File info
    attr_accessor :file_info

    # Document extension
    attr_accessor :extension

    # Document file format
    attr_accessor :file_format

    # Document size in bytes
    attr_accessor :size

    # Count of pages in document
    attr_accessor :pages_count

    # Document created date
    attr_accessor :date_created

    # Document modification date
    attr_accessor :date_modified

    # Specifies width for max height of document page
    attr_accessor :width_for_max_height

    # Specifies max page height
    attr_accessor :max_page_height

    # List of document pages descriptions
    attr_accessor :pages

    # Collection of document signatures
    attr_accessor :signatures

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'file_info' => :'FileInfo',
        :'extension' => :'Extension',
        :'file_format' => :'FileFormat',
        :'size' => :'Size',
        :'pages_count' => :'PagesCount',
        :'date_created' => :'DateCreated',
        :'date_modified' => :'DateModified',
        :'width_for_max_height' => :'WidthForMaxHeight',
        :'max_page_height' => :'MaxPageHeight',
        :'pages' => :'Pages',
        :'signatures' => :'Signatures'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'file_info' => :'FileInfo',
        :'extension' => :'String',
        :'file_format' => :'String',
        :'size' => :'Integer',
        :'pages_count' => :'Integer',
        :'date_created' => :'DateTime',
        :'date_modified' => :'DateTime',
        :'width_for_max_height' => :'Integer',
        :'max_page_height' => :'Integer',
        :'pages' => :'Array<PageInfo>',
        :'signatures' => :'Array<Signature>'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.key?(:'FileInfo')
        self.file_info = attributes[:'FileInfo']
      end

      if attributes.key?(:'Extension')
        self.extension = attributes[:'Extension']
      end

      if attributes.key?(:'FileFormat')
        self.file_format = attributes[:'FileFormat']
      end

      if attributes.key?(:'Size')
        self.size = attributes[:'Size']
      end

      if attributes.key?(:'PagesCount')
        self.pages_count = attributes[:'PagesCount']
      end

      if attributes.key?(:'DateCreated')
        self.date_created = attributes[:'DateCreated']
      end

      if attributes.key?(:'DateModified')
        self.date_modified = attributes[:'DateModified']
      end

      if attributes.key?(:'WidthForMaxHeight')
        self.width_for_max_height = attributes[:'WidthForMaxHeight']
      end

      if attributes.key?(:'MaxPageHeight')
        self.max_page_height = attributes[:'MaxPageHeight']
      end

      if attributes.key?(:'Pages')
        if (value = attributes[:'Pages']).is_a?(Array)
          self.pages = value
        end
      end

      if attributes.key?(:'Signatures')
        if (value = attributes[:'Signatures']).is_a?(Array)
          self.signatures = value
        end
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = []
      if @size.nil?
        invalid_properties.push("invalid value for 'size', size cannot be nil.")
      end

      if @pages_count.nil?
        invalid_properties.push("invalid value for 'pages_count', pages_count cannot be nil.")
      end

      if @date_created.nil?
        invalid_properties.push("invalid value for 'date_created', date_created cannot be nil.")
      end

      if @date_modified.nil?
        invalid_properties.push("invalid value for 'date_modified', date_modified cannot be nil.")
      end

      if @width_for_max_height.nil?
        invalid_properties.push("invalid value for 'width_for_max_height', width_for_max_height cannot be nil.")
      end

      if @max_page_height.nil?
        invalid_properties.push("invalid value for 'max_page_height', max_page_height cannot be nil.")
      end

      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @size.nil?
      return false if @pages_count.nil?
      return false if @date_created.nil?
      return false if @date_modified.nil?
      return false if @width_for_max_height.nil?
      return false if @max_page_height.nil?
      return true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(other)
      return true if self.equal?(other)
      self.class == other.class &&
          file_info == other.file_info &&
          extension == other.extension &&
          file_format == other.file_format &&
          size == other.size &&
          pages_count == other.pages_count &&
          date_created == other.date_created &&
          date_modified == other.date_modified &&
          width_for_max_height == other.width_for_max_height &&
          max_page_height == other.max_page_height &&
          pages == other.pages &&
          signatures == other.signatures
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [file_info, extension, file_format, size, pages_count, date_created, date_modified, width_for_max_height, max_page_height, pages, signatures].hash
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
