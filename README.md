# CookingSimplified

## Video Demo

https://github.com/jadche/Cooking-Simplified/assets/50412448/61bc0019-67d7-420c-884e-c316ef405594

## Flowchart
<img width="1325" alt="Flow" src="https://github.com/jadche/Cooking-Simplified/assets/50412448/f4bb9716-9f41-48ea-b1ff-2de63e34f6e8">

## Database Schema

### Users Collection
The "users" collection in Firebase serves as the repository for user data within the application. Below is a breakdown of the fields comprising the schema:

1. **email**: String - User's email address.
2. **display_name**: String - User's chosen display name.
3. **photo_url**: Image Path - Path to user's profile photo.
4. **uid**: String - Unique user identifier.
5. **created_time**: DateTime - Timestamp of account creation.
6. **phone_number**: String - User's phone number.
7. **short_description**: String - User's brief bio.
8. **last_active_time**: DateTime - Timestamp of last user activity.
9. **role**: String - User's role or designation.
10. **title**: String - User's title or position.
11. **is_admin**: Boolean - Indicates admin privileges.

### Recipes Collection
The "recipes" collection in Firebase contains data related to recipes. Here's the breakdown of the schema:

1. **name**: String - The name of the recipe.
2. **short_description**: String - A brief description of the recipe.
3. **long_description**: String - A detailed description of the recipe.
4. **cook_time_min**: Integer - The cooking time in minutes.
5. **prep_time_min**: Integer - The preparation time in minutes.
6. **total_time_min**: Integer - The total time required to cook the recipe in minutes.
7. **card_image**: Image Path - Path to the recipe's image for display.
8. **details_image**: Image Path - Path to the recipe's detailed image.
9. **ingredients**: List<String> - List of ingredients needed for the recipe.
10. **is_favorite**: Boolean - Indicates whether the recipe is marked as a favorite.
11. **step_count**: Integer - The number of steps or instructions in the recipe.

### Steps Subcollection
The "steps" is a subcollection of the Recipes Collection contains data related to the steps or instructions for each recipe. Breakdown of the schema:

1. **step_no**: Integer - The step number or sequence in the recipe.
2. **step_image**: Image Path - Path to the image associated with the step (if applicable).
3. **step_maintext**: String - The main text or instructions for the step.
4. **step_subtext**: String - Additional subtext or details for the step.
5. **step_type**: Integer - Type of step (e.g., cooking, preparation, serving).
6. **step_time_min**: Integer - Time required for completing the step in minutes.
7. **step_color**: Color - Color representation for the step (if applicable).

### Ingredients Subcollection
The "ingredients" is another subcollection of the Recipes Collection, contains data related to ingredients used in recipes. Schema:

1. **name**: String - The name of the ingredient.
2. **description**: String - Description or additional information about the ingredient.
3. **image**: Image Path - Path to the image of the ingredient (if available).

## Image Recognition

<img width="412" alt="Screenshot 2024-02-28 at 6 30 44 AM" src="https://github.com/jadche/Cooking-Simplified/assets/50412448/e8289fdc-3e4b-4521-97b9-189959b96a80">
<img width="412" alt="Screenshot 2024-02-28 at 7 28 55 AM" src="https://github.com/jadche/Cooking-Simplified/assets/50412448/f78c365f-fe6b-45bf-90bf-cfd9091ea9ff">

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
