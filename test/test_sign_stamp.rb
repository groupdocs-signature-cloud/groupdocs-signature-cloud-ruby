# coding: utf-8
# -----------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="test_sign_stamp.rb">
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
require_relative './../lib/groupdocs_signature_cloud/models/cells_sign_stamp_options_data'
require_relative './../lib/groupdocs_signature_cloud/models/images_sign_stamp_options_data'
require_relative './../lib/groupdocs_signature_cloud/models/pdf_sign_stamp_options_data'
require_relative './../lib/groupdocs_signature_cloud/models/slides_sign_stamp_options_data'
require_relative './../lib/groupdocs_signature_cloud/models/words_sign_stamp_options_data'
require_relative './../lib/groupdocs_signature_cloud/models/requests/post_collection_request'
require_relative './../lib/groupdocs_signature_cloud/models/requests/post_collection_from_url_request'
require_relative './../lib/groupdocs_signature_cloud/models/signature_document_response'
require_relative './../lib/groupdocs_signature_cloud/models/color'
require_relative './../lib/groupdocs_signature_cloud/models/signature_font_data'
require_relative './../lib/groupdocs_signature_cloud/models/stamp_line_data'
require_relative './../lib/groupdocs_signature_cloud/models/border_line_data'

class TestsSignStamp < Minitest::Test

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

    def test_sign_post_stamp_cells_collection
        puts("\nSign stamp cells collection")

        options1 = get_options_sign_stamp_cells()
        options2 = get_options_sign_stamp_cells()
        options2.inner_lines[0].text = "Smith John"
        options2.top = 10
        collection = SignOptionsCollectionData.new(Items: [options1, options2])

        file = @@BaseTest.TestFiles.getFile01PagesCells

        request = GroupDocsSignatureCloud::PostCollectionRequest.new(file.FileName, collection, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_collection(request)

        assert_response(file, response)
    end

    def test_sign_post_stamp_cells_collection_url
        puts("\nSign stamp cells collection URL")

        options1 = get_options_sign_stamp_cells()
        options2 = get_options_sign_stamp_cells()
        options2.inner_lines[0].text = "Smith John"
        options2.top = 10
        collection = SignOptionsCollectionData.new(Items: [options1, options2])

        file = @@BaseTest.TestFiles.getFile01PagesCellsUrl

        request = GroupDocsSignatureCloud::PostCollectionFromUrlRequest.new(file.Url, collection, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_collection_from_url(request)
        assert_response(file, response) 
    end

    def test_sign_post_stamp_cells
        puts("\nSign stamp cells")

        file = @@BaseTest.TestFiles.getFile01PagesCells
        options = get_options_sign_stamp_cells()
        request = GroupDocsSignatureCloud::PostStampRequest.new(file.FileName, options, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_stamp(request)
        assert_response(file, response) 
    end        

    def test_sign_post_stamp_cells_url
        puts("\nSign stamp cells URL")

        file = @@BaseTest.TestFiles.getFile01PagesCellsUrl
        options = get_options_sign_stamp_cells()
        request = GroupDocsSignatureCloud::PostStampFromUrlRequest.new(file.Url, options, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_stamp_from_url(request)
        assert_response(file, response)
    end  
    
    def get_options_sign_stamp_cells
        options = CellsSignStampOptionsData.new()
        compose_stamp_sign_optionsData(options)
        options.top = 5 
        options.left = 5 
        return options
    end    

    def test_sign_post_stamp_docimages
        puts("\nSign stamp docimages")

        file = @@BaseTest.TestFiles.getFile01PagesDocImages
        options = get_options_sign_stamp_docimages()
        request = GroupDocsSignatureCloud::PostStampRequest.new(file.FileName, options, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_stamp(request)
        assert_response(file, response)
    end  

    def test_sign_post_stamp_docimages_url
        puts("\nSign stamp docimages URL")

        file = @@BaseTest.TestFiles.getFile01PagesDocImagesUrl
        options = get_options_sign_stamp_docimages()
        request = GroupDocsSignatureCloud::PostStampFromUrlRequest.new(file.Url, options, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_stamp_from_url(request)
        assert_response(file, response)    
    end  

    def get_options_sign_stamp_docimages
        options = ImagesSignStampOptionsData.new()
        compose_stamp_sign_optionsData(options)
        return options
    end  

    def test_sign_post_stamp_pdf
        puts("\nSign stamp pdf")

        file = @@BaseTest.TestFiles.getFile01PagesPdf
        options = get_options_sign_stamp_pdf()
        request = GroupDocsSignatureCloud::PostStampRequest.new(file.FileName, options, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_stamp(request)
        assert_response(file, response)
    end  

    def test_sign_post_stamp_pdf_url
        puts("\nSign stamp pdf URL")

        file = @@BaseTest.TestFiles.getFile01PagesPdfUrl
        options = get_options_sign_stamp_pdf()
        request = GroupDocsSignatureCloud::PostStampFromUrlRequest.new(file.Url, options, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_stamp_from_url(request)
        assert_response(file, response)    
    end  

    def get_options_sign_stamp_pdf
        options = PdfSignStampOptionsData.new()
        compose_stamp_sign_optionsData(options)
        return options
    end  

    def test_sign_post_stamp_slides
        puts("\nSign stamp slides")

        file = @@BaseTest.TestFiles.getFile01PagesSlides
        options = get_options_sign_stamp_slides()
        request = GroupDocsSignatureCloud::PostStampRequest.new(file.FileName, options, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_stamp(request)
        assert_response(file, response)
    end  

    def test_sign_post_stamp_slides_url
        puts("\nSign stamp slides URL")

        file = @@BaseTest.TestFiles.getFile01PagesSlidesUrl
        options = get_options_sign_stamp_slides()
        request = GroupDocsSignatureCloud::PostStampFromUrlRequest.new(file.Url, options, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_stamp_from_url(request)
        assert_response(file, response)    
    end  

    def get_options_sign_stamp_slides
        options = SlidesSignStampOptionsData.new()
        compose_stamp_sign_optionsData(options)
        return options
    end  

    def test_sign_post_stamp_words
        puts("\nSign stamp words")

        file = @@BaseTest.TestFiles.getFile01PagesWords
        options = get_options_sign_stamp_words()
        request = GroupDocsSignatureCloud::PostStampRequest.new(file.FileName, options, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_stamp(request)
        assert_response(file, response)
    end  

    def test_sign_post_stamp_words_url
        puts("\nSign stamp words URL")

        file = @@BaseTest.TestFiles.getFile01PagesWordsUrl
        options = get_options_sign_stamp_words()
        request = GroupDocsSignatureCloud::PostStampFromUrlRequest.new(file.Url, options, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_stamp_from_url(request)
        assert_response(file, response)    
    end  

    def get_options_sign_stamp_words
        options = WordsSignStampOptionsData.new()
        compose_stamp_sign_optionsData(options)
        return options
    end 
    
    def compose_stamp_sign_optionsData(options)

        # get colors
        clrGold = @@BaseTest.get_color("#FFD700")
        clrBlueViolet = @@BaseTest.get_color("#8A2BE2")
        clrCornflowerBlue = @@BaseTest.get_color("#6495ED")
        clrDarkOrange = @@BaseTest.get_color("#FF8C00")
        clrOliveDrab = @@BaseTest.get_color("#6B8E23")
        clrGhostWhite = @@BaseTest.get_color("#F8F8FF")

        # outer line
        outerLine = GroupDocsSignatureCloud::StampLineData.new()
        outerLine.text = "John Smith"
        outerLine.font = @@BaseTest.get_font("Arial", 12, true, false, false)
        outerLine.text_bottom_intent = 5
        outerLine.text_color = clrGold
        outerLine.text_repeat_type = "FullTextRepeat"
        outerLine.background_color = clrBlueViolet
        outerLine.height = 20
        outerLineInnerBorder = GroupDocsSignatureCloud::BorderLineData.new({"color"=>clrDarkOrange, "style"=>"LongDash", "transparency"=>0.5, "weight"=>1.2})
        outerLine.inner_border = outerLineInnerBorder
        outerLineOuterBorder = GroupDocsSignatureCloud::BorderLineData.new({"color"=>clrDarkOrange, "style"=>"LongDashDot", "transparency"=>0.7, "weight"=>1.4})
        outerLine.outer_border = outerLineOuterBorder
        outerLine.visible = true        

        options.outer_lines = [outerLine]

        # inner line
        innerLine = GroupDocsSignatureCloud::StampLineData.new()
        innerLine.text = "John Smith"
        innerLine.font = @@BaseTest.get_font("Times New Roman", 20, true, true, true)
        innerLine.text_bottom_intent = 3
        innerLine.text_color = clrGold
        innerLine.text_repeat_type = "None"
        innerLine.background_color = clrCornflowerBlue
        innerLine.height = 30
        innerLineInnerBorder = GroupDocsSignatureCloud::BorderLineData.new({"color"=>clrOliveDrab, "style"=>"LongDash", "transparency"=>0.5, "weight"=>1.2})
        innerLine.inner_border = innerLineInnerBorder
        innerLineOuterBorder = GroupDocsSignatureCloud::BorderLineData.new({"color"=>clrGhostWhite, "style"=>"Dot", "transparency"=>0.4, "weight"=>1.4})
        innerLine.outer_border = innerLineOuterBorder
        innerLine.visible = true     
        
        options.inner_lines = [innerLine]

        options.image_guid = "images\\JohnSmithSign.png"
        # set position on page
        options.top = 50
        options.left = 50
        options.width = 300
        options.height = 200
        options.location_measure_type = "Pixels"
        options.size_measure_type = "Pixels"
        options.rotation_angle = 0
        options.horizontal_alignment = "None"
        options.vertical_alignment = "None"
        # set margin
        margin = GroupDocsSignatureCloud::PaddingData.new(all = 100)        
        options.margin = margin
        options.margin_measure_type = "Pixels"
        # set background 
        options.background_color = clrCornflowerBlue
        options.background_color_crop_type = "InnerArea"
        options.background_image_crop_type = "MiddleArea"   
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

=begin    
=end
    def teardown 
    end

end
