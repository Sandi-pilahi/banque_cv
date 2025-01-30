from django.db.models import Q
from django.http import JsonResponse,HttpResponse
from django.shortcuts import render, redirect, get_object_or_404

from banque_cv.settings import EMAIL_HOST_USER # type: ignore
from .models import Etudiant, CV, Formation, Experience, Competence, Langue, Loisir, Projet
from .forms import EtudiantForm
from django.http import HttpResponse
from django.views.decorators.http import require_http_methods
from django.core.mail import EmailMessage # type: ignore


def cv_success(request):
    return render(request, 'gestion/success.html')  # Assurez-vous d'avoir ce template
def create_cv(request):
    if request.session.get('utilisateur') is not None:
        # Récupérer l'étudiant par son identifiant
        etudiant = get_object_or_404(Etudiant, id=request.session.get('utilisateur'))

        if request.method == 'POST' :
            # Récupérer les informations du CV
            titre = request.POST.get('titre')
            description = request.POST.get('description')

            # Créer un CV pour l'étudiant
            cv = CV.objects.create(etudiant=etudiant, titre=titre, description=description)

            # Enregistrer les formations
            diplomes_list = request.POST.getlist('diplomes[]')
            etablissement_list = request.POST.getlist('etablissement[]')
            localite_list = request.POST.getlist('localite[]')
            date_debut_list = request.POST.getlist('date_debut[]')
            date_fin_list = request.POST.getlist('date_fin[]')

            for date_fin,date_debut, diplomes, etablissement, localite in zip(date_debut_list, date_fin_list, diplomes_list, etablissement_list, localite_list):
                Formation.objects.create(
                    cv=cv,
                    diplomes=diplomes,
                    date_debut=date_debut,
                    date_fin=date_fin,
                    etablissement=etablissement,
                    localite=localite
                )

            # Enregistrer les expériences
            date_debut_list = request.POST.getlist('date_debut[]')
            date_fin_list = request.POST.getlist('date_fin[]')
            titre_experience_list = request.POST.getlist('titre_experience[]')
            entreprise_list = request.POST.getlist('entreprise[]')
            taches_list = request.POST.getlist('taches[]')
            
            for date_debut, date_fin, titre_experience, entreprise, taches in zip(date_debut_list, date_fin_list, titre_experience_list, entreprise_list, taches_list):
                Experience.objects.create(
                    cv=cv,
                    date_debut=date_debut,
                    date_fin=date_fin,
                    titre=titre_experience,
                    entreprise=entreprise,
                    taches=taches,
                )

            # Enregistrer les compétences
            titre_competence_list = request.POST.getlist('titre_competence[]')
            competence_niveau_list = request.POST.getlist('competence_niveau')

            for titre_competence, niveau in zip(titre_competence_list, competence_niveau_list):
                Competence.objects.create(

                    cv=cv,
                    titre=titre_competence,
                    niveau=niveau
                )

            # Enregistrer les langues
            langues_list = request.POST.getlist('langues[]')
            for langue in langues_list:
                Langue.objects.create(

                    cv=cv,
                    nom=langue
                )

            # Enregistrer les loisirs
            loisirs_list = request.POST.getlist('libelle_loisir[]')
            for loisir in loisirs_list:
                Loisir.objects.create(

                    cv=cv,
                    libelle=loisir
                )

            # Enregistrer les projets
            titre_projet_list = request.POST.getlist('titre_projet[]')
            description_projet_list = request.POST.getlist('description_projet[]')

            for titre_projet, description_projet in zip(titre_projet_list, description_projet_list):
                Projet.objects.create(

                    cv=cv,
                    titre=titre_projet,
                    description=description_projet
                )

            # Rediriger vers une page de succès ou vers la liste des CV
            return redirect('view_cv',cv_id=cv.id)  # Remplacez 'cv_success' par le nom de votre URL de redirection

        return render(request, 'gestion/create_cv.html', {'etudiant': etudiant})
    else:
        return redirect('login_etudiant')

