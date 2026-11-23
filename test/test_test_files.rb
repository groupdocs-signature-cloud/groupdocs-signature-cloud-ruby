#
# --------------------------------------------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="test_test_files.rb">
#    Copyright (c) Aspose Pty Ltd
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

require "minitest/autorun"

require_relative './test_file'

module GroupDocsSignatureCloud
  # Checks that test files are described in an OS independent way (no cloud connection required)
  class TestTestFiles < Minitest::Test

    def all_files
      TestFile.test_files_list + [TestFile.not_exist]
    end

    def test_remote_paths_use_forward_slashes
      all_files.each do |test_file|
        refute_includes test_file.path, "\\"
        assert test_file.folder.end_with?("/"), test_file.folder
      end
    end

    def test_local_files_exist
      # the same code resolves test files on Windows, Linux and macOS (case-sensitive file systems included)
      TestFile.test_files_list.each do |test_file|
        path = test_file.local_path
        assert File.absolute_path(path) == path, path
        assert File.file?(path), path
      end
    end

    def test_local_path_does_not_depend_on_working_directory
      test_file = TestFile.pdf_one_page
      expected = test_file.local_path
      Dir.chdir(File.dirname(File.expand_path(__FILE__))) do
        assert_equal expected, test_file.local_path
      end
    end

    def test_sizes_of_signed_files_match
      TestFile.test_files_list.each do |test_file|
        next if test_file.size.nil?
        assert_equal test_file.size, File.size(test_file.local_path), test_file.path
      end
    end

    def test_file_names_match_case_on_disk
      # Linux file systems are case sensitive, so the exact spelling is checked
      TestFile.test_files_list.each do |test_file|
        folder = File.join(TestFile::LOCAL_ROOT, *test_file.folder.split("/"))
        assert_includes Dir.children(folder), test_file.file_name
        assert_includes Dir.children(TestFile::LOCAL_ROOT), test_file.folder.split("/").first
      end
    end
  end
end
