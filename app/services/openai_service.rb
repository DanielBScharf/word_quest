require "openai"
require 'json'

class OpenaiService
  attr_reader :client, :prompt

  def initialize(prompt)
    @client = OpenAI::Client.new
    @prompt = prompt
  end

  def call
    response = client.completions(parameters: { model: "text-davinci-003",
                                                prompt: @prompt,
                                                max_tokens: 256,
                                                temperature: 1,
                                                top_p: 1,
                                                best_of: 1,
                                                frequency_penalty: 0,
                                                presence_penalty: 0.1 })
    JSON.parse(response['choices'][0]['text'])
  end
end
