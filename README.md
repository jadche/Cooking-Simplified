# CookingSimplified

A new Flutter project.

## Getting Started

FlutterFlow projects are built to run on the Flutter _stable_ release.

## Video Demo

https://github.com/jadche/Cooking-Simplified/assets/50412448/61bc0019-67d7-420c-884e-c316ef405594

## Live Demo (Coming Soon)

## Flowchart
<img width="1325" alt="Flow" src="https://github.com/jadche/Cooking-Simplified/assets/50412448/f4bb9716-9f41-48ea-b1ff-2de63e34f6e8">

## Database Schema
<img width="307" alt="Screenshot 2024-02-28 at 7 25 29 AM" src="https://github.com/jadche/Cooking-Simplified/assets/50412448/6b465241-8f4a-4839-9707-35ee7d853e65">
Data Schema
<img width="508" alt="Screenshot 2024-02-28 at 7 26 14 AM" src="https://github.com/jadche/Cooking-Simplified/assets/50412448/28837947-2357-4dfd-894f-1ce7c7f65b27">
<img width="508" alt="Screenshot 2024-02-28 at 7 26 21 AM" src="https://github.com/jadche/Cooking-Simplified/assets/50412448/aeb23510-b4d5-4f3e-b056-943f3ff42aaa">
<img width="508" alt="Screenshot 2024-02-28 at 7 26 29 AM" src="https://github.com/jadche/Cooking-Simplified/assets/50412448/6bdd8371-e128-42f1-acef-9e1d2d70e6ee">
<img width="508" alt="Screenshot 2024-02-28 at 7 26 38 AM" src="https://github.com/jadche/Cooking-Simplified/assets/50412448/09e3b2cf-85e0-4501-b9cf-55dc018a8c29">

## Image Recognition
<img width="571" alt="Screenshot 2024-02-28 at 6 30 44 AM" src="https://github.com/jadche/Cooking-Simplified/assets/50412448/79d276fc-b9a7-46a3-8ba2-8cde7fd52ff4">
<img width="494" alt="Screenshot 2024-02-28 at 7 28 55 AM" src="https://github.com/jadche/Cooking-Simplified/assets/50412448/f78c365f-fe6b-45bf-90bf-cfd9091ea9ff">

```python
import requests
import vertexai
from google.cloud import firestore
from vertexai.vision_models import ImageTextModel, Image

PROJECT_ID = 'cookingsimplified-f8f94'
LOCATION = 'us-central1'

vertexai.init(project=PROJECT_ID, location=LOCATION)
model = ImageTextModel.from_pretrained("imagetext@001")

def download_file(url, filename):
    # Send a GET request to the URL
    response = requests.get(url)

    # Check if the request was successful
    if response.status_code == 200:
        # Open the file in binary write mode
        with open(filename, 'wb') as file:
            file.write(response.content)
        print(f"Downloaded file: {filename}")
    else:
        print(f"Failed to download file: status code {response.status_code}")


def entrypoint(event, context):
    """Triggered by a change to a Firestore document.
    Args:
         event (dict): Event payload.
         context (google.cloud.functions.Context): Metadata for the event.
    """

    # Firestore client creation
    db = firestore.Client()

    # Get the document path
    resource_string = context.resource
    document_path = resource_string.split('/documents/')[1]

    # Get the image path for the document, and download the image
    image_path = event['value']['fields']['image']['stringValue']
    download_file(image_path, "/tmp/image.jpg")
    source_image = Image.load_from_file(location='/tmp/image.jpg')

    answers = model.ask_question(
        image=source_image,
        question="What food ingredient is this a picture of?",
        number_of_results=1,
    )

    # Updating the caption field
    document_reference = db.document(document_path)
    document_reference.update({'name': answers[0].capitalize()})
```

## Conclusion

## Future Updates

## APK

https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/build_outputs/cooking-simplified-q6gjjs/web/ittnDWLVEdOFVssuVF5v/CookingSimplified-release.apk


