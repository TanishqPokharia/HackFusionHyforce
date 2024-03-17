import google.generativeai as genai


GOOGLE_API_KEY = 'Gemini_API_KEY'

genai.configure(api_key=GOOGLE_API_KEY)


def Ask_Gemini(query):
    model = genai.GenerativeModel('gemini-pro')
    response = model.generate_content(query)
    return response.text

#print(Ask_Gemini("What is Myocardial Infarction?"))
