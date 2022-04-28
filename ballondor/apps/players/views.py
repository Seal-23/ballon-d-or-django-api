from django.shortcuts import render
from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated
from ballondor.apps.players.models import Player ,BallonDor
from ballondor.apps.players.serializers import BallonDorSerializer, PlayerSerializer
# Create your views here.

class PlayerViewSet(viewsets.ModelViewSet):
    queryset = Player.objects.all()
    serializer_class = PlayerSerializer

class BallonDorViewSet(viewsets.ModelViewSet):
    queryset = BallonDor.objects.all()
    serializer_class = BallonDorSerializer
