# coding: utf-8
# -----------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="test_verify_barcode.rb">
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
require_relative './../lib/groupdocs_signature_cloud/models/verify_options_collection_data'
require_relative './../lib/groupdocs_signature_cloud/models/cells_verify_barcode_options_data'
require_relative './../lib/groupdocs_signature_cloud/models/images_verify_barcode_options_data'
require_relative './../lib/groupdocs_signature_cloud/models/pdf_verify_barcode_options_data'
require_relative './../lib/groupdocs_signature_cloud/models/slides_verify_barcode_options_data'
require_relative './../lib/groupdocs_signature_cloud/models/words_verify_barcode_options_data'
require_relative './../lib/groupdocs_signature_cloud/models/requests/post_verification_collection_request'
require_relative './../lib/groupdocs_signature_cloud/models/requests/post_verification_collection_from_url_request'
require_relative './../lib/groupdocs_signature_cloud/models/verified_document_response'

class TestsVerificationBarcode < Minitest::Test

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

    def test_verify_post_barcode_cells_collection
        puts("\nVerification barcode cells collection")

        options1 = get_options_verify_barcode_cells()
        options2 = get_options_verify_barcode_cells()
        options2.text = "1234"
        options2.match_type ="StartsWith"
        collection = VerifyOptionsCollectionData.new(Items: [options1, options2])

        file = @@BaseTest.TestFiles.getFileSignedCells

        request = GroupDocsSignatureCloud::PostVerificationCollectionRequest.new(file.FileName, collection, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_verification_collection(request)

        assert_response(file, response)
    end

    def test_verify_post_barcode_cells_collection_url
        puts("\nVerification barcode cells collection URL")

        options1 = get_options_verify_barcode_cells()
        options2 = get_options_verify_barcode_cells()
        options2.text = "1234"
        options2.match_type ="StartsWith"
        collection = VerifyOptionsCollectionData.new(Items: [options1, options2])

        file = @@BaseTest.TestFiles.getFileSignedCellsUrl

        request = GroupDocsSignatureCloud::PostVerificationCollectionFromUrlRequest.new(file.Url, collection, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_verification_collection_from_url(request)
        assert_response(file, response, true) 
    end

    def test_verify_post_barcode_cells
        puts("\nVerification barcode cells")

        file = @@BaseTest.TestFiles.getFileSignedCells
        options = get_options_verify_barcode_cells()
        request = GroupDocsSignatureCloud::PostVerificationBarcodeRequest.new(file.FileName, options, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_verification_barcode(request)
        assert_response(file, response) 
    end        

    def test_verify_post_barcode_cells_url
        puts("\nVerification barcode cells URL")

        file = @@BaseTest.TestFiles.getFileSignedCellsUrl
        options = get_options_verify_barcode_cells()
        request = GroupDocsSignatureCloud::PostVerificationBarcodeFromUrlRequest.new(file.Url, options, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_verification_barcode_from_url(request)
        assert_response(file, response, true)
    end  
    
    def get_options_verify_barcode_cells
        options = CellsVerifyBarcodeOptionsData.new()
        compose_barcode_verify_optionsData(options)
        return options
    end    

    def test_verify_post_barcode_docimages
        puts("\nVerification barcode docimages")

        file = @@BaseTest.TestFiles.getFileSignedDocImages
        options = get_options_verify_barcode_docimages()
        request = GroupDocsSignatureCloud::PostVerificationBarcodeRequest.new(file.FileName, options, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_verification_barcode(request)
        assert_response(file, response)
    end  

    def test_verify_post_barcode_docimages_url
        puts("\nVerification barcode docimages URL")

        file = @@BaseTest.TestFiles.getFileSignedDocImagesUrl
        options = get_options_verify_barcode_docimages()
        request = GroupDocsSignatureCloud::PostVerificationBarcodeFromUrlRequest.new(file.Url, options, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_verification_barcode_from_url(request)
        assert_response(file, response, true)    
    end  

    def get_options_verify_barcode_docimages
        options = ImagesVerifyBarcodeOptionsData.new()
        compose_barcode_verify_optionsData(options)
        return options
    end  

    def test_verify_post_barcode_pdf
        puts("\nVerification barcode pdf")

        file = @@BaseTest.TestFiles.getFileSignedPdf
        options = get_options_verify_barcode_pdf()
        request = GroupDocsSignatureCloud::PostVerificationBarcodeRequest.new(file.FileName, options, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_verification_barcode(request)
        assert_response(file, response)
    end  

    def test_verify_post_barcode_pdf_url
        puts("\nVerification barcode pdf URL")

        file = @@BaseTest.TestFiles.getFileSignedPdfUrl
        options = get_options_verify_barcode_pdf()
        request = GroupDocsSignatureCloud::PostVerificationBarcodeFromUrlRequest.new(file.Url, options, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_verification_barcode_from_url(request)
        assert_response(file, response, true)    
    end  

    def get_options_verify_barcode_pdf
        options = PdfVerifyBarcodeOptionsData.new()
        compose_barcode_verify_optionsData(options)
        return options
    end  

    def test_verify_post_barcode_slides
        puts("\nVerification barcode slides")

        file = @@BaseTest.TestFiles.getFileSignedSlides
        options = get_options_verify_barcode_slides()
        request = GroupDocsSignatureCloud::PostVerificationBarcodeRequest.new(file.FileName, options, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_verification_barcode(request)
        assert_response(file, response)
    end  

    def test_verify_post_barcode_slides_url
        puts("\nVerification barcode slides URL")

        file = @@BaseTest.TestFiles.getFileSignedSlidesUrl
        options = get_options_verify_barcode_slides()
        request = GroupDocsSignatureCloud::PostVerificationBarcodeFromUrlRequest.new(file.Url, options, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_verification_barcode_from_url(request)
        assert_response(file, response, true)    
    end  

    def get_options_verify_barcode_slides
        options = SlidesVerifyBarcodeOptionsData.new()
        compose_barcode_verify_optionsData(options)
        return options
    end  

    def test_verify_post_barcode_words
        puts("\nVerification barcode words")

        file = @@BaseTest.TestFiles.getFileSignedWords
        options = get_options_verify_barcode_words()
        request = GroupDocsSignatureCloud::PostVerificationBarcodeRequest.new(file.FileName, options, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_verification_barcode(request)
        assert_response(file, response)
    end  

    def test_verify_post_barcode_words_url
        puts("\nVerification barcode words URL")

        file = @@BaseTest.TestFiles.getFileSignedWordsUrl
        options = get_options_verify_barcode_words()
        request = GroupDocsSignatureCloud::PostVerificationBarcodeFromUrlRequest.new(file.Url, options, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_verification_barcode_from_url(request)
        assert_response(file, response, true)    
    end  

    def get_options_verify_barcode_words
        options = WordsVerifyBarcodeOptionsData.new()
        compose_barcode_verify_optionsData(options)
        return options
    end 

    def compose_barcode_verify_optionsData(options)
        # set barcode properties
        options.barcode_type_name ="Code39Standard"
        options.text = "12345678"
        # set match type
        options.match_type ="Contains"
        #set pages for verify
        options.document_page_number = 1 
    end

    def assert_response(file, response, url = false)
        assert response != nil
        assert response.code == "200"
        assert response.status == "OK"
        if not url
            assert file.FileName == response.file_name
            assert response.folder == "signed"
        else
            assert file.Url == response.file_name    
        end    
    end        

=begin    
=end
    def teardown 
    end

end
