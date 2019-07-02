Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EB15C926
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Jul 2019 08:14:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1965B31628FF;
	Tue,  2 Jul 2019 06:14:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89B0F4C48E;
	Tue,  2 Jul 2019 06:14:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2FFA51806B0F;
	Tue,  2 Jul 2019 06:14:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x626E4VB006511 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jul 2019 02:14:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9646F53E19; Tue,  2 Jul 2019 06:14:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9041F6C35B
	for <cluster-devel@redhat.com>; Tue,  2 Jul 2019 06:14:02 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
	(mail-eopbgr1310045.outbound.protection.outlook.com [40.107.131.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDBD7C057F2F
	for <cluster-devel@redhat.com>; Tue,  2 Jul 2019 06:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=teoenmingcorp.onmicrosoft.com;
	s=selector1-teoenmingcorp-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=DqkeRtLMB3daCmQ/euibl3to88xXq9sKg+1nF5vJ2+I=;
	b=bjob5ymGQSMNpS8rOhh5XCY0FfLwAdrdogOPQ7spIe9Vzch3zQXBGpGAhALdv/grXd4IN/n/WvxRBvElr5HfHBAn2ypZ4L8sJ8ObPEdFS+v5ziolL9O+TaMWWm1qkiJhEMxWKThyoNt0/lCoPRbMg/wD9brNGIT4U65JNjRYSoc=
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com (10.170.143.19) by
	SG2PR01MB3352.apcprd01.prod.exchangelabs.com (20.178.152.142) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2032.18; Tue, 2 Jul 2019 06:13:56 +0000
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com
	([fe80::d503:3d71:ce06:19d2]) by
	SG2PR01MB2141.apcprd01.prod.exchangelabs.com
	([fe80::d503:3d71:ce06:19d2%6]) with mapi id 15.20.2032.019;
	Tue, 2 Jul 2019 06:13:56 +0000
From: Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
To: "cluster-devel@redhat.com" <cluster-devel@redhat.com>
Thread-Topic: =?Windows-1252?Q?Introduction_and_Advantages/Disadvantages_of_Clustering_?=
	=?Windows-1252?Q?in_Linux_=96_Part_1?=
Thread-Index: AdUwnRglEMEFgHs4S8GmhmlG4YaImw==
Date: Tue, 2 Jul 2019 06:13:55 +0000
Message-ID: <SG2PR01MB21414297B1293F455DFC8A5687F80@SG2PR01MB2141.apcprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=ceo@teo-en-ming-corp.com; 
x-originating-ip: [118.189.211.120]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7b7b66c-3164-4e56-221c-08d6feb476d2
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:SG2PR01MB3352; 
x-ms-traffictypediagnostic: SG2PR01MB3352:
x-ms-exchange-purlcount: 5
x-microsoft-antispam-prvs: <SG2PR01MB3352B4268DF5869E0E828A1987F80@SG2PR01MB3352.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(376002)(366004)(39830400003)(396003)(136003)(199004)(189003)(790700001)(14454004)(33656002)(99286004)(6116002)(21615005)(74316002)(3846002)(81156014)(81166006)(68736007)(66066001)(102836004)(6506007)(53936002)(86362001)(6436002)(316002)(55016002)(9686003)(2351001)(26005)(5640700003)(236005)(966005)(6306002)(476003)(54896002)(7696005)(66476007)(7736002)(5660300002)(6916009)(256004)(508600001)(4744005)(66946007)(25786009)(2501003)(8936002)(71190400001)(71200400001)(64756008)(66556008)(4326008)(66446008)(606006)(73956011)(52536014)(186003)(107886003)(2906002)(486006)(76116006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SG2PR01MB3352;
	H:SG2PR01MB2141.apcprd01.prod.exchangelabs.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: teo-en-ming-corp.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yBnqGZNEcMj1TZmag4BqM7ckEUI30RyuT+xbfZ/KUTiA5UF/mKw7MRNLuD49De0k0+3J3LsmD0QfAapnDIE79JX/81qn1HQbwBuo/G6FstWwhCFr8oO5ji1es4eBRBVobqg9e2Z88aFf/5AqVtUwaU7QF+plzAHITTZDtafgMFKpLwHFa/S9ioOTzS6zk/LV50W9H5DBe9y/ImJog+XU1xGEXAqqbFpHxtxufFjEoa44vny84rgNFj2NMi/zktkFpxWTaxD/ROsxxGSJbONDVdwLbm/rn9KW9hytVB604CNZfkYi8dB91/fw25uAOhWv93BWkUr7itI2wlv6E2myWyShWS2YFp1U/G/POSaI55YzWlv73xPq+28lKYwaz6eHxgVB8AvRMm/j0e4DXW4Yyqwwmfs6QWVnP4d1s6a67sw=
Content-Type: multipart/alternative;
	boundary="_000_SG2PR01MB21414297B1293F455DFC8A5687F80SG2PR01MB2141apcp_"
MIME-Version: 1.0
X-OriginatorOrg: teo-en-ming-corp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b7b66c-3164-4e56-221c-08d6feb476d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 06:13:55.9165 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b3f6ae-c453-4b93-aec9-f17508e5885c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ceo@teo-en-ming-corp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR01MB3352
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.32]); Tue, 02 Jul 2019 06:14:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Tue, 02 Jul 2019 06:14:00 +0000 (UTC) for IP:'40.107.131.45'
	DOMAIN:'mail-eopbgr1310045.outbound.protection.outlook.com'
	HELO:'APC01-SG2-obe.outbound.protection.outlook.com'
	FROM:'ceo@teo-en-ming-corp.com' RCPT:''
X-RedHat-Spam-Score: -0.011  (DKIM_SIGNED, DKIM_VALID, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, SPF_HELO_PASS, SPF_PASS) 40.107.131.45
	mail-eopbgr1310045.outbound.protection.outlook.com
	40.107.131.45
	mail-eopbgr1310045.outbound.protection.outlook.com
	<ceo@teo-en-ming-corp.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] =?windows-1252?q?Introduction_and_Advantages/Disa?=
 =?windows-1252?q?dvantages_of_Clustering_in_Linux_=96_Part_1?=
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Tue, 02 Jul 2019 06:14:15 +0000 (UTC)

