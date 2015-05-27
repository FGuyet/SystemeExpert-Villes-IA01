;; TD10

(setq RE NIL)
(setq BF '())

(setq *villes* '(
                 Compi�gne
                 Paris
                 Shanghai
                 Tokyo
                 New_York
                 Los_Angeles
                 Tombouctou
                 Johannesburg
                 Canberra
                 Kuala_Lumpur
                 Rio_de_Janeiro
                 Mexico
                 Moscou
                 Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch
                 Prague
                 Marrakech
                 Honolulu
                 Pyongyang
                 Bombay
                 Londres))

(dolist (v *villes*)  ;; Permet de marquer (suis-je-� (')Compi�gne) avec ou sans (')
  (set v v))


(setq BR '(
          (R1 : Si (ethnie = asiatique et �criture = sinogramme) alors (continent = Asie-est))
          (R2 : Si (ethnie = asiatique et �criture = abjad) alors (continent = Asie-sud-est))
          (R3 : Si (ethnie = asiatique et �criture = latine) alors (rep_ile = (Demander "Est-ce que vous �tes sur une �le ? ")))
          (R4 : Si (ethnie = sudasiatique) alors (continent = Asie-ouest))
          (R5 : Si (ethnie = arabe) alors (r�gion_monde = Pays_du_Maghreb))
          (R6 : Si (ethnie = africain) alors (continent = Afrique))
          (R7 : Si (ethnie = caucasien et temp�rature > 13 et temp�rature < 28 et conduite = gauche) alors (continent = Oc�anie))
          (R8 : Si (langue = anglais) alors (type_pays = anglophone))
          (R9 : Si (langue = espagnol) alors (type_pays = latin))
          (R10 : Si (langue = fran�ais) alors (type_pays = latin))
          (R11 : Si (langue = portugais) alors (type_pays = latin))
          (R12 : Si (type_pays = latin et temp�rature > 7) alors (rep_piece1_centre = (Demander "Trouver une pi�ce de 1 de la monnaie, est-ce que le centre de la pi�ce est grise ?")))
          (R13 : Si (rep_piece1_centre = oui) alors (piece1_centre = grise))
          (R14 : Si (rep_piece1_centre = non) alors (piece1_centre = or))
          (R15 : Si (piece1_centre = grise et temp�rature > 22 et temp�rature < 31) alors (pays = Br�sil))
          (R16 : Si (pays = Br�sil) alors (ville = Rio_de_Janeiro))
          (R17 : Si (piece1_centre = or) alors (pays = Mexique))
          (R18 : Si (pays = Mexique) alors (ville = Mexico))
          (R19 : Si (ethnie = caucasien et type_pays = anglophone et conduite = droite) alors (pays = USA) )
          (R20 : Si (ethnie = caucasien et type_pays = anglophone et conduite = gauche et temp�rature < 9) alors (pays = Grande-Bretagne) )
          (R21 : Si (pays = USA et temp�rature < 5) alors (ville = New_York))
          (R22 : Si (pays = USA et temp�rature > 9) alors (ville = Los_Angeles))
          (R23 : Si (type_pays = latin et temp�rature < 7 et temperature > -4) alors (pays = France))
          (R24 : Si (pays = France) alors (r�ponse_fr = (demander "Marcher pendant 20 minutes, avez-vous crois� une bouche de m�tro ?")))
          (R25 : Si (r�ponse_fr = oui) alors (ville = Paris))
          (R26 : Si (r�ponse_fr = non) alors (ville = Compi�gne))
          (R27 : Si (pays = Grande-Bretagne) alors (r�ponse_gb = (demander "Marcher pendant 20 minutes, est-ce que les panneaux sont �cris en plusieurs langues ?")))
          (R28 : Si (r�ponse_gb = oui) alors (ville = Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch))
          (R29 : Si (r�ponse_gb = non) alors (ville = Londres))
          (R30 : Si (continent = Asie-est et temp�rature < 0 ) alors (Pays = Cor�e_du_Nord))
          (R31 : Si (Pays = Cor�e_du_Nord) alors (Ville = Pyongyang))
          (R32 : Si (continent = Asie-est et conduite = gauche et temp�rature < 11) alors (Pays = Japon))
          (R33 : Si (Pays = Japon) alors (Ville = Tokyo))
          (R34 : Si (continent = Asie-ouest et conduite = gauche et temp�rature > 18) alors (Pays = Inde))
          (R35 : Si (pays = Inde) alors (ville = Bombay))
          (R36 : Si (continent = Asie-sud-est et conduite = droite et temp�rature > 21) alors (Pays = Malaisie))
          (R37 : Si (Pays = Malaisie) alors (ville = Kuala_Lumpur))
          (R38 : Si (continent = Asie-est et conduite = droite et temp�rature < 10 et temp�rature > 0) alors (Pays = Chine))
          (R39 : Si (pays = Chine) alors (ville = Shanghai))
          (R40 : Si (ethnie = caucasien et temp�rature > -5 et temp�rature < 2) alors (r�ponse_cau = (Demander "Regardez l��criture: Est-ce qu�il y a des accents ou des c�dilles sur des consonnes autres que �")))
          (R41 : Si (r�ponse_cau = oui) alors (pays = Republique_Tch�que))
          (R42 : Si (pays = Republique_Tch�que) alors (ville = Prague))
          (R43 : Si (Pays = Australie) alors (Ville = Canberra))
          (R44 : Si (Continent = Oc�anie) alors (r�ponse_mo = (Demander "Le 1 dollar est-il une pi�ce ?")))
          (R45 : Si (r�ponse_mo = oui) alors (pays = Australie))
          (R46 : Si (r�ponse_mo = non) alors (etat = Hawa�))
          (R47 : Si (etat = Hawa�) alors (ville = Honolulu))
          (R48 : Si (ethnie = caucasien et temp�rature < -7) alors (continent = Eurasie))
          (R49 : Si (continent = Eurasie) alors (Pays = Russie))
          (R50 : Si (Pays = Russie) alors (ville = Moscou))
          (R51 : Si (continent = Afrique et conduite = gauche) alors (pays = Afrique_du_Sud))
          (R52 : Si (pays = Afrique_du_Sud) alors (ville = Johannesburg))
          (R53 : Si (continent = Afrique et temp�rature > 12 et temp�rature < 31 et conduite = droite) alors (pays = Mali))
          (R54 : Si (r�gion_monde = Pays_du_Maghreb et temp�rature > 5 et temp�rature < 19 et conduite = droite) alors (pays = Maroc))
          (R55 : Si (pays = Mali ) alors (ville = Tombouctou))
          (R56 : Si (pays = Maroc) alors (ville = Marrakech))
          (R57 : Si (langue = francais) alors (type_pays = latin))
	  (R68 : Si (rep_ile = oui) alors (etat = Hawa�))
          ))

