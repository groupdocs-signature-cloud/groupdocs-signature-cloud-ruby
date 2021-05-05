# -----------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="sign.rb">
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
# -----------------------------------------------------------------------------------

require 'uri'
require 'date'

module GroupDocsSignatureCloud
  #
  # GroupDocs.Signature Cloud API
  #
  class SignApi
    attr_accessor :config

    #make SignApi.new private 
    private_class_method :new

    # Initializes new instance of SignApi
    #
    # @param [config] Configuration 
    # @return [SignApi] New instance of SignApi
    def initialize(config)
      @config = config
      @api_client = ApiClient.new(config)
      @access_token = nil
    end

    # Initializes new instance of SignApi
    #
    # @param [app_sid] Application identifier (App SID)
    # @param [app_key] Application private key (App Key)
    # @return [SignApi] New instance of SignApi
    def self.from_keys(app_sid, app_key)
      config = Configuration.new(app_sid, app_key)
      return new(config)
    end

    # Initializes new instance of SignApi
    #
    # @param [config] Configuration 
    # @return [SignApi] New instance of SignApi
    def self.from_config(config)
      return new(config)
    end

    # Creates new signatures in the document and saves resultant document into 'Output' folder 
    # 
    # @param request create_signatures_request
    # @return [SignResult]
    def create_signatures(request)
      data, _status_code, _headers = create_signatures_with_http_info(request)
      data
    end

    # Creates new signatures in the document and saves resultant document into &#39;Output&#39; folder 
    # 
    # @param request create_signatures_request
    # @return [Array<(SignResult, Fixnum, Hash)>]
    # SignResult data, response status code and response headers
    def create_signatures_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? CreateSignaturesRequest

      @api_client.config.logger.debug 'Calling API: SignApi.create_signatures ...' if @api_client.config.debugging
      # verify the required parameter 'sign_settings' is set
      raise ArgumentError, 'Missing the required parameter sign_settings when calling SignApi.create_signatures' if @api_client.config.client_side_validation && request.sign_settings.nil?
      # resource path
      local_var_path = '/signature/create'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.sign_settings)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'SignResult')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignApi#create_signatures\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Deletes signatures in the document
    # 
    # @param request delete_signatures_request
    # @return [DeleteResult]
    def delete_signatures(request)
      data, _status_code, _headers = delete_signatures_with_http_info(request)
      data
    end

    # Deletes signatures in the document
    # 
    # @param request delete_signatures_request
    # @return [Array<(DeleteResult, Fixnum, Hash)>]
    # DeleteResult data, response status code and response headers
    def delete_signatures_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteSignaturesRequest

      @api_client.config.logger.debug 'Calling API: SignApi.delete_signatures ...' if @api_client.config.debugging
      # verify the required parameter 'delete_settings' is set
      raise ArgumentError, 'Missing the required parameter delete_settings when calling SignApi.delete_signatures' if @api_client.config.client_side_validation && request.delete_settings.nil?
      # resource path
      local_var_path = '/signature/delete'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.delete_settings)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'DeleteResult')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignApi#delete_signatures\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Searches for signatures applied to the document
    # 
    # @param request search_signatures_request
    # @return [SearchResult]
    def search_signatures(request)
      data, _status_code, _headers = search_signatures_with_http_info(request)
      data
    end

    # Searches for signatures applied to the document
    # 
    # @param request search_signatures_request
    # @return [Array<(SearchResult, Fixnum, Hash)>]
    # SearchResult data, response status code and response headers
    def search_signatures_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? SearchSignaturesRequest

      @api_client.config.logger.debug 'Calling API: SignApi.search_signatures ...' if @api_client.config.debugging
      # verify the required parameter 'search_settings' is set
      raise ArgumentError, 'Missing the required parameter search_settings when calling SignApi.search_signatures' if @api_client.config.client_side_validation && request.search_settings.nil?
      # resource path
      local_var_path = '/signature/search'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.search_settings)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'SearchResult')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignApi#search_signatures\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Updates signatures in the document
    # 
    # @param request update_signatures_request
    # @return [UpdateResult]
    def update_signatures(request)
      data, _status_code, _headers = update_signatures_with_http_info(request)
      data
    end

    # Updates signatures in the document
    # 
    # @param request update_signatures_request
    # @return [Array<(UpdateResult, Fixnum, Hash)>]
    # UpdateResult data, response status code and response headers
    def update_signatures_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateSignaturesRequest

      @api_client.config.logger.debug 'Calling API: SignApi.update_signatures ...' if @api_client.config.debugging
      # verify the required parameter 'update_settings' is set
      raise ArgumentError, 'Missing the required parameter update_settings when calling SignApi.update_signatures' if @api_client.config.client_side_validation && request.update_settings.nil?
      # resource path
      local_var_path = '/signature/update'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.update_settings)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'UpdateResult')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignApi#update_signatures\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Verifies whether document contains signatures that meet the specified criteria
    # 
    # @param request verify_signatures_request
    # @return [VerifyResult]
    def verify_signatures(request)
      data, _status_code, _headers = verify_signatures_with_http_info(request)
      data
    end

    # Verifies whether document contains signatures that meet the specified criteria
    # 
    # @param request verify_signatures_request
    # @return [Array<(VerifyResult, Fixnum, Hash)>]
    # VerifyResult data, response status code and response headers
    def verify_signatures_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? VerifySignaturesRequest

      @api_client.config.logger.debug 'Calling API: SignApi.verify_signatures ...' if @api_client.config.debugging
      # verify the required parameter 'verify_settings' is set
      raise ArgumentError, 'Missing the required parameter verify_settings when calling SignApi.verify_signatures' if @api_client.config.client_side_validation && request.verify_settings.nil?
      # resource path
      local_var_path = '/signature/verify'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.verify_settings)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'VerifyResult')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignApi#verify_signatures\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    #
    # Helper method to convert first letter to downcase
    #
    private def downcase_first_letter(str)
      value = str[0].downcase + str[1..-1]
      value
    end
                 
    #
    # Retrieves access token
    #
    private def get_access_token
        if @access_token.nil? then
          request_access_token
        end
        
        @access_token  
    end

    #
    # Gets a access token from server
    #
    private def request_access_token
        auth_config = Configuration.new(@config.app_sid, @config.app_key)
        auth_config.api_base_url = @config.api_base_url
        auth_config.debugging = @config.debugging
        auth_config.logger = @config.logger
        auth_config.temp_folder_path = @config.temp_folder_path
        auth_config.client_side_validation = @config.client_side_validation
        auth_config.api_version = ''

        auth_api_client = ApiClient.new(auth_config)

        request_url = "/connect/token"
        post_data = "grant_type=client_credentials&client_id=#{@config.app_sid}&client_secret=#{@config.app_key}"

        data, _status_code, _header = auth_api_client.call_api(:POST, request_url, :body => post_data, :return_type => 'Object')
        
        @access_token = data[:access_token]

        expires_in_seconds = data[:expires_in].to_i - 5 * 60 
        expires_in_days = Rational(expires_in_seconds, 60 * 60 * 24)
        @access_token_expires_at = DateTime.now + expires_in_days
    end
    
    # requires all files inside a directory from current dir
    # @param _dir can be relative path like '/lib' or "../lib"
    private def require_all(_dir)
      Dir[File.expand_path(File.join(File.dirname(File.absolute_path(__FILE__)), _dir)) + "/*.rb"].each do |file|
        require file
      end
    end
  end
