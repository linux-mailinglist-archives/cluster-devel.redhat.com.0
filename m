Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAC8D39FD
	for <lists+cluster-devel@lfdr.de>; Fri, 11 Oct 2019 09:25:21 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E22C8C049E17;
	Fri, 11 Oct 2019 07:25:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7CD65C1B2;
	Fri, 11 Oct 2019 07:25:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A08CD18089C8;
	Fri, 11 Oct 2019 07:25:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9B7OpWl017479 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 11 Oct 2019 03:24:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6EFFC60600; Fri, 11 Oct 2019 07:24:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx24.extmail.prod.ext.phx2.redhat.com
	[10.5.110.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6876360A9F
	for <cluster-devel@redhat.com>; Fri, 11 Oct 2019 07:24:49 +0000 (UTC)
Received: from m9a0001g.houston.softwaregrp.com
	(m9a0001g.houston.softwaregrp.com [15.124.64.66])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0370E10CC206
	for <cluster-devel@redhat.com>; Fri, 11 Oct 2019 07:24:43 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0001g.houston.softwaregrp.com WITH ESMTP; 
	Fri, 11 Oct 2019 07:24:00 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Fri, 11 Oct 2019 07:21:37 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.13) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Fri, 11 Oct 2019 07:21:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=P+y57/Vfkm/PNPT4yoi1qxCvv8BqJsSxDRktxyiR6+782izjpd0FgscqAu+uicTZV27+bKSi5O9I1SNcjHiRGAtY4xWeE+MZyfguJhobNOQpYLJkwiuv2BUOioCjkanQdXwsvKhN5RxMujXZCA9oo4SdAmsd8XpoqXDesQr9l+s4DABedN+G8JMIaVWPgv7YsKuMYjTsWkp24L6ZR6TXpuU5/WAyKHBDew4ZB45h64DM8YmSoHczPTgB4zrhF4iysRNenItQbudPu4JHmo4jmhswCj6WQBp/0JjHM7CBrHcGediJBfnQXU4rMyCEqsBNIONifbu/9Iw6gjRPafCvMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=r3G3IhK8CON3BB+w6ku8ofzARjdYG+uTwDoq/zsIDoI=;
	b=OEPAQ3RFnj53OgLcm24DSabsaF/Pcx5rrwNjUnYptpP1FqWWf7Meck6HUFQhKFNhTam3dSa8+2A2NXzIlfoPKRluzrANgzaWzctWGAg25RT7xAApZkbnYcZsGDer4TrMEfHAD95F4L2PL6dN8QUeXeQYSGbFlU3osdysZpuaL4nV5qoK+YmoY9tx9vNhXjfIcSJiVRiHIRpKStSQwnTaE/XA1m0PmVkHPDvvH5NuN0jj9mOPN41zYcDQY8U4hJLOwCQAB+UbKkwTkcLU8nsR9ZGMwn2qMEhGG8PZkhQcFeMQ3PMZKRbL5KZzcsEkSK4WDT20IbyiA/45NqBmMq/UQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3206.namprd18.prod.outlook.com (52.132.247.79) by
	CH2PR18MB3333.namprd18.prod.outlook.com (52.132.246.75) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.16; Fri, 11 Oct 2019 07:21:36 +0000
Received: from CH2PR18MB3206.namprd18.prod.outlook.com
	([fe80::adf9:7570:c3ae:f686]) by
	CH2PR18MB3206.namprd18.prod.outlook.com
	([fe80::adf9:7570:c3ae:f686%4]) with mapi id 15.20.2347.021;
	Fri, 11 Oct 2019 07:21:35 +0000
From: Gang He <GHe@suse.com>
To: " Hayes, Bill " <bill.hayes@hpe.com>, "ocfs2-devel@oss.oracle.com"
	<ocfs2-devel@oss.oracle.com>, "cluster-devel@redhat.com"
	<cluster-devel@redhat.com>
