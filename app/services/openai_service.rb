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

        # 'Overall response'
        # response = response['choices'][0]['text'].tr('/("|{|}/','')
        # 'Question:'
        # question = response[response.chars.find_index(':')+1..response.chars.find_index('?')]
        # 'Choices: '
        # choices = response[response.chars.find_index('[')..response.chars.length].strip.split(',')
        # 'Answer'
        # answer = response[(response.chars.find_index('?') + 1)..response.chars.find_index('C')-1]
        # answer.tr(',', '').strip
        # return {
        #   question: question,
        #   choices: choices,
        #   answer: answer.tr(',', '')
        # }
        generated_text = response['choices'][0]['text'].strip
        generated_text.slice! 'Question:'
        generated_text.slice! 'Answer:'
        generated_text.slice! 'Choices:'

        generated_text.split(',', 2)

        generated_text.tr('/({|})/', '')
  end
end
