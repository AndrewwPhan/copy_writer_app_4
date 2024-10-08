require 'openai'

class OpenaiService
  def initialize
    @client = OpenAI::Client.new(access_token: Rails.application.credentials.openai[:api_key])
  end

  def enhance_content(content)
    response = @client.completions(
      parameters: {
        model: "text-davinci-003",
        prompt: "Enhance the following content: #{content}",
        max_tokens: 150
      }
    )
    response.dig("choices", 0, "text")
  end
end