def list_cv(request):
    if request.session.get('utilisateur') is not None:
        # Récupérer tous les CV disponibles
        cv_list = CV.objects.all()
        
        # Créer un dictionnaire pour stocker les CV par étudiant
        cv_dict = {}
        for cv in cv_list:
            if cv.etudiant.id not in cv_dict:
                cv_dict[cv.etudiant.id] = cv
        
        # Récupérer les CV uniques
        cv_list = list(cv_dict.values())
        
        return render(request, 'gestion/list_cv.html', {'cv_list': cv_list})
    else:
        return redirect('login_etudiant')
def list_cv_by_etudiant(request):
     if request.session.get('utilisateur') is not None :
        # Récupérer l'étudiant par son identifiant
        etudiant = get_object_or_404(Etudiant, id=request.session.get('utilisateur'))
        # Récupérer tous les CV de cet étudiant
        cv_list = CV.objects.filter(etudiant=etudiant)
        return render(request, 'gestion/list_cv_user.html', {'etudiant': etudiant, 'cv_list': cv_list})
     else:
         return redirect('login_etudiant')

def view_cv(request, cv_id):
    # Récupérer le CV par son identifiant
    cv = get_object_or_404(CV, id=cv_id)

    # Récupérer l'étudiant associé au CV
    etudiant = cv.etudiant

    # Récupérer les éléments associés au CV
    formations = Formation.objects.filter(cv=cv)
    experiences = Experience.objects.filter(cv=cv)
    competences = Competence.objects.filter(cv=cv)
    langues = Langue.objects.filter(cv=cv)
    loisirs = Loisir.objects.filter(cv=cv)

    # Rendre le template avec tous les éléments
    return render(request, 'gestion/cv.html', {
        'cv': cv,
        'etudiant': etudiant,
        'formations': formations,
        'experiences': experiences,
        'competences': competences,
        'langues': langues,
        'loisirs': loisirs,
    })
