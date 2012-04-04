#!/pro/bin/perl

use strict;
use warnings;
use autodie;

use Test::More;
use Data::Peek;
use List::Util qw( first );
use GSM::Gnokii;

my $gsm  = GSM::Gnokii->new ({ verbose => 1 })->connect ();

ok (my $get = {
    Ping	=> $gsm->Ping (),
    IMEI	=> $gsm->GetIMEI (),
    DateTime	=> $gsm->GetDateTime (),
    Security	=> $gsm->GetSecurity (),
    Display	=> $gsm->GetDisplayStatus (),
#   Profile_1	=> $gsm->GetProfiles (1, 1),
    Memory	=> $gsm->GetMemoryStatus (),
    Power	=> $gsm->GetPowerStatus (),
    PhoneBookME	=> $gsm->GetPhonebook ("ME", 1, 3),
    PhoneBookSM	=> $gsm->GetPhonebook ("SM", 1, 0),
    SpeedDial_2	=> $gsm->GetSpeedDial (2),
    RF		=> $gsm->GetRF (),
    NetworkInfo	=> $gsm->GetNetworkInfo (),
    SMSCenter	=> $gsm->GetSMSCenter (1, 0),
    Alarm	=> $gsm->GetAlarm (),
    RingtoneList=> $gsm->GetRingtoneList (),
    Ringtone	=> $gsm->GetRingtone (1),
    SMSStatus	=> $gsm->GetSMSStatus (),
    SMSFolders	=> $gsm->GetSMSFolderList (),
    SMS_1	=> $gsm->GetSMS ("IN", 1),
    CalNotes	=> $gsm->GetCalendarNotes (1, 3),
    Todo	=> $gsm->GetTodo (1, 3),
#   WAPSettings	=> $gsm->GetWapSettings (2),

    Versions	=> {
	version	=> $gsm->version (),
	VERSION	=> $GSM::Gnokii::VERSION,
	module	=> $gsm->{gsm_gnokii_version},
	gnokii	=> $gsm->{libgnokii_version},
	},
    }, "Execute Get methods");

DDumper $get;

done_testing;