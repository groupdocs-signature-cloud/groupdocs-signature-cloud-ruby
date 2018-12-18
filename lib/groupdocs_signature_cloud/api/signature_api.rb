# -----------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="signature.rb">
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
# -----------------------------------------------------------------------------------

require 'uri'
require 'date'
require_relative '../api_client'

module GroupDocsSignatureCloud
  #
  # GroupDocs.Signature Cloud API
  #
  class SignatureApi
    include GroupDocsSignatureCloud

    attr_accessor :config
	attr_accessor :api_client
    attr_accessor :access_token

    # Initializes new instance of SignatureApi
    #
    # @param [config] Configuration 
    # @return [SignatureApi] New instance of SignatureApi
    def initialize(config)
      @config = config
      @api_client = ApiClient.new(config)
      require_all '../models/requests'

      @access_token = nil
    end

    # Initializes new instance of SignatureApi
    #
    # @param [app_sid] Application identifier (App SID)
    # @param [app_key] Application private key (App Key)
    # @return [SignatureApi] New instance of SignatureApi
    def self.from_keys(app_sid, app_key)
      config = Configuration.new(app_sid, app_key)
      return new(config)
    end

    # Initializes new instance of SignatureApi
    #
    # @param [config] Configuration 
    # @return [SignatureApi] New instance of SignatureApi
    def self.from_config(config)
      return new(config)
    end

    # Retrieves list of supported Barcode type names.
    # 
    # @return [BarcodeCollection]
    def get_barcodes()
      data, _status_code, _headers = get_barcodes_with_http_info()
      data
    end

    # Retrieves list of supported Barcode type names.
    # 
    
    # @return [Array<(BarcodeCollection, Fixnum, Hash)>]
    # BarcodeCollection data, response status code and response headers
    def get_barcodes_with_http_info()
      

      @api_client.config.logger.debug 'Calling API: SignatureApi.get_barcodes ...' if @api_client.config.debugging
      # resource path
      local_var_path = '/signature/barcodes'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'BarcodeCollection')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#get_barcodes\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Retrieves document information.
    # 
    # @param request GetDocumentInfoRequest
    # @return [DocumentInfo]
    def get_document_info(request)
      data, _status_code, _headers = get_document_info_with_http_info(request)
      data
    end

    # Retrieves document information.
    # 
    # @param request GetDocumentInfoRequest
    # @return [Array<(DocumentInfo, Fixnum, Hash)>]
    # DocumentInfo data, response status code and response headers
    def get_document_info_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? GetDocumentInfoRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.get_document_info ...' if @api_client.config.debugging
      # verify the required parameter 'file_name' is set
      raise ArgumentError, 'Missing the required parameter file_name when calling SignatureApi.get_document_info' if @api_client.config.client_side_validation && request.file_name.nil?
      # resource path
      local_var_path = '/signature/{fileName}/document/info'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('FileName') + '}', request.file_name.to_s)

      # query parameters
      query_params = {}
      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Folder') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Folder') + '}', request.folder.to_s)
      else
        query_params[downcase_first_letter('Folder')] = request.folder unless request.folder.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'DocumentInfo')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#get_document_info\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Retrieves document information for document at provided URL. Retrieves file from specified URL and tries to detect file type when fileName parameter is not specified. Saves retrieved file in storage. Use fileName and folder parameters to specify desired file name and folder to save file. When file with specified name already exists in storage new unique file name will be used for file.
    # 
    # @param request GetDocumentInfoFromUrlRequest
    # @return [DocumentInfo]
    def get_document_info_from_url(request)
      data, _status_code, _headers = get_document_info_from_url_with_http_info(request)
      data
    end

    # Retrieves document information for document at provided URL. Retrieves file from specified URL and tries to detect file type when fileName parameter is not specified. Saves retrieved file in storage. Use fileName and folder parameters to specify desired file name and folder to save file. When file with specified name already exists in storage new unique file name will be used for file.
    # 
    # @param request GetDocumentInfoFromUrlRequest
    # @return [Array<(DocumentInfo, Fixnum, Hash)>]
    # DocumentInfo data, response status code and response headers
    def get_document_info_from_url_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? GetDocumentInfoFromUrlRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.get_document_info_from_url ...' if @api_client.config.debugging
      # verify the required parameter 'url' is set
      raise ArgumentError, 'Missing the required parameter url when calling SignatureApi.get_document_info_from_url' if @api_client.config.client_side_validation && request.url.nil?
      # resource path
      local_var_path = '/signature/document/info'

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('Url')] = request.url

      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'DocumentInfo')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#get_document_info_from_url\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Retrieves list of supported QR-Code type names.
    # 
    # @return [QRCodeCollection]
    def get_qr_codes()
      data, _status_code, _headers = get_qr_codes_with_http_info()
      data
    end

    # Retrieves list of supported QR-Code type names.
    # 
    
    # @return [Array<(QRCodeCollection, Fixnum, Hash)>]
    # QRCodeCollection data, response status code and response headers
    def get_qr_codes_with_http_info()
      

      @api_client.config.logger.debug 'Calling API: SignatureApi.get_qr_codes ...' if @api_client.config.debugging
      # resource path
      local_var_path = '/signature/qrcodes'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'QRCodeCollection')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#get_qr_codes\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Lists supported file formats.
    # 
    # @return [FormatCollection]
    def get_supported_formats()
      data, _status_code, _headers = get_supported_formats_with_http_info()
      data
    end

    # Lists supported file formats.
    # 
    
    # @return [Array<(FormatCollection, Fixnum, Hash)>]
    # FormatCollection data, response status code and response headers
    def get_supported_formats_with_http_info()
      

      @api_client.config.logger.debug 'Calling API: SignatureApi.get_supported_formats ...' if @api_client.config.debugging
      # resource path
      local_var_path = '/signature/formats'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'FormatCollection')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#get_supported_formats\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Insert Barcode Signature into the Document
    # 
    # @param request PostBarcodeRequest
    # @return [SignatureDocumentResponse]
    def post_barcode(request)
      data, _status_code, _headers = post_barcode_with_http_info(request)
      data
    end

    # Insert Barcode Signature into the Document
    # 
    # @param request PostBarcodeRequest
    # @return [Array<(SignatureDocumentResponse, Fixnum, Hash)>]
    # SignatureDocumentResponse data, response status code and response headers
    def post_barcode_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostBarcodeRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_barcode ...' if @api_client.config.debugging
      # verify the required parameter 'name' is set
      raise ArgumentError, 'Missing the required parameter name when calling SignatureApi.post_barcode' if @api_client.config.client_side_validation && request.name.nil?
      # resource path
      local_var_path = '/signature/{name}/barcode'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('Name') + '}', request.name.to_s)

      # query parameters
      query_params = {}
      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Folder') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Folder') + '}', request.folder.to_s)
      else
        query_params[downcase_first_letter('Folder')] = request.folder unless request.folder.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.sign_options_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'SignatureDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_barcode\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Insert Barcode Signature into the Document provided by URL
    # 
    # @param request PostBarcodeFromUrlRequest
    # @return [SignatureDocumentResponse]
    def post_barcode_from_url(request)
      data, _status_code, _headers = post_barcode_from_url_with_http_info(request)
      data
    end

    # Insert Barcode Signature into the Document provided by URL
    # 
    # @param request PostBarcodeFromUrlRequest
    # @return [Array<(SignatureDocumentResponse, Fixnum, Hash)>]
    # SignatureDocumentResponse data, response status code and response headers
    def post_barcode_from_url_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostBarcodeFromUrlRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_barcode_from_url ...' if @api_client.config.debugging
      # verify the required parameter 'url' is set
      raise ArgumentError, 'Missing the required parameter url when calling SignatureApi.post_barcode_from_url' if @api_client.config.client_side_validation && request.url.nil?
      # resource path
      local_var_path = '/signature/barcode'

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('Url')] = request.url

      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.sign_options_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'SignatureDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_barcode_from_url\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Insert Signature into the Document
    # 
    # @param request PostCollectionRequest
    # @return [SignatureDocumentResponse]
    def post_collection(request)
      data, _status_code, _headers = post_collection_with_http_info(request)
      data
    end

    # Insert Signature into the Document
    # 
    # @param request PostCollectionRequest
    # @return [Array<(SignatureDocumentResponse, Fixnum, Hash)>]
    # SignatureDocumentResponse data, response status code and response headers
    def post_collection_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostCollectionRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_collection ...' if @api_client.config.debugging
      # verify the required parameter 'name' is set
      raise ArgumentError, 'Missing the required parameter name when calling SignatureApi.post_collection' if @api_client.config.client_side_validation && request.name.nil?
      # resource path
      local_var_path = '/signature/{name}/collection'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('Name') + '}', request.name.to_s)

      # query parameters
      query_params = {}
      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Folder') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Folder') + '}', request.folder.to_s)
      else
        query_params[downcase_first_letter('Folder')] = request.folder unless request.folder.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.sign_options_collection_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'SignatureDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_collection\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Insert Stamp Signature into the Document provided by URL
    # 
    # @param request PostCollectionFromUrlRequest
    # @return [SignatureDocumentResponse]
    def post_collection_from_url(request)
      data, _status_code, _headers = post_collection_from_url_with_http_info(request)
      data
    end

    # Insert Stamp Signature into the Document provided by URL
    # 
    # @param request PostCollectionFromUrlRequest
    # @return [Array<(SignatureDocumentResponse, Fixnum, Hash)>]
    # SignatureDocumentResponse data, response status code and response headers
    def post_collection_from_url_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostCollectionFromUrlRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_collection_from_url ...' if @api_client.config.debugging
      # verify the required parameter 'url' is set
      raise ArgumentError, 'Missing the required parameter url when calling SignatureApi.post_collection_from_url' if @api_client.config.client_side_validation && request.url.nil?
      # resource path
      local_var_path = '/signature/collection'

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('Url')] = request.url

      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.sign_options_collection_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'SignatureDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_collection_from_url\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Insert Digital Signature into the Document
    # 
    # @param request PostDigitalRequest
    # @return [SignatureDocumentResponse]
    def post_digital(request)
      data, _status_code, _headers = post_digital_with_http_info(request)
      data
    end

    # Insert Digital Signature into the Document
    # 
    # @param request PostDigitalRequest
    # @return [Array<(SignatureDocumentResponse, Fixnum, Hash)>]
    # SignatureDocumentResponse data, response status code and response headers
    def post_digital_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostDigitalRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_digital ...' if @api_client.config.debugging
      # verify the required parameter 'name' is set
      raise ArgumentError, 'Missing the required parameter name when calling SignatureApi.post_digital' if @api_client.config.client_side_validation && request.name.nil?
      # resource path
      local_var_path = '/signature/{name}/digital'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('Name') + '}', request.name.to_s)

      # query parameters
      query_params = {}
      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Folder') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Folder') + '}', request.folder.to_s)
      else
        query_params[downcase_first_letter('Folder')] = request.folder unless request.folder.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('CertificateFile') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('CertificateFile') + '}', request.certificate_file.to_s)
      else
        query_params[downcase_first_letter('CertificateFile')] = request.certificate_file unless request.certificate_file.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('ImageFile') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('ImageFile') + '}', request.image_file.to_s)
      else
        query_params[downcase_first_letter('ImageFile')] = request.image_file unless request.image_file.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.sign_options_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'SignatureDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_digital\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Insert Digital Signature into the Document
    # 
    # @param request PostDigitalFromUrlRequest
    # @return [SignatureDocumentResponse]
    def post_digital_from_url(request)
      data, _status_code, _headers = post_digital_from_url_with_http_info(request)
      data
    end

    # Insert Digital Signature into the Document
    # 
    # @param request PostDigitalFromUrlRequest
    # @return [Array<(SignatureDocumentResponse, Fixnum, Hash)>]
    # SignatureDocumentResponse data, response status code and response headers
    def post_digital_from_url_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostDigitalFromUrlRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_digital_from_url ...' if @api_client.config.debugging
      # verify the required parameter 'url' is set
      raise ArgumentError, 'Missing the required parameter url when calling SignatureApi.post_digital_from_url' if @api_client.config.client_side_validation && request.url.nil?
      # resource path
      local_var_path = '/signature/digital'

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('Url')] = request.url

      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('CertificateFile') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('CertificateFile') + '}', request.certificate_file.to_s)
      else
        query_params[downcase_first_letter('CertificateFile')] = request.certificate_file unless request.certificate_file.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('ImageFile') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('ImageFile') + '}', request.image_file.to_s)
      else
        query_params[downcase_first_letter('ImageFile')] = request.image_file unless request.image_file.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.sign_options_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'SignatureDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_digital_from_url\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Insert Image Signature into the Document
    # 
    # @param request PostImageRequest
    # @return [SignatureDocumentResponse]
    def post_image(request)
      data, _status_code, _headers = post_image_with_http_info(request)
      data
    end

    # Insert Image Signature into the Document
    # 
    # @param request PostImageRequest
    # @return [Array<(SignatureDocumentResponse, Fixnum, Hash)>]
    # SignatureDocumentResponse data, response status code and response headers
    def post_image_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostImageRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_image ...' if @api_client.config.debugging
      # verify the required parameter 'name' is set
      raise ArgumentError, 'Missing the required parameter name when calling SignatureApi.post_image' if @api_client.config.client_side_validation && request.name.nil?
      # resource path
      local_var_path = '/signature/{name}/image'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('Name') + '}', request.name.to_s)

      # query parameters
      query_params = {}
      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Folder') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Folder') + '}', request.folder.to_s)
      else
        query_params[downcase_first_letter('Folder')] = request.folder unless request.folder.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Image') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Image') + '}', request.image.to_s)
      else
        query_params[downcase_first_letter('Image')] = request.image unless request.image.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.sign_options_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'SignatureDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_image\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Insert Image Signature into the Document provided by URL
    # 
    # @param request PostImageFromUrlRequest
    # @return [SignatureDocumentResponse]
    def post_image_from_url(request)
      data, _status_code, _headers = post_image_from_url_with_http_info(request)
      data
    end

    # Insert Image Signature into the Document provided by URL
    # 
    # @param request PostImageFromUrlRequest
    # @return [Array<(SignatureDocumentResponse, Fixnum, Hash)>]
    # SignatureDocumentResponse data, response status code and response headers
    def post_image_from_url_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostImageFromUrlRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_image_from_url ...' if @api_client.config.debugging
      # verify the required parameter 'url' is set
      raise ArgumentError, 'Missing the required parameter url when calling SignatureApi.post_image_from_url' if @api_client.config.client_side_validation && request.url.nil?
      # resource path
      local_var_path = '/signature/image'

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('Url')] = request.url

      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Image') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Image') + '}', request.image.to_s)
      else
        query_params[downcase_first_letter('Image')] = request.image unless request.image.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.sign_options_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'SignatureDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_image_from_url\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Insert QRCode Signature into the Document
    # 
    # @param request PostQrCodeRequest
    # @return [SignatureDocumentResponse]
    def post_qr_code(request)
      data, _status_code, _headers = post_qr_code_with_http_info(request)
      data
    end

    # Insert QRCode Signature into the Document
    # 
    # @param request PostQrCodeRequest
    # @return [Array<(SignatureDocumentResponse, Fixnum, Hash)>]
    # SignatureDocumentResponse data, response status code and response headers
    def post_qr_code_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostQrCodeRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_qr_code ...' if @api_client.config.debugging
      # verify the required parameter 'name' is set
      raise ArgumentError, 'Missing the required parameter name when calling SignatureApi.post_qr_code' if @api_client.config.client_side_validation && request.name.nil?
      # resource path
      local_var_path = '/signature/{name}/qrcode'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('Name') + '}', request.name.to_s)

      # query parameters
      query_params = {}
      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Folder') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Folder') + '}', request.folder.to_s)
      else
        query_params[downcase_first_letter('Folder')] = request.folder unless request.folder.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.sign_options_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'SignatureDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_qr_code\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Insert QRCode Signature into the Document provided by URL
    # 
    # @param request PostQrCodeFromUrlRequest
    # @return [SignatureDocumentResponse]
    def post_qr_code_from_url(request)
      data, _status_code, _headers = post_qr_code_from_url_with_http_info(request)
      data
    end

    # Insert QRCode Signature into the Document provided by URL
    # 
    # @param request PostQrCodeFromUrlRequest
    # @return [Array<(SignatureDocumentResponse, Fixnum, Hash)>]
    # SignatureDocumentResponse data, response status code and response headers
    def post_qr_code_from_url_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostQrCodeFromUrlRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_qr_code_from_url ...' if @api_client.config.debugging
      # verify the required parameter 'url' is set
      raise ArgumentError, 'Missing the required parameter url when calling SignatureApi.post_qr_code_from_url' if @api_client.config.client_side_validation && request.url.nil?
      # resource path
      local_var_path = '/signature/qrcode'

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('Url')] = request.url

      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.sign_options_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'SignatureDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_qr_code_from_url\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Search the Document with Barcode Signatures
    # 
    # @param request PostSearchBarcodeRequest
    # @return [SearchDocumentResponse]
    def post_search_barcode(request)
      data, _status_code, _headers = post_search_barcode_with_http_info(request)
      data
    end

    # Search the Document with Barcode Signatures
    # 
    # @param request PostSearchBarcodeRequest
    # @return [Array<(SearchDocumentResponse, Fixnum, Hash)>]
    # SearchDocumentResponse data, response status code and response headers
    def post_search_barcode_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostSearchBarcodeRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_search_barcode ...' if @api_client.config.debugging
      # verify the required parameter 'name' is set
      raise ArgumentError, 'Missing the required parameter name when calling SignatureApi.post_search_barcode' if @api_client.config.client_side_validation && request.name.nil?
      # resource path
      local_var_path = '/signature/{name}/barcode/search'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('Name') + '}', request.name.to_s)

      # query parameters
      query_params = {}
      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Folder') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Folder') + '}', request.folder.to_s)
      else
        query_params[downcase_first_letter('Folder')] = request.folder unless request.folder.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.search_options_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'SearchDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_search_barcode\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Search the url based Document with Barcode Signatures
    # 
    # @param request PostSearchBarcodeFromUrlRequest
    # @return [SearchDocumentResponse]
    def post_search_barcode_from_url(request)
      data, _status_code, _headers = post_search_barcode_from_url_with_http_info(request)
      data
    end

    # Search the url based Document with Barcode Signatures
    # 
    # @param request PostSearchBarcodeFromUrlRequest
    # @return [Array<(SearchDocumentResponse, Fixnum, Hash)>]
    # SearchDocumentResponse data, response status code and response headers
    def post_search_barcode_from_url_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostSearchBarcodeFromUrlRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_search_barcode_from_url ...' if @api_client.config.debugging
      # verify the required parameter 'url' is set
      raise ArgumentError, 'Missing the required parameter url when calling SignatureApi.post_search_barcode_from_url' if @api_client.config.client_side_validation && request.url.nil?
      # resource path
      local_var_path = '/signature/barcode/search'

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('Url')] = request.url

      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.search_options_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'SearchDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_search_barcode_from_url\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Search the Document.
    # 
    # @param request PostSearchCollectionRequest
    # @return [SearchDocumentResponse]
    def post_search_collection(request)
      data, _status_code, _headers = post_search_collection_with_http_info(request)
      data
    end

    # Search the Document.
    # 
    # @param request PostSearchCollectionRequest
    # @return [Array<(SearchDocumentResponse, Fixnum, Hash)>]
    # SearchDocumentResponse data, response status code and response headers
    def post_search_collection_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostSearchCollectionRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_search_collection ...' if @api_client.config.debugging
      # verify the required parameter 'name' is set
      raise ArgumentError, 'Missing the required parameter name when calling SignatureApi.post_search_collection' if @api_client.config.client_side_validation && request.name.nil?
      # resource path
      local_var_path = '/signature/{name}/collection/search'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('Name') + '}', request.name.to_s)

      # query parameters
      query_params = {}
      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Folder') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Folder') + '}', request.folder.to_s)
      else
        query_params[downcase_first_letter('Folder')] = request.folder unless request.folder.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.search_options_collection_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'SearchDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_search_collection\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Search the Document provided by URL.
    # 
    # @param request PostSearchCollectionFromUrlRequest
    # @return [SearchDocumentResponse]
    def post_search_collection_from_url(request)
      data, _status_code, _headers = post_search_collection_from_url_with_http_info(request)
      data
    end

    # Search the Document provided by URL.
    # 
    # @param request PostSearchCollectionFromUrlRequest
    # @return [Array<(SearchDocumentResponse, Fixnum, Hash)>]
    # SearchDocumentResponse data, response status code and response headers
    def post_search_collection_from_url_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostSearchCollectionFromUrlRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_search_collection_from_url ...' if @api_client.config.debugging
      # verify the required parameter 'url' is set
      raise ArgumentError, 'Missing the required parameter url when calling SignatureApi.post_search_collection_from_url' if @api_client.config.client_side_validation && request.url.nil?
      # resource path
      local_var_path = '/signature/collection/search'

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('Url')] = request.url

      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.search_options_collection_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'SearchDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_search_collection_from_url\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Search the Document with Digital Signatures
    # 
    # @param request PostSearchDigitalRequest
    # @return [SearchDocumentResponse]
    def post_search_digital(request)
      data, _status_code, _headers = post_search_digital_with_http_info(request)
      data
    end

    # Search the Document with Digital Signatures
    # 
    # @param request PostSearchDigitalRequest
    # @return [Array<(SearchDocumentResponse, Fixnum, Hash)>]
    # SearchDocumentResponse data, response status code and response headers
    def post_search_digital_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostSearchDigitalRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_search_digital ...' if @api_client.config.debugging
      # verify the required parameter 'name' is set
      raise ArgumentError, 'Missing the required parameter name when calling SignatureApi.post_search_digital' if @api_client.config.client_side_validation && request.name.nil?
      # resource path
      local_var_path = '/signature/{name}/digital/search'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('Name') + '}', request.name.to_s)

      # query parameters
      query_params = {}
      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Folder') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Folder') + '}', request.folder.to_s)
      else
        query_params[downcase_first_letter('Folder')] = request.folder unless request.folder.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.search_options_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'SearchDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_search_digital\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Search the Document from url with Digital Signatures
    # 
    # @param request PostSearchDigitalFromUrlRequest
    # @return [SearchDocumentResponse]
    def post_search_digital_from_url(request)
      data, _status_code, _headers = post_search_digital_from_url_with_http_info(request)
      data
    end

    # Search the Document from url with Digital Signatures
    # 
    # @param request PostSearchDigitalFromUrlRequest
    # @return [Array<(SearchDocumentResponse, Fixnum, Hash)>]
    # SearchDocumentResponse data, response status code and response headers
    def post_search_digital_from_url_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostSearchDigitalFromUrlRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_search_digital_from_url ...' if @api_client.config.debugging
      # verify the required parameter 'url' is set
      raise ArgumentError, 'Missing the required parameter url when calling SignatureApi.post_search_digital_from_url' if @api_client.config.client_side_validation && request.url.nil?
      # resource path
      local_var_path = '/signature/digital/search'

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('Url')] = request.url

      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.search_options_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'SearchDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_search_digital_from_url\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Search the Document with QRCode Signatures
    # 
    # @param request PostSearchQrCodeRequest
    # @return [SearchDocumentResponse]
    def post_search_qr_code(request)
      data, _status_code, _headers = post_search_qr_code_with_http_info(request)
      data
    end

    # Search the Document with QRCode Signatures
    # 
    # @param request PostSearchQrCodeRequest
    # @return [Array<(SearchDocumentResponse, Fixnum, Hash)>]
    # SearchDocumentResponse data, response status code and response headers
    def post_search_qr_code_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostSearchQrCodeRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_search_qr_code ...' if @api_client.config.debugging
      # verify the required parameter 'name' is set
      raise ArgumentError, 'Missing the required parameter name when calling SignatureApi.post_search_qr_code' if @api_client.config.client_side_validation && request.name.nil?
      # resource path
      local_var_path = '/signature/{name}/qrcode/search'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('Name') + '}', request.name.to_s)

      # query parameters
      query_params = {}
      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Folder') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Folder') + '}', request.folder.to_s)
      else
        query_params[downcase_first_letter('Folder')] = request.folder unless request.folder.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.search_options_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'SearchDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_search_qr_code\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Search the url based Document with QRCode Signatures
    # 
    # @param request PostSearchQrCodeFromUrlRequest
    # @return [SearchDocumentResponse]
    def post_search_qr_code_from_url(request)
      data, _status_code, _headers = post_search_qr_code_from_url_with_http_info(request)
      data
    end

    # Search the url based Document with QRCode Signatures
    # 
    # @param request PostSearchQrCodeFromUrlRequest
    # @return [Array<(SearchDocumentResponse, Fixnum, Hash)>]
    # SearchDocumentResponse data, response status code and response headers
    def post_search_qr_code_from_url_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostSearchQrCodeFromUrlRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_search_qr_code_from_url ...' if @api_client.config.debugging
      # verify the required parameter 'url' is set
      raise ArgumentError, 'Missing the required parameter url when calling SignatureApi.post_search_qr_code_from_url' if @api_client.config.client_side_validation && request.url.nil?
      # resource path
      local_var_path = '/signature/qrcode/search'

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('Url')] = request.url

      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.search_options_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'SearchDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_search_qr_code_from_url\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Insert Stamp Signature into the Document
    # 
    # @param request PostStampRequest
    # @return [SignatureDocumentResponse]
    def post_stamp(request)
      data, _status_code, _headers = post_stamp_with_http_info(request)
      data
    end

    # Insert Stamp Signature into the Document
    # 
    # @param request PostStampRequest
    # @return [Array<(SignatureDocumentResponse, Fixnum, Hash)>]
    # SignatureDocumentResponse data, response status code and response headers
    def post_stamp_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostStampRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_stamp ...' if @api_client.config.debugging
      # verify the required parameter 'name' is set
      raise ArgumentError, 'Missing the required parameter name when calling SignatureApi.post_stamp' if @api_client.config.client_side_validation && request.name.nil?
      # resource path
      local_var_path = '/signature/{name}/stamp'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('Name') + '}', request.name.to_s)

      # query parameters
      query_params = {}
      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Folder') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Folder') + '}', request.folder.to_s)
      else
        query_params[downcase_first_letter('Folder')] = request.folder unless request.folder.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.sign_options_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'SignatureDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_stamp\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Insert Stamp Signature into the Document provided by URL
    # 
    # @param request PostStampFromUrlRequest
    # @return [SignatureDocumentResponse]
    def post_stamp_from_url(request)
      data, _status_code, _headers = post_stamp_from_url_with_http_info(request)
      data
    end

    # Insert Stamp Signature into the Document provided by URL
    # 
    # @param request PostStampFromUrlRequest
    # @return [Array<(SignatureDocumentResponse, Fixnum, Hash)>]
    # SignatureDocumentResponse data, response status code and response headers
    def post_stamp_from_url_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostStampFromUrlRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_stamp_from_url ...' if @api_client.config.debugging
      # verify the required parameter 'url' is set
      raise ArgumentError, 'Missing the required parameter url when calling SignatureApi.post_stamp_from_url' if @api_client.config.client_side_validation && request.url.nil?
      # resource path
      local_var_path = '/signature/stamp'

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('Url')] = request.url

      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.sign_options_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'SignatureDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_stamp_from_url\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Insert Text Signature into the Document
    # 
    # @param request PostTextRequest
    # @return [SignatureDocumentResponse]
    def post_text(request)
      data, _status_code, _headers = post_text_with_http_info(request)
      data
    end

    # Insert Text Signature into the Document
    # 
    # @param request PostTextRequest
    # @return [Array<(SignatureDocumentResponse, Fixnum, Hash)>]
    # SignatureDocumentResponse data, response status code and response headers
    def post_text_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostTextRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_text ...' if @api_client.config.debugging
      # verify the required parameter 'name' is set
      raise ArgumentError, 'Missing the required parameter name when calling SignatureApi.post_text' if @api_client.config.client_side_validation && request.name.nil?
      # resource path
      local_var_path = '/signature/{name}/text'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('Name') + '}', request.name.to_s)

      # query parameters
      query_params = {}
      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Folder') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Folder') + '}', request.folder.to_s)
      else
        query_params[downcase_first_letter('Folder')] = request.folder unless request.folder.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.sign_options_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'SignatureDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_text\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Insert Text Signature into the Document
    # 
    # @param request PostTextFromUrlRequest
    # @return [SignatureDocumentResponse]
    def post_text_from_url(request)
      data, _status_code, _headers = post_text_from_url_with_http_info(request)
      data
    end

    # Insert Text Signature into the Document
    # 
    # @param request PostTextFromUrlRequest
    # @return [Array<(SignatureDocumentResponse, Fixnum, Hash)>]
    # SignatureDocumentResponse data, response status code and response headers
    def post_text_from_url_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostTextFromUrlRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_text_from_url ...' if @api_client.config.debugging
      # verify the required parameter 'url' is set
      raise ArgumentError, 'Missing the required parameter url when calling SignatureApi.post_text_from_url' if @api_client.config.client_side_validation && request.url.nil?
      # resource path
      local_var_path = '/signature/text'

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('Url')] = request.url

      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.sign_options_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'SignatureDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_text_from_url\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Verify the Document with Barcode Signatures
    # 
    # @param request PostVerificationBarcodeRequest
    # @return [VerifiedDocumentResponse]
    def post_verification_barcode(request)
      data, _status_code, _headers = post_verification_barcode_with_http_info(request)
      data
    end

    # Verify the Document with Barcode Signatures
    # 
    # @param request PostVerificationBarcodeRequest
    # @return [Array<(VerifiedDocumentResponse, Fixnum, Hash)>]
    # VerifiedDocumentResponse data, response status code and response headers
    def post_verification_barcode_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostVerificationBarcodeRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_verification_barcode ...' if @api_client.config.debugging
      # verify the required parameter 'name' is set
      raise ArgumentError, 'Missing the required parameter name when calling SignatureApi.post_verification_barcode' if @api_client.config.client_side_validation && request.name.nil?
      # resource path
      local_var_path = '/signature/{name}/barcode/verification'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('Name') + '}', request.name.to_s)

      # query parameters
      query_params = {}
      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Folder') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Folder') + '}', request.folder.to_s)
      else
        query_params[downcase_first_letter('Folder')] = request.folder unless request.folder.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.verify_options_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'VerifiedDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_verification_barcode\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Verify the url based Document with Barcode Signatures
    # 
    # @param request PostVerificationBarcodeFromUrlRequest
    # @return [VerifiedDocumentResponse]
    def post_verification_barcode_from_url(request)
      data, _status_code, _headers = post_verification_barcode_from_url_with_http_info(request)
      data
    end

    # Verify the url based Document with Barcode Signatures
    # 
    # @param request PostVerificationBarcodeFromUrlRequest
    # @return [Array<(VerifiedDocumentResponse, Fixnum, Hash)>]
    # VerifiedDocumentResponse data, response status code and response headers
    def post_verification_barcode_from_url_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostVerificationBarcodeFromUrlRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_verification_barcode_from_url ...' if @api_client.config.debugging
      # verify the required parameter 'url' is set
      raise ArgumentError, 'Missing the required parameter url when calling SignatureApi.post_verification_barcode_from_url' if @api_client.config.client_side_validation && request.url.nil?
      # resource path
      local_var_path = '/signature/barcode/verification'

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('Url')] = request.url

      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.verify_options_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'VerifiedDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_verification_barcode_from_url\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Verify the Document.
    # 
    # @param request PostVerificationCollectionRequest
    # @return [VerifiedDocumentResponse]
    def post_verification_collection(request)
      data, _status_code, _headers = post_verification_collection_with_http_info(request)
      data
    end

    # Verify the Document.
    # 
    # @param request PostVerificationCollectionRequest
    # @return [Array<(VerifiedDocumentResponse, Fixnum, Hash)>]
    # VerifiedDocumentResponse data, response status code and response headers
    def post_verification_collection_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostVerificationCollectionRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_verification_collection ...' if @api_client.config.debugging
      # verify the required parameter 'name' is set
      raise ArgumentError, 'Missing the required parameter name when calling SignatureApi.post_verification_collection' if @api_client.config.client_side_validation && request.name.nil?
      # resource path
      local_var_path = '/signature/{name}/collection/verification'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('Name') + '}', request.name.to_s)

      # query parameters
      query_params = {}
      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Folder') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Folder') + '}', request.folder.to_s)
      else
        query_params[downcase_first_letter('Folder')] = request.folder unless request.folder.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.verify_options_collection_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'VerifiedDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_verification_collection\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Verify the Document provided by URL.
    # 
    # @param request PostVerificationCollectionFromUrlRequest
    # @return [VerifiedDocumentResponse]
    def post_verification_collection_from_url(request)
      data, _status_code, _headers = post_verification_collection_from_url_with_http_info(request)
      data
    end

    # Verify the Document provided by URL.
    # 
    # @param request PostVerificationCollectionFromUrlRequest
    # @return [Array<(VerifiedDocumentResponse, Fixnum, Hash)>]
    # VerifiedDocumentResponse data, response status code and response headers
    def post_verification_collection_from_url_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostVerificationCollectionFromUrlRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_verification_collection_from_url ...' if @api_client.config.debugging
      # verify the required parameter 'url' is set
      raise ArgumentError, 'Missing the required parameter url when calling SignatureApi.post_verification_collection_from_url' if @api_client.config.client_side_validation && request.url.nil?
      # resource path
      local_var_path = '/signature/collection/verification'

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('Url')] = request.url

      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.verify_options_collection_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'VerifiedDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_verification_collection_from_url\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Verify the Document with Digital Signatures
    # 
    # @param request PostVerificationDigitalRequest
    # @return [VerifiedDocumentResponse]
    def post_verification_digital(request)
      data, _status_code, _headers = post_verification_digital_with_http_info(request)
      data
    end

    # Verify the Document with Digital Signatures
    # 
    # @param request PostVerificationDigitalRequest
    # @return [Array<(VerifiedDocumentResponse, Fixnum, Hash)>]
    # VerifiedDocumentResponse data, response status code and response headers
    def post_verification_digital_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostVerificationDigitalRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_verification_digital ...' if @api_client.config.debugging
      # verify the required parameter 'name' is set
      raise ArgumentError, 'Missing the required parameter name when calling SignatureApi.post_verification_digital' if @api_client.config.client_side_validation && request.name.nil?
      # resource path
      local_var_path = '/signature/{name}/digital/verification'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('Name') + '}', request.name.to_s)

      # query parameters
      query_params = {}
      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Folder') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Folder') + '}', request.folder.to_s)
      else
        query_params[downcase_first_letter('Folder')] = request.folder unless request.folder.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('CertificateGuid') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('CertificateGuid') + '}', request.certificate_guid.to_s)
      else
        query_params[downcase_first_letter('CertificateGuid')] = request.certificate_guid unless request.certificate_guid.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.verify_options_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'VerifiedDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_verification_digital\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Verify the Document from url with Digital Signatures
    # 
    # @param request PostVerificationDigitalFromUrlRequest
    # @return [VerifiedDocumentResponse]
    def post_verification_digital_from_url(request)
      data, _status_code, _headers = post_verification_digital_from_url_with_http_info(request)
      data
    end

    # Verify the Document from url with Digital Signatures
    # 
    # @param request PostVerificationDigitalFromUrlRequest
    # @return [Array<(VerifiedDocumentResponse, Fixnum, Hash)>]
    # VerifiedDocumentResponse data, response status code and response headers
    def post_verification_digital_from_url_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostVerificationDigitalFromUrlRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_verification_digital_from_url ...' if @api_client.config.debugging
      # verify the required parameter 'url' is set
      raise ArgumentError, 'Missing the required parameter url when calling SignatureApi.post_verification_digital_from_url' if @api_client.config.client_side_validation && request.url.nil?
      # resource path
      local_var_path = '/signature/digital/verification'

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('Url')] = request.url

      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('CertificateGuid') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('CertificateGuid') + '}', request.certificate_guid.to_s)
      else
        query_params[downcase_first_letter('CertificateGuid')] = request.certificate_guid unless request.certificate_guid.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.verify_options_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'VerifiedDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_verification_digital_from_url\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Verify the Document with QRCode Signatures
    # 
    # @param request PostVerificationQrCodeRequest
    # @return [VerifiedDocumentResponse]
    def post_verification_qr_code(request)
      data, _status_code, _headers = post_verification_qr_code_with_http_info(request)
      data
    end

    # Verify the Document with QRCode Signatures
    # 
    # @param request PostVerificationQrCodeRequest
    # @return [Array<(VerifiedDocumentResponse, Fixnum, Hash)>]
    # VerifiedDocumentResponse data, response status code and response headers
    def post_verification_qr_code_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostVerificationQrCodeRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_verification_qr_code ...' if @api_client.config.debugging
      # verify the required parameter 'name' is set
      raise ArgumentError, 'Missing the required parameter name when calling SignatureApi.post_verification_qr_code' if @api_client.config.client_side_validation && request.name.nil?
      # resource path
      local_var_path = '/signature/{name}/qrcode/verification'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('Name') + '}', request.name.to_s)

      # query parameters
      query_params = {}
      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Folder') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Folder') + '}', request.folder.to_s)
      else
        query_params[downcase_first_letter('Folder')] = request.folder unless request.folder.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.verify_options_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'VerifiedDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_verification_qr_code\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Verify the url based Document with QRCode Signatures
    # 
    # @param request PostVerificationQrCodeFromUrlRequest
    # @return [VerifiedDocumentResponse]
    def post_verification_qr_code_from_url(request)
      data, _status_code, _headers = post_verification_qr_code_from_url_with_http_info(request)
      data
    end

    # Verify the url based Document with QRCode Signatures
    # 
    # @param request PostVerificationQrCodeFromUrlRequest
    # @return [Array<(VerifiedDocumentResponse, Fixnum, Hash)>]
    # VerifiedDocumentResponse data, response status code and response headers
    def post_verification_qr_code_from_url_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostVerificationQrCodeFromUrlRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_verification_qr_code_from_url ...' if @api_client.config.debugging
      # verify the required parameter 'url' is set
      raise ArgumentError, 'Missing the required parameter url when calling SignatureApi.post_verification_qr_code_from_url' if @api_client.config.client_side_validation && request.url.nil?
      # resource path
      local_var_path = '/signature/qrcode/verification'

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('Url')] = request.url

      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.verify_options_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'VerifiedDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_verification_qr_code_from_url\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Verify the Document with Text Signatures
    # 
    # @param request PostVerificationTextRequest
    # @return [VerifiedDocumentResponse]
    def post_verification_text(request)
      data, _status_code, _headers = post_verification_text_with_http_info(request)
      data
    end

    # Verify the Document with Text Signatures
    # 
    # @param request PostVerificationTextRequest
    # @return [Array<(VerifiedDocumentResponse, Fixnum, Hash)>]
    # VerifiedDocumentResponse data, response status code and response headers
    def post_verification_text_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostVerificationTextRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_verification_text ...' if @api_client.config.debugging
      # verify the required parameter 'name' is set
      raise ArgumentError, 'Missing the required parameter name when calling SignatureApi.post_verification_text' if @api_client.config.client_side_validation && request.name.nil?
      # resource path
      local_var_path = '/signature/{name}/text/verification'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('Name') + '}', request.name.to_s)

      # query parameters
      query_params = {}
      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Folder') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Folder') + '}', request.folder.to_s)
      else
        query_params[downcase_first_letter('Folder')] = request.folder unless request.folder.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.verify_options_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'VerifiedDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_verification_text\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Verify the Document provided by url with Text Signatures
    # 
    # @param request PostVerificationTextFromUrlRequest
    # @return [VerifiedDocumentResponse]
    def post_verification_text_from_url(request)
      data, _status_code, _headers = post_verification_text_from_url_with_http_info(request)
      data
    end

    # Verify the Document provided by url with Text Signatures
    # 
    # @param request PostVerificationTextFromUrlRequest
    # @return [Array<(VerifiedDocumentResponse, Fixnum, Hash)>]
    # VerifiedDocumentResponse data, response status code and response headers
    def post_verification_text_from_url_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostVerificationTextFromUrlRequest

      @api_client.config.logger.debug 'Calling API: SignatureApi.post_verification_text_from_url ...' if @api_client.config.debugging
      # verify the required parameter 'url' is set
      raise ArgumentError, 'Missing the required parameter url when calling SignatureApi.post_verification_text_from_url' if @api_client.config.client_side_validation && request.url.nil?
      # resource path
      local_var_path = '/signature/text/verification'

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('Url')] = request.url

      if local_var_path.include? ('{' + downcase_first_letter('Password') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Password') + '}', request.password.to_s)
      else
        query_params[downcase_first_letter('Password')] = request.password unless request.password.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('Storage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Storage') + '}', request.storage.to_s)
      else
        query_params[downcase_first_letter('Storage')] = request.storage unless request.storage.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.verify_options_data)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'VerifiedDocumentResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SignatureApi#post_verification_text_from_url\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
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
    def get_access_token
        if @access_token.nil? then
          request_access_token
        else 
          access_token_expired = @access_token_expires_at < DateTime.now
          if access_token_expired then
            reset_access_token
          end
        end
        
        @access_token  
    end

    #
    # Gets a access token from server
    #
    private def request_access_token
        auth_config = Configuration.new(@config.app_sid, @config.app_key)
        auth_config.api_base_url = @config.api_host
        auth_config.debugging = @config.debugging
        auth_config.logger = @config.logger
        auth_config.temp_folder_path = @config.temp_folder_path
        auth_config.client_side_validation = @config.client_side_validation
        auth_config.api_version = ''

        auth_api_client = ApiClient.new(auth_config)

        request_url = "/oauth2/token"
        post_data = "grant_type=client_credentials&client_id=#{@config.app_sid}&client_secret=#{@config.app_key}"

        data, _status_code, _header = auth_api_client.call_api(:POST, request_url, :body => post_data, :return_type => 'Object')
        
        @access_token = data[:access_token]
        @refresh_token = data[:refresh_token]

        expires_in_seconds = data[:expires_in].to_i - 5 * 60 
        expires_in_days = Rational(expires_in_seconds, 60 * 60 * 24)
        @access_token_expires_at = DateTime.now + expires_in_days
    end

    #
    # Resets access token
    #
    private def reset_access_token
        auth_config = Configuration.new(@config.app_sid, @config.app_key)
        auth_config.api_base_url = @config.api_base_url
        auth_config.debugging = @config.debugging
        auth_config.logger = @config.logger
        auth_config.temp_folder_path = @config.temp_folder_path
        auth_config.client_side_validation = @config.client_side_validation
        auth_config.api_version = ''

        auth_api_client = ApiClient.new(auth_config)

        request_url = "/oauth2/token"
        post_data = "grant_type=refresh_token&refresh_token=#{@refresh_token}"

        data, _status_code, _header = auth_api_client.call_api(:POST, request_url, :body => post_data, :return_type => 'Object')
        
        @access_token = data[:access_token]
        @refresh_token = data[:refresh_token]

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
 # -----------------------------------