Thread-Topic: Interest in DAX for OCFS2 and/or GFS2?
Thread-Index: AdV/iXuPPH7GaTX6SBGWd+TFpG3sIAAed2cA
Date: Fri, 11 Oct 2019 07:21:35 +0000
Message-ID: <CH2PR18MB3206F78AC614EAC963AF8203CF970@CH2PR18MB3206.namprd18.prod.outlook.com>
References: <AT5PR8401MB1025DFAE60F5A5A4BCC5D2038B940@AT5PR8401MB1025.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <AT5PR8401MB1025DFAE60F5A5A4BCC5D2038B940@AT5PR8401MB1025.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) smtp.mailfrom=GHe@suse.com; 
x-originating-ip: [45.122.156.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70ce7456-b148-453d-6dea-08d74e1ba671
x-ms-traffictypediagnostic: CH2PR18MB3333:
x-microsoft-antispam-prvs: <CH2PR18MB333351A5A00892701B57821BCF970@CH2PR18MB3333.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(199004)(189003)(13464003)(186003)(2501003)(76176011)(6436002)(3846002)(6116002)(4326008)(7696005)(25786009)(5660300002)(296002)(316002)(6246003)(71190400001)(446003)(11346002)(8936002)(71200400001)(6506007)(99286004)(52536014)(53546011)(80792005)(14454004)(66066001)(86362001)(74316002)(476003)(66556008)(66446008)(229853002)(14444005)(76116006)(2201001)(66476007)(7736002)(256004)(33656002)(110136005)(64756008)(486006)(8676002)(102836004)(305945005)(2906002)(81166006)(81156014)(55016002)(9686003)(26005)(478600001)(66946007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3333;
	H:CH2PR18MB3206.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fAfKjnN1ZahCmeXyazJMQ241SsKgam/gAyxuUwq7rVhSqAf9xIqZKNSf4DSn0yLKWs3zqtYBCrZmOtZ9cneGNDqiRFMYvV0y13iA9ACVr6M3VeoWPE9eJlDZ91V1E5yv0Znpgz+9eS//UOzNsWEzset7amlmL/3kvX7JtHfSUmV7XPdNG/FkETFVKT8r8wtBFmb8qxr3bI1E7hZ1DTWZPkwDC0y3SVqZWthItkr7iNsGIOkpOCyjx9NEktI2DeOKiT3wBHinSc023+kXbouT9z4zrlcI5eAq7ahyRhwWbQcerxYoqd0w2ljKVQlTvvwvw6b1FGwOEh4rn3eBUtFPNT9aqFZ2EBAhIjYf/hMBdtCy//axpl1WCcSdGluXYGk+bfrpR7sEwOVd46SUGINUwjW+5NrUu5PzZ9GRJjEi4PQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ce7456-b148-453d-6dea-08d74e1ba671
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 07:21:35.9169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wHur/4p5MmBup35x0xQhmHK2dLmc9cf1B60SI0uH0PhMrGrAD4JtwIZC1kPUc4hX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3333
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.65]); Fri, 11 Oct 2019 07:24:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]);
	Fri, 11 Oct 2019 07:24:47 +0000 (UTC) for IP:'15.124.64.66'
	DOMAIN:'m9a0001g.houston.softwaregrp.com'
	HELO:'m9a0001g.houston.softwaregrp.com' FROM:'GHe@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.66
	m9a0001g.houston.softwaregrp.com 15.124.64.66
	m9a0001g.houston.softwaregrp.com <GHe@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.65
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Content-Transfer-Encoding: 8bit
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9B7OpWl017479
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] Interest in DAX for OCFS2 and/or GFS2?
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Fri, 11 Oct 2019 07:25:20 +0000 (UTC)

Hello hayes,

> -----Original Message-----
> From: cluster-devel-bounces@redhat.com
> [mailto:cluster-devel-bounces@redhat.com] On Behalf Of Hayes, Bill
> Sent: 2019Äê10ÔÂ11ÈÕ 0:42
> To: ocfs2-devel@oss.oracle.com; cluster-devel@redhat.com
> Cc: Rocky (The good-looking one) Craig <rocky.craig@hpe.com>
> Subject: [Cluster-devel] Interest in DAX for OCFS2 and/or GFS2?
> 
> We have been experimenting with distributed file systems across multiple
> Linux instances connected to a shared block device.  In our setup, the "disk" is
> not a legacy SAN or iSCSI.  Instead it is a shared memory-semantic fabric
> that is being presented as a Linux block device.
> 
> We have been working with both GFS2 and OCFS2 to evaluate the suitability
> to work on our shared memory configuration.  Right now we have gotten
> both GFS2 and OCFS2 to work with block driver but each file system still does
> block copies.  Our goal is to extend mmap() of the file system(s) to allow true
> zero-copy load/store access directly to the memory fabric.  We believe
> adding DAX support into the OCFS2 and/or GFS2 is an expedient path to use a
> block device that fronts our memory fabric with DAX.
> 
> Based on the HW that OCFS2 and GFS2 were built for (iSCSI, FC, DRDB, etc)
> there probably has been no reason to implement DAX to date.  The advent of
> various memory semantic fabrics (Gen-Z, NUMAlink, etc) is driving our
> interest in extending OCFS2 and/or GFS2 to take advantage of DAX.  We
> have two platforms set up, one based on actual hardware and another based
> on VMs and are eager to begin deeper work.
> 
> Has there been any discussion or interest in DAX support in OCFS2?
No, but I think this is very interesting topic/feature.
I hope we can take some efforts in investigating how to make OCFS2 support DAX, since some local file systems have supported this feature for long time.

> Is there interest from the OCFS2 development community to see DAX support
> developed and put upstream?
>From my personal view, it is very attractive.
But we also aware cluster file systems are usually based on DLM, DLM usually communicates with each other via the network.
That means network latency should be considered.

Thanks
Gang

> 
> Has there been any discussion or interest in DAX support in GFS2?
> Is there interest from the GFS2 development community to see DAX support
> developed and put upstream?
> 
> Regards,
> Bill
> 


