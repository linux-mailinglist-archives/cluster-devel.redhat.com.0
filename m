Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD7B46D908
	for <lists+cluster-devel@lfdr.de>; Wed,  8 Dec 2021 17:57:03 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-zUuev1ZOOBqMiJawVjcFMA-1; Wed, 08 Dec 2021 11:56:59 -0500
X-MC-Unique: zUuev1ZOOBqMiJawVjcFMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5593100D681;
	Wed,  8 Dec 2021 16:56:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC68A19C59;
	Wed,  8 Dec 2021 16:56:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DFDC41809CB8;
	Wed,  8 Dec 2021 16:56:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B8GujvG008058 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 8 Dec 2021 11:56:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 76C8751E2; Wed,  8 Dec 2021 16:56:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 714F651DD
	for <cluster-devel@redhat.com>; Wed,  8 Dec 2021 16:56:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 738A4101A529
	for <cluster-devel@redhat.com>; Wed,  8 Dec 2021 16:56:42 +0000 (UTC)
Received: from mtaextp1.scidom.de (mtaextp1.scidom.de [146.107.3.202]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-601-OvYQMus8NUeNyFZuADrJVA-1; Wed, 08 Dec 2021 11:56:39 -0500
X-MC-Unique: OvYQMus8NUeNyFZuADrJVA-1
Received: from localhost (localhost [127.0.0.1])
	by mtaextp1.scidom.de (Postfix) with ESMTP id BAFB818054F06
	for <cluster-devel@redhat.com>; Wed,  8 Dec 2021 17:50:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at mtaextp1.scidom.de
Received: from mtaextp1.scidom.de ([127.0.0.1])
	by localhost (mtaextp1.scidom.de [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id lCNd9TkBrUaw for <cluster-devel@redhat.com>;
	Wed,  8 Dec 2021 17:50:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mtaextp1.scidom.de (Postfix) with ESMTP id 6252D18054F0B
	for <cluster-devel@redhat.com>; Wed,  8 Dec 2021 17:50:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 mtaextp1.scidom.de 6252D18054F0B
X-Amavis-Modified: Mail body modified (using disclaimer) - mtaextp1.scidom.de
X-Virus-Scanned: amavisd-new at mtaextp1.scidom.de
Received: from mtaextp1.scidom.de ([127.0.0.1])
	by localhost (mtaextp1.scidom.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id XcNDf35iKMZJ for <cluster-devel@redhat.com>;
	Wed,  8 Dec 2021 17:50:38 +0100 (CET)
Received: from mtaintp1.scidom.de (mtaintp1.scidom.de [146.107.8.197])
	by mtaextp1.scidom.de (Postfix) with ESMTPS id 38FED18054F06
	for <cluster-devel@redhat.com>; Wed,  8 Dec 2021 17:50:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mtaintp1.scidom.de (Postfix) with ESMTP id D2482824E9BC
	for <cluster-devel@redhat.com>; Wed,  8 Dec 2021 17:50:40 +0100 (CET)
Received: from mtaintp1.scidom.de ([127.0.0.1])
	by localhost (mtaintp1.scidom.de [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Dq7lXrB86ddZ for <cluster-devel@redhat.com>;
	Wed,  8 Dec 2021 17:50:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mtaintp1.scidom.de (Postfix) with ESMTP id AC546824E9C2
	for <cluster-devel@redhat.com>; Wed,  8 Dec 2021 17:50:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 mtaintp1.scidom.de AC546824E9C2
X-Amavis-Modified: Mail body modified (using disclaimer) - mtaintp1.scidom.de
X-Virus-Scanned: amavisd-new at mtaintp1.scidom.de
Received: from mtaintp1.scidom.de ([127.0.0.1])
	by localhost (mtaintp1.scidom.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id cfZtgA-xfh9K for <cluster-devel@redhat.com>;
	Wed,  8 Dec 2021 17:50:40 +0100 (CET)
Received: from mbxp1.scidom.de (mbxp1.scidom.de [146.107.8.207])
	by mtaintp1.scidom.de (Postfix) with ESMTP id 8253A824E9BC
	for <cluster-devel@redhat.com>; Wed,  8 Dec 2021 17:50:40 +0100 (CET)
Date: Wed, 8 Dec 2021 17:50:41 +0100 (CET)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
To: cluster-devel@redhat.com
Message-ID: <398059639.62550733.1638982241202.JavaMail.zimbra@helmholtz-muenchen.de>
MIME-Version: 1.0
X-Originating-IP: [146.107.196.11]
Thread-Index: laePcOUXJb0dd0nYladW3ADISY7fog==
Thread-Topic: message in syslog: shrink_slab: gfs2_glock_shrink_scan+0x0/0x240
	[gfs2] negative objects to delete nr=xxxxxxxxxxxx
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] message in syslog: shrink_slab:
 gfs2_glock_shrink_scan+0x0/0x240 [gfs2] negative objects to delete
 nr=xxxxxxxxxxxx
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; 
	boundary="----=_Part_62550735_1038917074.1638982241561"

------=_Part_62550735_1038917074.1638982241561
Date: Wed, 8 Dec 2021 17:50:41 +0100 (CET)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
To: cluster-devel@redhat.com
Message-ID: <398059639.62550733.1638982241202.JavaMail.zimbra@helmholtz-muenchen.de>
Subject: message in syslog: shrink_slab: gfs2_glock_shrink_scan+0x0/0x240
	[gfs2] negative objects to delete nr=xxxxxxxxxxxx
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [146.107.196.11]
X-Mailer: Zimbra 8.8.15_GA_4173 (ZimbraWebClient - GC96 (Win)/8.8.15_GA_4173)
Thread-Index: laePcOUXJb0dd0nYladW3ADISY7fog==
Thread-Topic: message in syslog: shrink_slab: gfs2_glock_shrink_scan+0x0/0x240
	[gfs2] negative objects to delete nr=xxxxxxxxxxxx

Hi,

i hope this is the right place for asking about GFS2.
Yesterday one of my two nodes HA-cluster got slower and slower, until it wa=
s fenced.
In /var/log/messages i found this message repeated often before the system =
got slower:
shrink_slab: gfs2_glock_shrink_scan+0x0/0x240 [gfs2] negative objects to de=
lete nr=3Dxxxxxxxxxxxx
What does it mean ? Is it a problem ?

My Setup:
SuSE SLES 12 SP5
Kernel 4.12.14-122.46-default
Pacemaker 1.1.23
corosync 2.3.6-9.13.1
gfs2-utils-3.1.6-1.101.x86_64

Thanks.

Bernd

--=20

Bernd Lentes=20
System Administrator=20
Institute for Metabolism and Cell Death (MCD)=20
Building 25 - office 122=20
HelmholtzZentrum M=C3=BCnchen=20
bernd.lentes@helmholtz-muenchen.de=20
phone: +49 89 3187 1241=20
phone: +49 89 3187 3827=20
fax: +49 89 3187 2294=20
http://www.helmholtz-muenchen.de/mcd=20


Public key:=20

30 82 01 0a 02 82 01 01 00 b3 72 3e ce 2c 0a 6f 58 49 2c 92 23 c7 b9 c1 ff =
6c 3a 53 be f7 9e e9 24 b7 49 fa 3c e8 de 28 85 2c d3 ed f7 70 03 3f 4d 82 =
fc cc 96 4f 18 27 1f df 25 b3 13 00 db 4b 1d ec 7f 1b cf f9 cd e8 5b 1f 11 =
b3 a7 48 f8 c8 37 ed 41 ff 18 9f d7 83 51 a9 bd 86 c2 32 b3 d6 2d 77 ff 32 =
83 92 67 9e ae ae 9c 99 ce 42 27 6f bf d8 c2 a1 54 fd 2b 6b 12 65 0e 8a 79 =
56 be 53 89 70 51 02 6a eb 76 b8 92 25 2d 88 aa 57 08 42 ef 57 fb fe 00 71 =
8e 90 ef b2 e3 22 f3 34 4f 7b f1 c4 b1 7c 2f 1d 6f bd c8 a6 a1 1f 25 f3 e4 =
4b 6a 23 d3 d2 fa 27 ae 97 80 a3 f0 5a c4 50 4a 45 e3 45 4d 82 9f 8b 87 90 =
d0 f9 92 2d a7 d2 67 53 e6 ae 1e 72 3e e9 e0 c9 d3 1c 23 e0 75 78 4a 45 60 =
94 f8 e3 03 0b 09 85 08 d0 6c f3 ff ce fa 50 25 d9 da 81 7b 2a dc 9e 28 8b =
83 04 b4 0a 9f 37 b8 ac 58 f1 38 43 0e 72 af 02 03 01 00 01

------=_Part_62550735_1038917074.1638982241561
Content-Type: application/pkcs7-signature; name=smime.p7s;
	smime-type=signed-data
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCAMIIF
yDCCBLCgAwIBAgIMIgdroMAv99uEUtszMA0GCSqGSIb3DQEBCwUAMIGNMQswCQYDVQQGEwJERTFF
MEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hlbiBGb3JzY2h1bmdz
bmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUwIwYDVQQDDBxERk4tVmVyZWluIEdsb2Jh
bCBJc3N1aW5nIENBMB4XDTE5MTIwNDE3MzQwOVoXDTIyMTIwMzE3MzQwOVowVzELMAkGA1UEBhMC
REUxIzAhBgNVBAoMGkhlbG1ob2x0eiBaZW50cnVtIE11ZW5jaGVuMQwwCgYDVQQLDANJREcxFTAT
BgNVBAMMDEJlcm5kIExlbnRlczCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALNyPs4s
Cm9YSSySI8e5wf9sOlO+957pJLdJ+jzo3iiFLNPt93ADP02C/MyWTxgnH98lsxMA20sd7H8bz/nN
6FsfEbOnSPjIN+1B/xif14NRqb2GwjKz1i13/zKDkmeerq6cmc5CJ2+/2MKhVP0raxJlDop5Vr5T
iXBRAmrrdriSJS2IqlcIQu9X+/4AcY6Q77LjIvM0T3vxxLF8Lx1vvcimoR8l8+RLaiPT0vonrpeA
o/BaxFBKReNFTYKfi4eQ0PmSLafSZ1Pmrh5yPungydMcI+B1eEpFYJT44wMLCYUI0Gzz/876UCXZ
2oF7KtyeKIuDBLQKnze4rFjxOEMOcq8CAwEAAaOCAlswggJXMD4GA1UdIAQ3MDUwDwYNKwYBBAGB
rSGCLAEBBDAQBg4rBgEEAYGtIYIsAQEEBDAQBg4rBgEEAYGtIYIsAgEEBDAJBgNVHRMEAjAAMA4G
A1UdDwEB/wQEAwIF4DAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwHQYDVR0OBBYEFIbj
udERXYhU7DMaI17GPlWqLTQVMB8GA1UdIwQYMBaAFGs6mIv58lOJ2uCtsjIeCR/oqjt0MC0GA1Ud
EQQmMCSBImJlcm5kLmxlbnRlc0BoZWxtaG9sdHotbXVlbmNoZW4uZGUwgY0GA1UdHwSBhTCBgjA/
oD2gO4Y5aHR0cDovL2NkcDEucGNhLmRmbi5kZS9kZm4tY2EtZ2xvYmFsLWcyL3B1Yi9jcmwvY2Fj
cmwuY3JsMD+gPaA7hjlodHRwOi8vY2RwMi5wY2EuZGZuLmRlL2Rmbi1jYS1nbG9iYWwtZzIvcHVi
L2NybC9jYWNybC5jcmwwgdsGCCsGAQUFBwEBBIHOMIHLMDMGCCsGAQUFBzABhidodHRwOi8vb2Nz
cC5wY2EuZGZuLmRlL09DU1AtU2VydmVyL09DU1AwSQYIKwYBBQUHMAKGPWh0dHA6Ly9jZHAxLnBj
YS5kZm4uZGUvZGZuLWNhLWdsb2JhbC1nMi9wdWIvY2FjZXJ0L2NhY2VydC5jcnQwSQYIKwYBBQUH
MAKGPWh0dHA6Ly9jZHAyLnBjYS5kZm4uZGUvZGZuLWNhLWdsb2JhbC1nMi9wdWIvY2FjZXJ0L2Nh
Y2VydC5jcnQwDQYJKoZIhvcNAQELBQADggEBAG9FaTFBh6Yp8cNfWoaMF6GhZRFiARkPSNlvI8BJ
y+tS5W9urRKluF0mtgseNk1Eff3AD1bqicMIzThTuScwq1WhY5ZCGlD/qYLf+FY3VnPTjk6ZVruE
KuoA4bKJaVrXGkfBmw+oSMh6rfw6pwnchLXP7l40hDQ5tQ2/8BcpZYcykC4ziIga3hqe7vN4vhF6
gYKN6lET83QXYoh0IGCfFw3fIdTJk1IStMqe0Cd7eXpfwKQfjtzK8M5Qccj46923WGIwo0zSRiJR
R1J97qDZZxBsGJfj3tC5X/FkWhn3fDiPZYeTlvmFrzSyLSw/FBR/D2o/bUz+eaeVmenc32vxYmEA
ADGCApswggKXAgEBMIGeMIGNMQswCQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2Vy
ZGVydW5nIGVpbmVzIERldXRzY2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdE
Rk4tUEtJMSUwIwYDVQQDDBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBAgwiB2ugwC/324RS
2zMwDQYJYIZIAWUDBAIBBQCggc4wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMjExMjA4MTY1MDQxWjAtBgkqhkiG9w0BCTQxIDAeMA0GCWCGSAFlAwQCAQUAoQ0GCSqG
SIb3DQEBCwUAMC8GCSqGSIb3DQEJBDEiBCDS8QYD2RxVFcRwdV8QoMinoK3jrjCvVD0ZnPmdHk00
cTA0BgkqhkiG9w0BCQ8xJzAlMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDAHBgUrDgMCBzAN
BgkqhkiG9w0BAQsFAASCAQB2TlH7ZWDrDISCZh03NZ4zyHOHsdzfPb+VOH2AsYKXnwTG+wPQD8V+
sN7XoDwYLfZRr5MAoYyt5XAb23rNsqBohrxi+Ig6v2CYLSf2XFFfMfqC8R0fcoO8bl6vCptmXFp/
Dn85ErzO3LRBiMeXMT4K2l2foJjOvd8aTBEAur1wL7Mkf0AynmI76vdPhw/9lIPmPbMk7dqgqW/2
8xi6dAEI5LekAScxUVZqe73kcmvAtxmGTn0nrlRd2KcdXaWxMuzXqtrmmxvEUrUbmQ4n/FBaCSGh
oedtCB8ybV8ReH+ajXkqJmMQe1oWRX7FPoIlLMjP7tYOt8gp6H1UDLhgfAiCAAAAAAAA
------=_Part_62550735_1038917074.1638982241561--