--_000_SG2PR01MB21414297B1293F455DFC8A5687F80SG2PR01MB2141apcp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Good afternoon from Singapore,

Is the following article a good reference guide?

Article: Introduction and Advantages/Disadvantages of Clustering in Linux =
=96 Part 1
Link: https://www.tecmint.com/what-is-clustering-and-advantages-disadvantag=
es-of-clustering-in-linux/

Thank you for your advice.



-----BEGIN EMAIL SIGNATURE-----

The Gospel for all Targeted Individuals (TIs):

[The New York Times] Microwave Weapons Are Prime Suspect in Ills of
U.S. Embassy Workers

Link: https://www.nytimes.com/2018/09/01/science/sonic-attack-cuba-microwav=
e.html

***************************************************************************=
*****************

Singaporean Mr. Turritopsis Dohrnii Teo En Ming's Academic
Qualifications as at 14 Feb 2019

[1] https://tdtemcerts.wordpress.com/

[2] https://tdtemcerts.blogspot.sg/

[3] https://www.scribd.com/user/270125049/Teo-En-Ming

-----END EMAIL SIGNATURE-----


--_000_SG2PR01MB21414297B1293F455DFC8A5687F80SG2PR01MB2141apcp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-SG" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Good afternoon from Singapore,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is the following article a good reference guide?<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Article: Introduction and Advantages/Disadvantages o=
f Clustering in Linux =96 Part 1<o:p></o:p></p>
<p class=3D"MsoNormal">Link: <a href=3D"https://www.tecmint.com/what-is-clu=
stering-and-advantages-disadvantages-of-clustering-in-linux/">
https://www.tecmint.com/what-is-clustering-and-advantages-disadvantages-of-=
clustering-in-linux/</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you for your advice.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">-----BEGIN EMAIL SIGNATURE-----<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">The Gospel for all Targeted Individuals (TIs):=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">[The New York Times] Microwave Weapons Are Pri=
me Suspect in Ills of<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">U.S. Embassy Workers<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">Link:
<a href=3D"https://www.nytimes.com/2018/09/01/science/sonic-attack-cuba-mic=
rowave.html">
<span style=3D"color:blue">https://www.nytimes.com/2018/09/01/science/sonic=
-attack-cuba-microwave.html</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">**********************************************=
**********************************************<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">Singaporean Mr. Turritopsis Dohrnii Teo En Min=
g's Academic<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">Qualifications as at 14 Feb 2019<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">[1]
<a href=3D"https://tdtemcerts.wordpress.com/"><span style=3D"color:blue">ht=
tps://tdtemcerts.wordpress.com/</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">[2]
<a href=3D"https://tdtemcerts.blogspot.sg/"><span style=3D"color:blue">http=
s://tdtemcerts.blogspot.sg/</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">[3]
<a href=3D"https://www.scribd.com/user/270125049/Teo-En-Ming"><span style=
=3D"color:blue">https://www.scribd.com/user/270125049/Teo-En-Ming</span></a=
><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">-----END EMAIL SIGNATURE-----</span><o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SG2PR01MB21414297B1293F455DFC8A5687F80SG2PR01MB2141apcp_--

