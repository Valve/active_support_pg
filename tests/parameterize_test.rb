require_relative 'test_helper'
describe 'parameterize' do
  it 'parameterizes correctly' do
    words = {
    "Donald E. Knuth"                     => "donald-e-knuth",
    "Random text with *(bad)* characters" => "random-text-with-bad-characters",
    "Allow_Under_Scores"                  => "allow_under_scores",
    "Trailing bad characters!@#"          => "trailing-bad-characters",
    "!@#Leading bad characters"           => "leading-bad-characters",
    "Squeeze   separators"                => "squeeze-separators",
    "Test with + sign"                    => "test-with-sign",
    #"Test with malformed utf8 \251"       => "test-with-malformed-utf8",
    "Malmö"                               => "malmo",
    "Garçons"                             => "garcons",
    #"Ops\331"                             => "opsu",
    "Ærøskøbing"                          => "aeroskobing",
    "Aßlar"                               => "aslar",
    "Japanese: 日本語"                    => "japanese"}
    words.each do |before, after|
      run_pg_function(:parameterize, before).must_equal(after)
    end
  end
end
