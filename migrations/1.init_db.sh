
# donner les droits d'exécution du fichier :
# chmod +x init_db.sh 



# Je prends l'identité de sadmin_rubi :
export PGUSER=sadmin_rubi

# Je supprime la BDD rubi
dropdb rubi
echo "BDD supprimée"

# Je crèe la BDD rubi
createdb rubi -0 sadmin_rubi
echo "BDD créée"

# Je supprime sqitch.conf et sqitch.plan
rm sqitch.conf
rm sqitch.plan

# J'initiase Sqitch
sqitch init kshf --target db:pg:kshf
echo "Sqitch initialisé"
