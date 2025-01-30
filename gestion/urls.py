from django.urls import path # type: ignore
from .views import create_cv, deconnexion,edit_cv, cv_success, envoyer_fichier_par_mail, list_cv, list_cv_by_etudiant, search_cv,view_cv,login_etudiant,etudiant_create,modifier_etudiant
from gestion import views

urlpatterns = [
    path('', list_cv, name='home'),  # URL pour la liste de tous les CV
    path('create_cv/', create_cv, name='create_cv'),
    path('cv_success/', cv_success, name='cv_success'),
    path('list_cv/', list_cv, name='list_cv'),  # URL pour la liste de tous les CV
    path('list_cv_by_etudiant/', list_cv_by_etudiant, name='list_cv_by_etudiant'),  # URL pour la liste de CV par étudiant
    path('view_cv/<int:cv_id>/', view_cv, name='view_cv'),  # URL pour afficher un CV
    path('edit_cv/<int:cv_id>/', edit_cv, name='edit_cv'),
    path('login/', login_etudiant, name='login_etudiant'),
    path('etudiant_creer/', etudiant_create, name='etudiant_create'),
    path('modifier_etudiant/', modifier_etudiant, name='modifier_etudiant'),
    path('contact/', views.contact_view, name='contact'),
    path('search/', search_cv, name='search_cv'),
    path('deconnexion/', deconnexion, name='deconnexion'),
    path('envoyer_fichier_par_mail/', envoyer_fichier_par_mail, name='envoyer_fichier_par_mail'),
    ]