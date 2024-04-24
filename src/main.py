import os
from fastapi import FastAPI
from fastapi.responses import StreamingResponse
from pydantic import BaseModel
import openai
import uvicorn

# App
app = FastAPI()

# Azure OpenAI Authentication
endpoint = os.environ["AZURE_OPEN_AI_ENDPOINT"]
api_key = os.environ["AZURE_OPEN_AI_API_KEY"]

client = openai.AsyncAzureOpenAI(
    azure_endpoint=endpoint,
    api_key=api_key,
    api_version="2023-09-01-preview"
)

# Azure OpenAI Model Configuration
deployment = os.environ["AZURE_OPEN_AI_DEPLOYMENT_MODEL"]
temperature = 0.7

# Prompt
class Prompt(BaseModel):
    input: str

# Generate Stream
async def stream_generator(subscription):
    async for chunk in subscription:
        if len(chunk.choices) > 0:
            delta = chunk.choices[0].delta
            if delta.content:
                yield delta.content


# API Endpoint
@app.post("/stream")
async def stream(prompt: Prompt):
    response = await client.chat.completions.create(
        model=deployment,
        temperature=temperature,
        messages=[{"role": "user", "content": prompt.input}],
        stream=True
    )

    return StreamingResponse(stream_generator(response), media_type="text/event-stream")


if __name__ == "__main__":
    uvicorn.run("main:app", port=8000)