(defun premisses (R)
  (setq pfinal NIL)
  (let ((p (caddr(assoc R BR)) ))
    (reorganiser_p p)
    ))

(defun reorganiser_p (p)
  (push (list (cadr p) (car p) (caddr p)) pfinal)
  (pop p) (pop p) (pop p)
  (if (equal p NIL)
      pfinal
    (progn
      (pop p)
     (reorganiser_p p)
     )
    )
  )
   

(defun conclusion (R)
  (setq pfinal NIL)
  (let ((c (car(cddddr(assoc R BR))) ))
    (reorganiser_c c)
    ))

(defun reorganiser_c (p)
  (push (caddr p) pfinal)
  (push (car p) pfinal)
  (push (cadr p) pfinal)
)


(defun regles_candidates (But)
  (setq regles ())
  (dolist (x BR)
    (if (equal (caddr x) (list But))
        (setq regles (cons (car x) regles))))
  regles)

(defun appartient_BF (But)
  (if (member But BF) T
    nil))

(defun demander (quote)
  (print quote)
  (read)
  )  

(defun executer (R)
  (let ((c (conclusion R)))
    (if (listp (caddr c))
        (setf (caddr c) (demander (cadr (caddr c)))
      ))
    (push r RE)
    (push c BF)
    )
  (print `(La r�gle ,R a �t� ex�cut�e))
  (print (conclusion r))
  BF
  )

(defun premisses-BF (r)
  (let ((retour 1))
    (dolist (x (premisses r))
      (if (or (eq (car x) '>) (eq (car x) '<))
          (dolist (y BF)
            (if (eq (cadr x) (cadr y))
                (if (eq (car x) '>)
                    (if (not (> (caddr y) (caddr x)))
                          (setq retour 0)
                      )
                  (if (not (< (caddr y) (caddr x)))
                      (progn
                        (setq retour 0)
                        )
                    )
                  )
              )
            )        
        (if (not (member x BF :test #'equal))
            (setq retour 0)
          ))
      )
    retour))
  
              

(defun rechercher (BF)
  (let ((ville 'NullePart))
        (let ((action 1))
          (loop while (eq action 1) do
                (setq action 0)
                (dolist (r BR)
                  (progn
                    (if (not (member (car r) RE))
                        (if (= (premisses-BF (car r)) 1)
                            (progn
                              (setq BF (executer (car r)))
                              
                              (setq action 1)
                              )
                          )
                      )
                    ))                
                )

          (dolist (f BF) 
            (cadr f)
            (if (eq (cadr f) 'ville)
                (setq ville (caddr f))
              )
            )
          )
    (terpri)
    (if (eq ville 'NullePart)
        (pprint "Vous n'�tes pas dans l'une des villes de la liste. Vous �tes perdu")
      (pprint `(Vous �tes � ,ville !)
             
             )
      )
    )
  )    


