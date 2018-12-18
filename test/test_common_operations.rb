# coding: utf-8
# -----------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="test_common_operations.rb">
#   Copyright (c) 2018 Aspose Pty Ltd
# </copyright>
# <summary>
#   Permission is hereby granted, free of charge, to any person obtaining a copy
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

module GroupDocsSignatureCloud_TestCommonOperations

    require "minitest/autorun"
    require "minitest/unit"
    require 'groupdocs_storage_cloud'
    require_relative './base_api_test'
    require_relative './internal/test_file'
    require_relative './../lib/groupdocs_signature_cloud/models/format'
    require_relative './../lib/groupdocs_signature_cloud/models/format_collection'
    require_relative './../lib/groupdocs_signature_cloud/models/barcode_type'
    require_relative './../lib/groupdocs_signature_cloud/models/barcode_collection'
    require_relative './../lib/groupdocs_signature_cloud/models/qr_code_type'
    require_relative './../lib/groupdocs_signature_cloud/models/qr_code_collection'
    require_relative './../lib/groupdocs_signature_cloud/models/requests/get_document_info_request'
    require_relative './../lib/groupdocs_signature_cloud/models/requests/get_document_info_from_url_request'
    require_relative './../lib/groupdocs_signature_cloud/models/document_info'
    require_relative './../lib/groupdocs_signature_cloud/models/page_info'
    require_relative './../lib/groupdocs_signature_cloud/models/pages_info'

    class TestCommonOperations < Minitest::Test

      include MiniTest::Assertions
      include GroupDocsStorageCloud
      include GroupDocsSignatureCloud_BaseApi
      include GroupDocsSignatureCloud
      include GroupDocsSignatureCloud_TestFile

      @@BaseTest = nil

      def setup
          if @@BaseTest == nil
              @@BaseTest = BaseApiTest.new(fileStorage="Signature-Dev")
              @@BaseTest.SignatureApi.get_access_token
        
              assert @@BaseTest.SignatureApi.access_token != "", "Access token hasn't been received"
              assert @@BaseTest.SignatureApi.access_token != nil, "Access token hasn't been received"
          end    
      end

      def test_get_supported_file_formats
        puts("\nCommon operations file formats")

        response = @@BaseTest.SignatureApi.get_supported_formats()
        assert response.is_a?(GroupDocsSignatureCloud::FormatCollection)
        assert response.formats.is_a?(Array)
        assert response.formats.length > 0

        response.formats.each do |item|
          assert item != nil
          assert item.is_a?(GroupDocsSignatureCloud::Format)
          assert item.file_format != nil
          assert item.file_format.length > 0
          assert item.extension != nil
          assert item.extension.length > 0
        end
      end

      def test_get_supported_barcodes
        puts("\nCommon operations supported barcodes")

        response = @@BaseTest.SignatureApi.get_barcodes
        assert response.is_a?(GroupDocsSignatureCloud::BarcodeCollection)
        assert response.barcode_types.is_a?(Array)
        assert response.barcode_types.length > 0

        response.barcode_types.each do |item|
          assert item != nil
          assert item.is_a?(GroupDocsSignatureCloud::BarcodeType)
          assert item.name != nil
          assert item.name.length > 0
        end
      end    
     
      def test_get_supported_qrcodes
        puts("\nCommon operations supported QR-codes")

        response = @@BaseTest.SignatureApi.get_qr_codes
        assert response.is_a?(GroupDocsSignatureCloud::QRCodeCollection)
        assert response.qr_code_types.is_a?(Array)
        assert response.qr_code_types.length > 0

        response.qr_code_types.each do |item|
          assert item != nil
          assert item.is_a?(GroupDocsSignatureCloud::QRCodeType)
          assert item.name != nil
          assert item.name.length > 0
        end       
      end

      def test_get_document_info
        puts("\nCommon operations document info")

        file = @@BaseTest.TestFiles.getFile02PagesPdf
        request = GroupDocsSignatureCloud::GetDocumentInfoRequest.new(file.FileName, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.get_document_info(request)   
        assert_document_info_response(file, response, "Pdf")
      end

      def test_get_document_info_from_url
        puts("\nCommon operations document info from url")        
        file = @@BaseTest.TestFiles.getFile01PagesWordsUrl
        request = GroupDocsSignatureCloud::GetDocumentInfoFromUrlRequest.new(file.Url, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.get_document_info_from_url(request)   
        assert_document_info_response(file, response, "Docx")
      end

      def assert_document_info_response(file, response, fileFormat)
        assert response != nil
        assert_equal file.FileName, response.name
        assert_equal file.Folder, response.folder
        assert_equal response.file_format, fileFormat
      end        

      def teardown 
      end

    end
end

