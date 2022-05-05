# Django
import json
from django.test import TestCase

# Django Rest Framework
from rest_framework.test import APIClient
from rest_framework import status

# Models
from ballondor.apps.players.models import Player


class PlayerTestCase(TestCase):
    def setUp(self):
        player = Player(
            name='ronaldo',
            date_of_birth='1998-02-23',
            img='https://cosasdedevs.com/posts/unittest-con-django-rest-framework/',
        )
        player.save()

    def test_get(self):
        user = APIClient()
        response = user.get('/v1/player/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        print(json.loads(response.content)['results'][0])



    # def test_signup_user(self):
    #     """Check if we can create an user"""

    #     image = Image.new('RGB', (100, 100))

    #     tmp_file = tempfile.NamedTemporaryFile(suffix='.jpg')
    #     image.save(tmp_file)
    #     tmp_file.seek(0)

    #     client = APIClient()
    #     response = client.post(
    #             '/users/signup/', {
    #             'email': 'testing@cosasdedevs.com',
    #             'password': 'rc{4@qHjR>!b`yAV',
    #             'password_confirmation': 'rc{4@qHjR>!b`yAV',
    #             'first_name': 'Testing',
    #             'last_name': 'Testing',
    #             'phone': '999888777',
    #             'city': 'Madrid',
    #             'country': 'España',
    #             'photo': tmp_file,
    #             'extract': 'I am a testing',
    #             'username': 'testing1'
    #         },
    #         format='multipart'
    #     )

    #     self.assertEqual(response.status_code, status.HTTP_201_CREATED)
    #     self.assertEqual(json.loads(response.content), {"username":"testing1","first_name":"Testing","last_name":"Testing","email":"testing@cosasdedevs.com"})

    
    # def test_login_user(self):

    #     client = APIClient()
    #     response = client.post(
    #             '/users/login/', {
    #             'email': 'testing_login@cosasdedevs.com',
    #             'password': 'admin123',
    #         },
    #         format='json'
    #     )

    #     self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        
    #     result = json.loads(response.content)
    #     self.assertIn('access_token', result)