def edit_cv(request, cv_id):

    # Récupérer le CV par son identifiant
    cv = get_object_or_404(CV, id=cv_id)
  # Récupérer l'étudiant associé au CV
    if request.session.get('utilisateur') is not None :
        if request.session.get('utilisateur') ==cv.etudiant.id:
            if request.method == 'POST':
                # Mettre à jour les informations du CV
                cv.titre = request.POST.get('titre')
                cv.description = request.POST.get('description')
                cv.save()

                # Mettre à jour les formations
                Formation.objects.filter(cv=cv).delete()  # Supprimer les anciennes formations
                diplomes_list = request.POST.getlist('diplomes[]')
                etablissement_list = request.POST.getlist('etablissement[]')
                localite_list = request.POST.getlist('localite[]')
                date_debut_list = request.POST.getlist('date_debut[]')
                date_fin_list = request.POST.getlist('date_fin[]')
                

                for  date_debut, date_fin, diplomes, etablissement, localite in zip(date_fin_list, date_debut_list, diplomes_list, etablissement_list, localite_list):
                    
                    Formation.objects.create(
                        cv=cv,
                        diplomes=diplomes,
                        etablissement=etablissement,
                        localite=localite,
                        date_debut=date_debut,
                        date_fin=date_fin
                    )

                # Mettre à jour les expériences
                Experience.objects.filter(cv=cv).delete()  # Supprimer les anciennes expériences
                date_debut_list = request.POST.getlist('date_debut[]')
                date_fin_list = request.POST.getlist('date_fin[]')
                titre_experience_list = request.POST.getlist('titre_experience[]')
                entreprise_list = request.POST.getlist('entreprise[]')
                taches_list = request.POST.getlist('taches[]')
                for date_debut, date_fin, titre_experience, entreprise, taches in zip(date_debut_list, date_fin_list, titre_experience_list, entreprise_list, taches_list):
                    Experience.objects.create(
                        cv=cv,
                        date_debut=date_debut,
                        date_fin=date_fin,
                        titre=titre_experience,
                        entreprise=entreprise,
                        taches=taches,
                    )

                # Mettre à jour les compétences
                Competence.objects.filter(cv=cv).delete()  # Supprimer les anciennes compétences
                titre_competence_list = request.POST.getlist('titre_competence[]')
                competence_niveau_list = request.POST.getlist('competence_niveau')

                for titre_competence, niveau in zip(titre_competence_list, competence_niveau_list):
                    Competence.objects.create(
                        cv=cv,
                        titre=titre_competence,
                        niveau=niveau
                    )

                # Mettre à jour les langues
                Langue.objects.filter(cv=cv).delete()  # Supprimer les anciennes langues
                langues_list = request.POST.getlist('langues[]')
                for langue in langues_list:
                    Langue.objects.create(
                        cv=cv,
                        nom=langue
                    )

                # Mettre à jour les loisirs
                Loisir.objects.filter(cv=cv).delete()  # Supprimer les anciens loisirs
                loisirs_list = request.POST.getlist('libelle_loisir[]')
                for loisir in loisirs_list:
                    Loisir.objects.create(
                        cv=cv,
                        libelle=loisir
                    )

                # Mettre à jour les projets
                Projet.objects.filter(cv=cv).delete()  # Supprimer les anciens projets
                titre_projet_list = request.POST.getlist('titre_projet[]')
                description_projet_list = request.POST.getlist('description_projet[]')

                for titre_projet, description_projet in zip(titre_projet_list, description_projet_list):
                    Projet.objects.create(
                        cv=cv,
                        titre=titre_projet,
                        description=description_projet
                    )

                # Rediriger vers une page de succès ou vers la liste des CV
                return redirect('view_cv', cv_id=cv_id)  # Remplacez 'cv_success' par le nom de votre URL de redirection

            # Récupérer les éléments associés au CV pour pré-remplir le formulaire
            formations = Formation.objects.filter(cv=cv)
            experiences = Experience.objects.filter(cv=cv)
            competences = Competence.objects.filter(cv=cv)
            langues = Langue.objects.filter(cv=cv)
            loisirs = Loisir.objects.filter(cv=cv)
            projets = Projet.objects.filter(cv=cv)

            # Rendre le formulaire avec les données actuelles
            return render(request, 'gestion/edit_cv.html', {
                'cv': cv,
                'formations': formations,
                'experiences': experiences,
                'competences': competences,
                'langues': langues,
                'loisirs': loisirs,
                'projets': projets,
            })
        else:
            redirect('list_cv')

    else:
        return redirect('login_etudiant')

def login_etudiant(request):
    if request.session.get('utilisateur') is None:
        if request.method == 'POST':
            identifiant = request.POST.get('email')
            mot_de_passe = request.POST.get('mot_de_passe')
            
            print(identifiant, mot_de_passe)
            
            try:
                etudiant = Etudiant.objects.get(email=identifiant)
                print("test1")
                print(etudiant.verifier_mot_de_passe(mot_de_passe))
                if etudiant.verifier_mot_de_passe(mot_de_passe):
                    request.session['utilisateur']=etudiant.id
                    print(request.session.get('utilisateur'))
                    print("test2")  # Connecter l'étudiant
                    return redirect('list_cv')  # Rediriger vers la page de succès ou autre
                else:
                    print("test3")
                    # Vous pouvez gérer l'erreur ici, par exemple en ajoutant un message d'erreur à la requête
                    error_message = "Email ou mot de passe incorrect."
            except Etudiant.DoesNotExist:
                error_message = "Email ou mot de passe incorrect."
                print('test4')
            # Si une erreur s'est produite, vous pouvez la passer au contexte pour l'afficher dans le template
            return render(request, 'gestion/connexion.html', {'error_message': error_message})

        return render(request, 'gestion/connexion.html')
    else:
        return redirect('list_cv')

