# -----------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="preview.rb">
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
  class PreviewApi
    attr_accessor :config

    #make PreviewApi.new private 
    private_class_method :new

    # Initializes new instance of PreviewApi
    #
    # @param [config] Configuration 
    # @return [PreviewApi] New instance of PreviewApi
    def initialize(config)
      @config = config
      @api_client = ApiClient.new(config)
      @access_token = nil
    end

    # Initializes new instance of PreviewApi
    #
    # @param [app_sid] Application identifier (App SID)
    # @param [app_key] Application private key (App Key)
    # @return [PreviewApi] New instance of PreviewApi
    def self.from_keys(app_sid, app_key)
      config = Configuration.new(app_sid, app_key)
      return new(config)
    end

    # Initializes new instance of PreviewApi
    #
    # @param [config] Configuration 
    # @return [PreviewApi] New instance of PreviewApi
    def self.from_config(config)
      return new(config)
    end

    # Creates document preview images
    # 
    # @param request preview_document_request
    # @return [PreviewResult]
    def preview_document(request)
      data, _status_code, _headers = preview_document_with_http_info(request)
      data
    end

    # Creates document preview images
    # 
    # @param request preview_document_request
    # @return [Array<(PreviewResult, Fixnum, Hash)>]
    # PreviewResult data, response status code and response headers
    def preview_document_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PreviewDocumentRequest

      @api_client.config.logger.debug 'Calling API: PreviewApi.preview_document ...' if @api_client.config.debugging
      # verify the required parameter 'preview_settings' is set
      raise ArgumentError, 'Missing the required parameter preview_settings when calling PreviewApi.preview_document' if @api_client.config.client_side_validation && request.preview_settings.nil?
      # resource path
      local_var_path = '/signature/preview'

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
      post_body = @api_client.object_to_http_body(request.preview_settings)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'PreviewResult')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        PreviewApi#preview_document\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
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
 # <copyright company="Aspose Pty Ltd" file="preview_document_request.rb">
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
  # Request model for preview_document operation.
  #
  class PreviewDocumentRequest

        # Document preview settings
        attr_accessor :preview_settings
	
        #
        # Initializes a new instance.
        # @param preview_settings Document preview settings
        def initialize(preview_settings)
           self.preview_settings = preview_settings
        end
  end
end
