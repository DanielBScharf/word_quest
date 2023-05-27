require "openai"
require 'json'

class OpenaiService
  attr_reader :client, :prompt

	def initialize(prompt)
    @client = OpenAI::Client.new
    @prompt = prompt
  end

  def call
    # response = client.chat(
    #   parameters: {
    #       model: "text-davinci-003", # Required.
    #       messages: [{ role: "user", content: prompt }], # Required.
    #       temperature: 1,
    #       stream: false,
    #       top_p: 1,

    #   })
    # # you might want to inspect the response and see what the api is giving you
    #  p  response
    # return   JSON.parse(response["choices"][0]["message"]["content"])
    response = client.completions(
      parameters: {
        model: "text-davinci-003",
        prompt: prompt,
        max_tokens: 2000,
        temperature: 0.7,
        top_p: 1
      })
      response['choices'][0]['text']
      response = JSON.parse(response['choices'][0]['text'])
  end
end
