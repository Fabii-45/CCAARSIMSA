package controllers;

import dtos.UpdateEtapeDto;
import entities.Coureur;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/")
public class MyController {


    /************************/
    /* GESTION PAGE ACCUEIL */
    /************************/

    /** Accès à la page d'accueil */
    @RequestMapping("")
    public String index(Model model) {
        // la liste synthétique des équipes
        model.addAttribute("equipes",null);
        // la liste synthétique des étapes
        model.addAttribute("etapes",null);
        // est-ce que la course est prête (classements préparés)
        // la course est prête une fois que l'on a saisi tous les coureurs et toutes les équipes
        // et que l'on a appelé la méthode "preparer Classement"
        model.addAttribute("pret",null);
        // classement général, vaut null si tous les classements
        // ne sont pas saisis
        model.addAttribute("general",null);
        return("index");
    }

    /************************/
    /* GESTION EQUIPE       */
    /************************/


    /** chargement d'une page présentant une équipe. */
    @GetMapping(value = "equipe")
    public String getEquipe(@RequestParam int id, Model model) {
        model.addAttribute("equipe", null);
        // est-ce que la course est prête (classements préparés, voir méthode "index")
        // Si prête on ne peut plus ajouter de coureur
        model.addAttribute("pret",null);
        return ("equipe");
    }

    /** juste pour ouvrir la page de création d'équipe */
    @GetMapping(value = "creerequipe")
    public String getEquipe() {
        return ("nomequipe");
    }

    /** crée une équipe */
    @PostMapping(value = "creerequipe")
    public String postEquipe(@RequestParam String nomEquipe, Model model) {
        // TODO création
        model.addAttribute("equipe", null);
        return ("equipe");
    }


    /** modification d'une équipe (nom) */
    @PostMapping(value = "renommerequipe")
    public String renommerEquipe(String nomEquipe, int idEquipe, Model model) {
        // TODO MODIFICATION
        model.addAttribute("equipe",null);
        return("equipe");
    }

    /** ajout d'un coureur dans une équipe */
    @PostMapping(value = "ajoutercoureur")
    public String postEquipe(Coureur coureur, int idEquipe, Model model) {
        // TODO création et ajout à l'équipe
        model.addAttribute("equipe",null);
        return("equipe");
    }

    /** désigne le leader de l'équipe */
    @PostMapping(value = "definirleader")
    public String nouveauLeader(int idEquipe,int idNouveauLeader,Model model) {
        // TODO définition commeleader
        model.addAttribute("equipe",null);
        return("equipe");
    }

    /************************/
    /* GESTION ETAPE        */
    /************************/


    /** chargement d'une page présentant une étape. Si l'id n'est pas fourni, crée une nouvelle étape */
    @GetMapping(value = "etape")
    public String getEtape(@RequestParam(defaultValue = "0") int idEtape, Model model) {
        //TODO création ou chargement de l'étape
        // TODO les infos du modèle (comme pour les autres méthodes)
        model.addAttribute("etape", null);
        model.addAttribute("typesEtape",null);
        model.addAttribute("pret",null);
        return ("etape");
    }

    /** prépare les classements : relie chaque coureur à chaque étape.
     * A l'issue de cette méthode, les coureurs sont inscrits dans chaque étape et la course est réputée "prête" */
    @GetMapping(value = "preparerclassements")
    public String preparerClassement(Model model){
        // TODO préparer les classements
        return index(model);
    }

    /** modification d'une étape */
    @PostMapping(value = "etape")
    public String updateEtape(UpdateEtapeDto etapeDto, Model model) {
        // TODO modification de l'étape
        model.addAttribute("etape", null);
        model.addAttribute("typesEtape",null);
        return ("etape");
    }

    @PostMapping(value = "classementetape")
    public String classementEtape(@RequestParam Map<String,String> tousTemps, @RequestParam int idEtape, Model model) {
        // "tousTemps" est une map <nom du paramètre, valeur du paramètre>
        // On triche un peu : ici "tousTemps" contient tous les paramètres, donc il contient l'id, mais ce n'est pas grave
        // on va pouvoir s'en servir dans la facade pour récupérer le temps de chaque coureur :
        // son temps est dans un paramètre "temps_xx" ou xx est l'id du coureur...
        // Pas très élégant, mais fonctionne
        // TODO mise à jour du classement de l'étape
        model.addAttribute("etape", null);
        model.addAttribute("typesEtape",null);
        return ("etape");
    }

}
