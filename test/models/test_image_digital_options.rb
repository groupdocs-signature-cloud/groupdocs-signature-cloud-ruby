#
# --------------------------------------------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="test_image_digital_options.rb">
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

require "json"
require "minitest/autorun"

require_relative './../../lib/groupdocs_signature_cloud'

module GroupDocsSignatureCloud
  # ImageDigital models unit tests (do not require a cloud connection)
  class TestImageDigitalOptions < Minitest::Test

    def api_client
      ApiClient.new(Configuration.new("sid", "key"))
    end

    def serialize(model)
      JSON.parse(api_client.object_to_http_body(model))
    end

    def test_sign_options
      options = SignImageDigitalOptions.new(SignatureType: "ImageDigital", Password: "embed-password")
      assert_equal "ImageDigital", options.signature_type
      assert_equal "embed-password", options.password
      assert options.respond_to?(:appearance)
    end

    def test_sign_options_serialization
      options = SignImageDigitalOptions.new
      options.signature_type = "ImageDigital"
      options.password = "embed-password"
      options.all_pages = true
      data = serialize(options)
      assert_equal "ImageDigital", data["SignatureType"]
      assert_equal "embed-password", data["Password"]
      assert_equal true, data["AllPages"]
    end

    def test_verify_options
      options = VerifyImageDigitalOptions.new(SignatureType: "ImageDigital", Password: "embed-password",
                                              DetectionThresholdPercent: 75, UseFullDataExtraction: true)
      assert_equal "ImageDigital", options.signature_type
      assert_equal "embed-password", options.password
      assert_equal 75, options.detection_threshold_percent
      assert_equal true, options.use_full_data_extraction
    end

    def test_verify_options_serialization
      options = VerifyImageDigitalOptions.new
      options.signature_type = "ImageDigital"
      options.password = "embed-password"
      options.detection_threshold_percent = 75
      options.use_full_data_extraction = true
      data = serialize(options)
      assert_equal "ImageDigital", data["SignatureType"]
      assert_equal "embed-password", data["Password"]
      assert_equal 75, data["DetectionThresholdPercent"]
      assert_equal true, data["UseFullDataExtraction"]
    end

    def test_verify_options_deserialization
      options = VerifyImageDigitalOptions.new.build_from_hash(
        :signatureType => "ImageDigital", :password => "embed-password",
        :detectionThresholdPercent => 50, :useFullDataExtraction => false)
      assert_equal "ImageDigital", options.signature_type
      assert_equal 50, options.detection_threshold_percent
      assert_equal false, options.use_full_data_extraction
    end

    def test_options_equality
      first = VerifyImageDigitalOptions.new(SignatureType: "ImageDigital", Password: "a")
      second = VerifyImageDigitalOptions.new(SignatureType: "ImageDigital", Password: "a")
      assert_equal first, second
      assert_equal first.hash, second.hash
      second.password = "b"
      refute_equal first, second
    end

    def test_image_digital_signature_type_is_supported
      [OptionsBase, DeleteOptions, UpdateOptions, Signature, SignOptions, VerifyOptions, SearchOptions].each do |model|
        instance = model.new
        instance.signature_type = "ImageDigital"
        assert_equal "ImageDigital", instance.signature_type, model.name
      end
    end

    def test_image_digital_signature_type_by_index
      # the service may return enum as a number, ImageDigital is the last item of the enum
      options = OptionsBase.new
      options.signature_type = "9"
      assert_equal "ImageDigital", options.signature_type
    end

    def test_unknown_signature_type_is_rejected
      assert_raises(ArgumentError) { OptionsBase.new.signature_type = "Unknown" }
    end

    def test_pdf_digital_signature_appearance_foreground_image
      appearance = PdfDigitalSignatureAppearance.new(IsForegroundImage: true)
      assert_equal true, appearance.is_foreground_image
      assert_equal true, serialize(appearance)["IsForegroundImage"]
      assert_equal false, PdfDigitalSignatureAppearance.new.build_from_hash(:isForegroundImage => false).is_foreground_image
    end

    def test_version
      assert_equal "26.11", VERSION
    end
  end
end
