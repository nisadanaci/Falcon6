//instance of schedulable class..
AccountSchedulable aSche = new AccountSchedulable();
//cron job string
string cron = '0 0 13 * * ?'; //everday at 1 PM

system.schedule('Schedule account job via cron', cron, aSche);