end
 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="create_signatures_request.rb">
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

module GroupDocsSignatureCloud

  #
  # Request model for create_signatures operation.
  #
  class CreateSignaturesRequest

        # Document sign settings
        attr_accessor :sign_settings
	
        #
        # Initializes a new instance.
        # @param sign_settings Document sign settings
        def initialize(sign_settings)
           self.sign_settings = sign_settings
        end
  end
end
 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="delete_signatures_request.rb">
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

module GroupDocsSignatureCloud

  #
  # Request model for delete_signatures operation.
  #
  class DeleteSignaturesRequest

        # Delete signatures settings
        attr_accessor :delete_settings
	
        #
        # Initializes a new instance.
        # @param delete_settings Delete signatures settings
        def initialize(delete_settings)
           self.delete_settings = delete_settings
        end
  end
end
 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="search_signatures_request.rb">
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

module GroupDocsSignatureCloud

  #
  # Request model for search_signatures operation.
  #
  class SearchSignaturesRequest

        # Signatures search settings
        attr_accessor :search_settings
	
        #
        # Initializes a new instance.
        # @param search_settings Signatures search settings
        def initialize(search_settings)
           self.search_settings = search_settings
        end
  end
end
 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="update_signatures_request.rb">
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

module GroupDocsSignatureCloud

  #
  # Request model for update_signatures operation.
  #
  class UpdateSignaturesRequest

        # Update signatures settings
        attr_accessor :update_settings
	
        #
        # Initializes a new instance.
        # @param update_settings Update signatures settings
        def initialize(update_settings)
           self.update_settings = update_settings
        end
  end
end
 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="verify_signatures_request.rb">
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

module GroupDocsSignatureCloud

  #
  # Request model for verify_signatures operation.
  #
  class VerifySignaturesRequest

        # Settings that includes different criteria to verify document signatures
        attr_accessor :verify_settings
	
        #
        # Initializes a new instance.
        # @param verify_settings Settings that includes different criteria to verify document signatures
        def initialize(verify_settings)
           self.verify_settings = verify_settings
        end
  end
end