def etudiant_create(request):
    if request.session.get('utilisateur') is None:
        if request.method == 'POST':
            form = EtudiantForm(request.POST, request.FILES)
            if form.is_valid():
                etudiant = form.save(commit=False)
                mot_de_passe = form.cleaned_data.get('mot_de_passe')
                etudiant.set_mot_de_passe(mot_de_passe)
                etudiant.save()
                return redirect('login_etudiant')  # Redirige après la création
        else:
            form = EtudiantForm()
        return render(request, 'gestion/inscription.html', {'form': form})
    else:
        return redirect('list_cv')

def generate_cv_pdf(request, id):
    # Votre code pour générer le PDF du CV
    pass


def modifier_etudiant(request):
    etudiant = get_object_or_404(Etudiant, id=request.session.get('utilisateur'))
    if request.session.get('utilisateur') is not None and  request.session.get('utilisateur') ==etudiant.id:
        if request.method == 'POST':
            # Récupérer les données du POST
            etudiant.prenom = request.POST.get('prenom', etudiant.prenom)
            etudiant.nom = request.POST.get('nom', etudiant.nom)
            etudiant.email = request.POST.get('email', etudiant.email)
            etudiant.contact = request.POST.get('contact', etudiant.contact)
            etudiant.age = request.POST.get('age', etudiant.age)
            etudiant.nationalite = request.POST.get('nationalite', etudiant.nationalite)
            etudiant.situation_matrimoniale = request.POST.get('situation_matrimoniale', etudiant.situation_matrimoniale)
            etudiant.mobile = request.POST.get('mobile', etudiant.mobile)
            etudiant.facebook = request.POST.get('facebook', etudiant.facebook)
            etudiant.linkedin = request.POST.get('linkedin', etudiant.linkedin)
            etudiant.instagram = request.POST.get('instagram', etudiant.instagram)

            # Gérer le téléchargement de la photo
            if request.FILES.get('photo'):
                etudiant.photo = request.FILES['photo']

            # Enregistrer les modifications
            etudiant.save()
            return redirect('modifier_etudiant')  # Redirigez vers une page de détail ou une autre page

        return render(request, 'gestion/modifier_etudiant.html', {'etudiant': etudiant})
    else:
        return redirect('list_cv')
def contact_view(request):
     return render(request, 'gestion/contact.html')
def deconnexion(request):
        if 'utilisateur' in request.session:
                del request.session['utilisateur']
                return redirect('login_etudiant')
        else:
                return redirect('list_cv')
def search_cv(request):
    if request.method == 'GET':
        query = request.GET.get('query', '')
        cv_list = CV.objects.filter(Q(etudiant__nom__icontains=query) | 
            Q(etudiant__prenom__icontains=query) | 
            Q(titre__icontains=query)
        ).distinct()       
        return render(request, 'gestion/list_cv.html',{'cv_list':cv_list})
    




@require_http_methods(['POST'])


def envoyer_fichier_par_mail(request):
    if request.method == 'POST':
        if 'fichier' in request.FILES:
            fichier = request.FILES['fichier']
            email = request.POST['email']
            # Vérification de l'adresse e-mail
            # Traitement du fichier
            sujet = 'Fichier envoyé par mail'
            message = 'Bonjour, voici le fichier que vous avez demandé.'
            from_email = EMAIL_HOST_USER
            to_email = email
            # Envoi du fichier par mail
            try:
                email_message = EmailMessage(sujet, message, from_email, [to_email])
                email_message.attach(fichier.name, fichier.read(), fichier.content_type)
                email_message.send(fail_silently=False)
                return HttpResponse("Fichier envoyé avec succès.")
            except Exception as e:
                return HttpResponse("Erreur lors de l'envoi de l'e-mail : " + str(e))
        else:
            # Gestion de l'erreur
            return HttpResponse("Aucun fichier n'a été envoyé.")
    else:
        return HttpResponse("Méthode non autorisée.")
    
