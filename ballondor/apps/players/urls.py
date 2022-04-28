from rest_framework.routers import DefaultRouter

from ballondor.apps.players.views import BallonDorViewSet, PlayerViewSet

router = DefaultRouter()
router.register(r'player', PlayerViewSet)
router.register(r'ballondor', BallonDorViewSet)
urlpatterns = router.urls
