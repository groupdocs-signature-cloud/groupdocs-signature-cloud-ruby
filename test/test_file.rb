#
# --------------------------------------------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="test_file.rb">
#    Copyright (c) 2003-2023 Aspose Pty Ltd
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
# --------------------------------------------------------------------------------------------------------------------
#

module GroupDocsSignatureCloud
    class TestFile
        attr_accessor :file_name;
        attr_accessor :folder;
        attr_accessor :password;
        attr_accessor :size;
        
        def path
            folder + file_name
        end

        def file_info
            info = FileInfo.new
            info.file_path = path
            info.password = password
            info
        end        

        def self.pdf_one_page
            f = TestFile.new
            f.file_name = "01_pages.pdf"
            f.folder = "Pdf\\"
            f
        end

        def self.image_jpg
            f = TestFile.new
            f.file_name = "01_pages.jpg"
            f.folder = "Images\\"
            f
        end

        def self.presentation_pptx
            f = TestFile.new
            f.file_name = "01_pages.pptx"
            f.folder = "Presentations\\"
            f
        end

        def self.spreadsheet_xlsx
            f = TestFile.new
            f.file_name = "01_pages.xlsx"
            f.folder = "Spreadsheets\\"
            f
        end

        def self.word_docx
            f = TestFile.new
            f.file_name = "01_pages.docx"
            f.folder = "WordProcessing\\"
            f
        end        

        def self.image_signed
            f = TestFile.new
            f.file_name = "SignedForVerificationAll.png"
            f.folder = "Signed\\"
            f.size = 27533  
            f
        end

        def self.pdf_signed
            f = TestFile.new
            f.file_name = "SignedForVerificationAll.pdf"
            f.folder = "Signed\\"
            f.size = 164060
            f
        end

        def self.presentation_signed
            f = TestFile.new
            f.file_name = "SignedForVerificationAll.pptx"
            f.folder = "Signed\\"
            f.size = 43205
            f
        end

        def self.spreadsheet_signed
            f = TestFile.new
            f.file_name = "SignedForVerificationAll.xlsx"
            f.folder = "Signed\\"
            f.size = 318157
            f
        end

        def self.wordprocessing_signed
            f = TestFile.new
            f.file_name = "SignedForVerificationAll.docx"
            f.folder = "Signed\\"
            f.size = 1358290
            f
        end

        def self.additional_signature01
            f = TestFile.new
            f.file_name = "signature_01.jpg"
            f.folder = "Additional\\"  
            f
        end

        def self.additional_pfx
            f = TestFile.new
            f.file_name = "SherlockHolmes.pfx"
            f.folder = "Additional\\"  
            f
        end
        
        def self.image_sign
            f = TestFile.new
            f.file_name = "JohnSmithSign.png"
            f.folder = "Additional\\"     
            f
        end

        def self.not_exist
            f = TestFile.new
            f.file_name = "notexist.docx"
            f.folder = "some-folder\\"     
            f
        end        

        def self.test_files_list
            [
                self.pdf_one_page,
                self.image_jpg,
                self.presentation_pptx,
                self.spreadsheet_xlsx,
                self.word_docx,
                self.image_signed,
                self.pdf_signed,
                self.presentation_signed,
                self.spreadsheet_signed,
                self.wordprocessing_signed,
                self.additional_signature01,
                self.additional_pfx,
                self.image_sign
            ]        
        end
    end
end