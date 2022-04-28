from django.db import models

class Player(models.Model):
    name = models.CharField(max_length=30)
    date_of_birth = models.DateField()
    img = models.URLField()

class BallonDor(models.Model):
    year = models.IntegerField()
    winner = models.OneToOneField(
        Player,
        on_delete=models.CASCADE,
        primary_key = False
        )
# Create your models here.
