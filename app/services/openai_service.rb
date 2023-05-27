require "openai"
require 'json'

class OpenaiService
  attr_reader :client, :prompt

	def initialize(prompt)
    @client = OpenAI::Client.new
    @prompt = prompt
  end

  def call
      parameters: {
        model: "text-davinci-003",
        prompt: prompt,
        max_tokens: 2000,
        temperature: 0.7,
        top_p: 1
      })
    JSON.parse(response['choices'][0]['text'])
  end
end
