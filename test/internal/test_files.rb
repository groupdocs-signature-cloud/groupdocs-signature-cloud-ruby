# coding: utf-8
# -----------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="test_files.rb">
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

require_relative './test_file'

#Describes collection of files for tests.

module GroupDocsSignatureCloud_TestFiles

    class TestFiles
        include GroupDocsSignatureCloud_TestFile

        # Cells Documents

        def getFile01PagesCells
            TestFile.new("01_pages.xlsx", "storage", nil, nil)
        end

        def getFile02PagesCells
            TestFile.new("02_pages.xlsx", "storage", nil, nil)
        end

        def getFile01PagesCellsPwd
            TestFile.new("01_sheet_pwd.xlsx", "storage", "1234567890", nil)
        end

        def getFile01PagesCellsUrl
            TestFile.new("test.xlsx", "", nil, "https://www.dropbox.com/s/enuoff7umakf6es/test.xlsx?dl=1")
        end

        def getFileSignedCells
            TestFile.new("SignedForVerificationAll.xlsx", "signed", nil, nil)
        end

        def getFileSignedCellsUrl
            TestFile.new("SignedForVerificationAll.xlsx", "", nil, "https://www.dropbox.com/s/o9k7gweapq8k15l/SignedForVerificationAll.xlsx?dl=1")
        end

        # Images Documents

        def getFile01PagesDocImages
            TestFile.new("01_pages.png", "storage", nil, nil)
        end

        def getFile01PagesDocImagesUrl
            TestFile.new("test.png", "", nil, "https://www.dropbox.com/s/3hbc18wympow0j1/test.png?dl=1")
        end

        def getFileSignedDocImages
            TestFile.new("SignedForVerificationAll.png", "signed", nil, nil)
        end

        def getFileSignedDocImagesUrl
            TestFile.new("SignedForVerificationAll.png", "", nil, "https://www.dropbox.com/s/5d7a7ggmvklv1by/SignedForVerificationAll.png?dl=1")
        end

        # Pdf Documents 

        def getFile01PagesPdf
            TestFile.new("01_pages.pdf", "storage", nil, nil)
        end

        def getFile02PagesPdf
            TestFile.new("02_pages.pdf", "storage", nil, nil)
        end

        def getFile01PagesPdfPwd
            TestFile.new("01_pages_pwd.pdf", "storage", "1234567890", nil)
        end

        def getFile01PagesPdfUrl
            TestFile.new("test.pdf", "", nil, "https://www.dropbox.com/s/1ciqpmciqzdp9hu/test.pdf?dl=1")
        end

        def getFileSignedPdf
            TestFile.new("SignedForVerificationAll.pdf", "signed", nil, nil)
        end

        def getFileSignedPdfUrl
            TestFile.new("SignedForVerificationAll.pdf", "", nil, "https://www.dropbox.com/s/7yi03ieximjrh1y/SignedForVerificationAll.pdf?dl=1")
        end

        # Slides Documents

        def getFile01PagesSlides
            TestFile.new("01_pages.pptx", "storage", nil, nil)
        end

        def getFile02PagesSlides
            TestFile.new("02_pages.pptx", "storage", nil, nil)
        end

        def getFile01PagesSlidesUrl
            TestFile.new("test.pptx", "", nil, "https://www.dropbox.com/s/xbfanx78371yo6m/test.pptx?dl=1")
        end

        def getFileSignedSlides
            TestFile.new("SignedForVerificationAll.pptx", "signed", nil, nil)
        end

        def getFileSignedSlidesUrl
            TestFile.new("SignedForVerificationAll.pptx", "", nil, "https://www.dropbox.com/s/dxb9l68kevytz8e/SignedForVerificationAll.pptx?dl=1")
        end

        # Words Documents 

        def getFile01PagesWords
            TestFile.new("01_pages.docx", "storage", nil, nil)
        end

        def getFile02PagesWords
            TestFile.new("02_pages.docx", "storage", nil, nil)
        end

        def getFile01PagesPwdWords
            TestFile.new("01_pages_pwd.docx", "storage", "1234567890", nil)
        end

        def getFile01PagesWordsUrl
            TestFile.new("test.docx", "", nil, "https://www.dropbox.com/s/j260ve4f90h1p41/test.docx?dl=1")
        end

        def getFileSignedWords
            TestFile.new("SignedForVerificationAll.docx", "signed", nil, nil)
        end

        def getFileSignedWordsUrl
            TestFile.new("SignedForVerificationAll.docx", "", nil, "https://www.dropbox.com/s/zukdkxpuul0p8gm/SignedForVerificationAll.docx?dl=1")
        end

        # All signed files
        def getAllSignedFiles
            [getFileSignedCells, getFileSignedDocImages, getFileSignedPdf, getFileSignedSlides, getFileSignedWords]
        end

        # All storage files
        def getAllStorageFiles
            [getFile01PagesCells, getFile02PagesCells, getFile01PagesCellsPwd, getFile01PagesDocImages, getFile01PagesPdf, 
             getFile02PagesPdf, getFile01PagesPdfPwd, getFile01PagesSlides, getFile02PagesSlides, getFile01PagesWords, 
             getFile02PagesWords, getFile01PagesPwdWords ]
        end

        # Certificates 

        def getDigitalPfx
            TestFile.new("SherlockHolmes.pfx", "certificates", nil, nil)
        end
        
        def getDigitalPfxRsa
            TestFile.new("test_rsa_sha1_1024.pfx", "certificates", nil, nil)
        end
        
        def getDigitalCerRsa
            TestFile.new("test_rsa_sha1_1024.cer", "certificates", nil, nil)
        end
        
        def getAllCertificatesFiles
            [getDigitalPfx, getDigitalPfxRsa, getDigitalCerRsa]
        end

        # Image Documents 

        def getImage00
            TestFile.new("JohnSmithSign.png", "images", nil, nil)
        end

        def getImage01
            TestFile.new("signature_01.jpg", "images", nil, nil)
        end

        def getImage02
            TestFile.new("signature_02.jpg", "images", nil, nil)
        end

        def getImage03
            TestFile.new("signature_03.jpg", "images", nil, nil)
        end

        def getAllImagesFiles
            [getImage00, getImage01, getImage02, getImage03]
        end        

    end

end
