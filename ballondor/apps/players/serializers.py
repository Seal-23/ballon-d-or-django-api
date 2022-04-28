from dataclasses import field, fields
from pyexpat import model
from rest_framework import serializers

from ballondor.apps.players.models import BallonDor, Player 

class PlayerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Player
        fields = '__all__'

class BallonDorSerializer(serializers.ModelSerializer):
    class Meta:
        model = BallonDor
        fields = '__all__'
