# coding: utf-8
# -----------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="test_sign_digital.rb">
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

require "minitest/autorun"
require "minitest/unit"
require 'groupdocs_storage_cloud'
require_relative './base_api_test'
require_relative './internal/test_file'
require_relative './../lib/groupdocs_signature_cloud/models/padding_data'
require_relative './../lib/groupdocs_signature_cloud/models/pages_setup_data'
require_relative './../lib/groupdocs_signature_cloud/models/sign_options_collection_data'
require_relative './../lib/groupdocs_signature_cloud/models/cells_sign_digital_options_data'
require_relative './../lib/groupdocs_signature_cloud/models/pdf_sign_digital_options_data'
require_relative './../lib/groupdocs_signature_cloud/models/words_sign_digital_options_data'
require_relative './../lib/groupdocs_signature_cloud/models/requests/post_collection_request'
require_relative './../lib/groupdocs_signature_cloud/models/requests/post_collection_from_url_request'
require_relative './../lib/groupdocs_signature_cloud/models/signature_document_response'
require_relative './../lib/groupdocs_signature_cloud/models/color'
require_relative './../lib/groupdocs_signature_cloud/models/signature_font_data'

class TestsSignBarcode < Minitest::Test

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

    def test_sign_post_digital_cells_collection
        puts("\nSign digital cells collection")

        options1 = get_options_sign_digital_cells()
        options2 = get_options_sign_digital_cells()
        options2.certificate_guid = "certificates\\test03_rsa_sha1_1024.pfx"
        options2.top = 10
        collection = SignOptionsCollectionData.new(Items: [options1, options2])

        file = @@BaseTest.TestFiles.getFile01PagesCells

        request = GroupDocsSignatureCloud::PostCollectionRequest.new(file.FileName, collection, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_collection(request)

        assert_response(file, response)
    end

    def test_sign_post_digital_cells_collection_url
        puts("\nSign digital cells collection URL")

        options1 = get_options_sign_digital_cells()
        options2 = get_options_sign_digital_cells()
        options2.certificate_guid = "certificates\\test03_rsa_sha1_1024.pfx"
        options2.top = 10
        collection = SignOptionsCollectionData.new(Items: [options1, options2])

        file = @@BaseTest.TestFiles.getFile01PagesCellsUrl

        request = GroupDocsSignatureCloud::PostCollectionFromUrlRequest.new(file.Url, collection, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_collection_from_url(request)
        assert_response(file, response) 
    end
  
    def test_sign_post_digital_cells
        puts("\nSign digital cells")

        file = @@BaseTest.TestFiles.getFile01PagesCells
        options = get_options_sign_digital_cells()
        request = GroupDocsSignatureCloud::PostDigitalRequest.new(file.FileName, options, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_digital(request)
        assert_response(file, response) 
    end        

    def test_sign_post_digital_cells_url
        puts("\nSign digital cells URL")

        file = @@BaseTest.TestFiles.getFile01PagesCellsUrl
        options = get_options_sign_digital_cells()
        request = GroupDocsSignatureCloud::PostDigitalFromUrlRequest.new(file.Url, options, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_digital_from_url(request)
        assert_response(file, response)
    end  
  
    def get_options_sign_digital_cells
        options = CellsSignDigitalOptionsData.new()
        compose_digital_sign_optionsData(options)
        options.top = 5 
        options.left = 5 
        return options
    end    

    def test_sign_post_digital_pdf
        puts("\nSign digital pdf")

        file = @@BaseTest.TestFiles.getFile01PagesPdf
        options = get_options_sign_digital_pdf()
        request = GroupDocsSignatureCloud::PostDigitalRequest.new(file.FileName, options, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_digital(request)
        assert_response(file, response)
    end  

    def test_sign_post_digital_pdf_url
        puts("\nSign digital pdf URL")

        file = @@BaseTest.TestFiles.getFile01PagesPdfUrl
        options = get_options_sign_digital_pdf()
        request = GroupDocsSignatureCloud::PostDigitalFromUrlRequest.new(file.Url, options, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_digital_from_url(request)
        assert_response(file, response)    
    end  

    def get_options_sign_digital_pdf
        options = PdfSignDigitalOptionsData.new()
        compose_digital_sign_optionsData(options)
        return options
    end  

    def test_sign_post_digital_words
        puts("\nSign digital words")

        file = @@BaseTest.TestFiles.getFile01PagesWords
        options = get_options_sign_digital_words()
        request = GroupDocsSignatureCloud::PostDigitalRequest.new(file.FileName, options, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_digital(request)
        assert_response(file, response)
    end  

    def test_sign_post_digital_words_url
        puts("\nSign digital words URL")

        file = @@BaseTest.TestFiles.getFile01PagesWordsUrl
        options = get_options_sign_digital_words()
        request = GroupDocsSignatureCloud::PostDigitalFromUrlRequest.new(file.Url, options, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_digital_from_url(request)
        assert_response(file, response)    
    end  

    def get_options_sign_digital_words
        options = WordsSignDigitalOptionsData.new()
        compose_digital_sign_optionsData(options)
        return options
    end 
 
    def compose_digital_sign_optionsData(options)
        # set digital signature properties
        options.image_guid = "images\\JohnSmithSign.png"
        options.certificate_guid = "certificates\\SherlockHolmes.pfx"
        options.password = "1234567890"
        # set position on page
        options.left = 100
        options.top = 100
        options.width = 300
        options.height = 100
        options.location_measure_type = "Pixels"
        options.size_measure_type = "Pixels"
        options.rotation_angle = 45
        options.horizontal_alignment = "None"
        options.vertical_alignment = "None"
        # set margin
        margin = GroupDocsSignatureCloud::PaddingData.new(all = 100)        
        options.margin = margin
        options.margin_measure_type = "Pixels"
        #set border    
        options.opacity = 1
        #set pages for signing
        options.sign_all_pages = false
        options.document_page_number = 1
        pagesSetup = GroupDocsSignatureCloud::PagesSetupData.new({ 'FirstPage' => true,  'LastPage' => true, 'OddPages' => true, 'EvenPages' => true})        
        options.pages_setup = pagesSetup   
    end

    def assert_response( file, response)
        assert response != nil
        assert response.code == "200"
        assert response.status == "OK"
        assert file.FileName == response.file_name
        assert response.folder == "Output"
    end        

    def teardown 
    end

end
