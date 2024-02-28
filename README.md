# CookingSimplified

In embarking on this project, my primary goal was to explore the efficiencies afforded by low-code platforms such as FlutterFlow in app development. The results surpassed my expectations. Completing this project in a mere 14 days illuminated the significant time-saving potential of leveraging low-code tools. This timeframe nearly halved the typical development lifecycle for an app, all while simultaneously targeting three distinct platforms: iOS, Android, and web.

## Video Demo

https://github.com/jadche/Cooking-Simplified/assets/50412448/61bc0019-67d7-420c-884e-c316ef405594

# Table of Contents

1. [Introduction](#introduction)
2. [Video Demo](#video-demo)
3. [Flowchart](#flowchart)
4. [Database Schema](#database-schema)
5. [Image Recognition](#image-recognition)
6. [Future Updates](#future-updates)
7. [APK](#apk)

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

The following Python script is designed to be deployed as a Google Cloud Function triggered by the creation of a document in the ingredients collection. We utilizes various libraries, including requests, vertexai, and google.cloud, to perform image analysis and update Firestore documents accordingly.

```python
import requests
import vertexai
from google.cloud import firestore
from vertexai.vision_models import ImageTextModel, Image
```

The script begins by initializing the necessary variables, including the Google Cloud project ID and location, and loading a pre-trained ImageText model from Vertex AI. It defines a function, download_file, to download an image from a given URL and save it locally.

```python
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
```

The entrypoint function is the main entry point for the Cloud Function. It is triggered by the creation of a Firestore document. Upon invocation, it retrieves the Firestore client and extracts the document path from the event metadata. It then retrieves the URL of the image associated with the document, downloads the image, and creates an Image object from it.


```python
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
```

Using the pre-trained ImageText model, the script asks a question about the content of the image, specifically identifying food ingredients. It then updates the Firestore document with the identified ingredient, capitalizing the answer, and setting it to the 'name' field.

```python
    answers = model.ask_question(
        image=source_image,
        question="What food ingredient is this a picture of?",
        number_of_results=1,
    )

    # Updating the caption field
    document_reference = db.document(document_path)
    document_reference.update({'name': answers[0].capitalize()})
```

## Future Updates

In the pipeline for future updates, I'm excited to introduce additional features that will further enhance the user experience. One such addition will be a timer option, empowering users to effortlessly keep track of cooking times directly within the app. This feature aims to streamline the cooking process, ensuring precision and convenience for users.

Additionally, I plan to implement recipe recommendations based on the user's available ingredients. Leveraging the robust capabilities of Google Cloud Platform Vertex AI, which is already integrated into the project, this functionality will provide personalized recipe suggestions tailored to each user's unique pantry items. By harnessing the power of machine learning and AI, this feature will offer users a convenient way to discover new recipes and make the most out of their ingredients. Stay tuned for these exciting updates as we continue to evolve and innovate within the app.

## APK

https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/build_outputs/cooking-simplified-q6gjjs/web/ittnDWLVEdOFVssuVF5v/CookingSimplified-release.apk