(defun ou-suis-je ()
  (setq BF NIL)
  (setq RE NIL)
  (print "Bonjour. Bien dormi ?
Vous vous demandez ce que vous faites-l� ?
Vos 'amis' vous proposent un petit jeu :
Ils vous ont emmen� quelque part dans le monde.
Pour vous aider, voici la liste des villes possible :

-Compi�gne
-Paris
-Shanghai
-Tokyo
-New York
-Los Angeles
-Tombouctou
-Johannesburg
-Canberra
-Kuala Lumpur
-Rio de Janeiro
-Mexico
-Moscou
-Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch
-Prague
-Marrakech
-Honolulu
-Pyongyang
-Bombay
-Londres

Afin de retrouver o� vous �tes, on vous demande de trouver et d'indiquer :
la temp�rature, la langue (si possible), l'ethnie de la population locale,
le type d'�criture utilis� dans cette ville, le c�t� de la route ou les voitures conduisent."
         )
  
  (print "Commen�ons avec la temp�rature :")
  (let ((temp))
    (loop while (not (numberp temp)) do
          (setq temp (read))
          (if (not (numberp temp))
              (print " Veuillez rentrer la temp�rature sous forme num�rique")
            )
          )
    (push (list '= 'temp�rature temp) BF)
    )
  
  (print "Quelle est l'ethnie de la population locale ?
  (asiatique, sudasiatique, caucasien, africain, arabe) " )
  (let ((temp 'm))
    (loop while (and (not (eq temp 'asiatique)) (and (not (eq temp 'sudasiatique)) 
   (and (not (eq temp 'caucasien)) (and (not (eq temp 'africain)) (not (eq temp 'arabe)))))) do
          (setq temp (read))
          (if (and (not (eq temp 'asiatique)) (and (not (eq temp 'sudasiatique)) 
        (and (not (eq temp 'caucasien)) (and (not (eq temp 'africain)) (not (eq temp 'arabe))))))
              (print " Veuillez rentrer l'une des �thnie suivante :
 (asiatique, sudasiatique, caucasien, africain, arabe)")
            )
          )
    (push (list '= 'ethnie temp) BF)
    )
  
   
  (print "Quel est le type d'�criture ?  (cyrillique, abjad, sinogramme, latine) :")
  (let ((temp 'm))
    (loop while (and (not (eq temp 'cyrillique)) (and (not (eq temp 'abjad)) (and (not (eq temp 'sinogramme)) (not (eq temp 'latine))))) do
          (setq temp (read))
          (if  (and (not (eq temp 'cyrillique)) (and (not (eq temp 'abjad)) (and (not (eq temp 'sinogramme)) (not (eq temp 'latine)))))
              (print " Veuillez rentrer l'une des �critures suivante : (cyrillique, abjad, sinogramme, latine)")
            )
          )
    (push (list '= '�criture temp) BF)
    )
  
  (print "De quel c�t� de la route les voitures roulent-elles ? (droite/gauche)")
  (let ((temp 'm))
    (loop while (and (not (eq temp 'gauche)) (not (eq temp 'droite))) do
          (setq temp (read))
          (if  (and (not (eq temp 'gauche)) (not (eq temp 'droite)))
              (print " Choississez entre droite et gauche")
            )
          )
    (push (list '= 'conduite temp) BF)
    )

   
  (print "Reconnaissez-vous la langue ? (oui/non) :")
  (let ((temp 'm))
    (loop while (and (not (eq temp 'oui)) (not (eq temp 'non))) do
          (setq temp (read))
          (if  (and (not (eq temp 'oui)) (not (eq temp 'non)))
              (print " Choississez entre oui et non")
            )
          )
    (if (eq temp 'oui)
        (progn
          (print "Entrez la langue reconnue")
          (push (list '= 'langue (read)) BF)
          ))
    )
  
  (rechercher BF)
  
  )


(defun suis-je-� (ville)
  (setq RE '())
  (if (member ville *villes*)
      (progn
        (setq BF (list (list '= 'ville ville)))
        (verifier BF)
        (print "-----------")
        (print "Voici les param�tres que vous pouvez v�rifier pour savoir si 
vous �tes bien dans la ville demand�e :")
        (dolist (x BF 'fin)
          (if (eq (cadr x) NIL) ;; Cas des questions
              (print (car x))
            (let ((param NIL))
              (push (caddr x) param)
              (push (car x) param)
              (push (cadr x) param)
              (print param))
            )))
    (pprint "Cette ville ne fait pas partie de notre liste de villes connues. D�sol�")
    ))
  

(defun verifier (BF)
    (dolist (r BR)
        (if (not (member (car r) RE))
            (progn 
              (if (= (conclusion-BF (car r)) 1)
                  (progn
                    (setq BF (executer_reverse (car r)))
                    (verifier BF)
                    )
                )
              (let ((c (conclusion (car r))))
                (if (listp (caddr c))
                    (if (= (question-BF (cadr c)) 1) ;; Test si r�ponse_xx dans BF
                        (progn
                          (setq BF (executer_reverse (car r)))
                          (verifier BF)
                          )
                      )))
              
              ))
      )
  )

(defun question-BF (reponse)
  (let ((resultat 0))
    (dolist (x BF)
      (if (eq reponse (cadr x))
          (setq resultat 1))
      )
    resultat)
  )


(defun executer_reverse (r)
  (let ((*p* (premisses R)))
    (push r RE)
    (dolist (p *p*)
      (let ((c (conclusion r)))
        (if (and (listp (caddr c)) (not (member (cdr (caddr c)) BF :test #'equal)))  ;; Si question, l'ajouter aussi pour l'utilisateur
              (push (cdr (caddr c)) BF)              
                  ))
        
      (if (eq 'latin (caddr p)) ;; Tout sauf les pays latin => langue
          (push `( = type_pays pays_latin) BF) ;; On affiche quand m�me que c'est un pays latin mais "pays_latin" au lieu de "latin" pour ne pas �tre reconnu par le moteur
           (push p BF)
      )))
    (print `(La r�gle ,R a �t� ex�cut�e))
    (print (premisses r))
    BF
    )



(defun conclusion-BF (r)
  (let ((retour 1))
    (let ((x (conclusion r) ))
        (if (not (member x BF :test #'equal))
            (setq retour 0)
          ))
    retour))
