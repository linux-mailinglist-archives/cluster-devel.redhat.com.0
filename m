Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 489E2D2F3D
	for <lists+cluster-devel@lfdr.de>; Thu, 10 Oct 2019 19:07:12 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 40A1518C8902;
	Thu, 10 Oct 2019 17:07:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F9D91001DF2;
	Thu, 10 Oct 2019 17:07:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9473B180085A;
	Thu, 10 Oct 2019 17:07:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9AGhCUt002573 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 10 Oct 2019 12:43:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6B73160BF4; Thu, 10 Oct 2019 16:43:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx21.extmail.prod.ext.phx2.redhat.com
	[10.5.110.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63D1160BE1
	for <cluster-devel@redhat.com>; Thu, 10 Oct 2019 16:43:09 +0000 (UTC)
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
	[148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CB80218C4A45
	for <cluster-devel@redhat.com>; Thu, 10 Oct 2019 16:43:07 +0000 (UTC)
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9AGh5Nm013408; Thu, 10 Oct 2019 16:43:05 GMT
Received: from g2t2354.austin.hpe.com (g2t2354.austin.hpe.com [15.233.44.27])
	by mx0a-002e3701.pphosted.com with ESMTP id 2vj3dndd9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 10 Oct 2019 16:43:05 +0000
Received: from G1W8106.americas.hpqcorp.net (g1w8106.austin.hp.com
	[16.193.72.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by g2t2354.austin.hpe.com (Postfix) with ESMTPS id 25D3BA8;
	Thu, 10 Oct 2019 16:42:23 +0000 (UTC)
Received: from G9W8666.americas.hpqcorp.net (16.220.49.25) by
	G1W8106.americas.hpqcorp.net (16.193.72.61) with Microsoft SMTP Server
	(TLS) id 15.0.1367.3; Thu, 10 Oct 2019 16:41:59 +0000
Received: from G4W10204.americas.hpqcorp.net (2002:10cf:5210::10cf:5210) by
	G9W8666.americas.hpqcorp.net (2002:10dc:3119::10dc:3119) with Microsoft
	SMTP Server (TLS) id 15.0.1367.3; Thu, 10 Oct 2019 16:41:58 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.241.52.13) by
	G4W10204.americas.hpqcorp.net (16.207.82.16) with Microsoft SMTP
	Server (TLS)
	id 15.0.1367.3 via Frontend Transport; Thu, 10 Oct 2019 16:41:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=lPBT0DQmuxxOa5E3mpTDloJkHsTbF2qRa9vs5/guSTGOMZfojugB8aa/pyhOmQSsZljLLa/vOmZ8CcbEx6WIfC7PjdGz1TNHxb90SoTUn4bt4SCRtTqyfzsKJywluUKa+G69y5vnPyLmicx7zVO4ethuUpadV+QlV6Bp4epRxMS3lILApnpuRqPgEyCh7EbsI8ROP8Cdju6BcdEzsCS/OnzB6tn2kB+kaJMHbrbQAz+cEs1aP1kJ4Nv0isjIcggBLIp1Q43SBUwXdiT2y0mHhTt21/FjA+vyh1ce6FCbCasQrvn6miBxejIk7HbVLHRXbylg2qxmCOAfB8Zg7Q0TcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/Jkzvnq0Ow0cAu5jNNGk2M9VI8WUUr2CfSDvTMVRawE=;
	b=BgMqGMfMTxWBmEGTckMMUF3iywg3p8k2YWQS4T9j4Lx6KkNpjdHYjyN5McDYH5Wp4sA2hoUB7t9coxB1VZTQ4T9ELJXUOwhPupPXZrxPDV9/WcmidrtX/SR9p/ShSR86WXsZau6MoQ7TzepdJG4r2/aFWPBJM2tUfP1LPvTzy3VeJlvt4xMqCOIKYhpmKWhCjYJ8U4Su8xFOe/w445MrJxYiRNTg2FdRiNgrD8dT8GrVkA6AZEjrnw0e2CrV7O74tV9A8SaxpeA3pOkKmpKlktebkQTi94wXTQjeRTQVMKGcDw1Xx0l14HTv49ZNmpa/zzZkDwE/ob6YTBlzb1jNPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com;
	dkim=pass header.d=hpe.com; arc=none
Received: from AT5PR8401MB1025.NAMPRD84.PROD.OUTLOOK.COM (10.169.8.143) by
	AT5PR8401MB0403.NAMPRD84.PROD.OUTLOOK.COM (10.169.3.12) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Thu, 10 Oct 2019 16:41:57 +0000
Received: from AT5PR8401MB1025.NAMPRD84.PROD.OUTLOOK.COM
	([fe80::f10a:79d7:ac19:3e30]) by
	AT5PR8401MB1025.NAMPRD84.PROD.OUTLOOK.COM
	([fe80::f10a:79d7:ac19:3e30%10]) with mapi id 15.20.2347.016;
	Thu, 10 Oct 2019 16:41:57 +0000
From: "Hayes, Bill" <bill.hayes@hpe.com>
To: "ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>
Thread-Topic: Interest in DAX for OCFS2 and/or GFS2?
Thread-Index: AdV/iXuPPH7GaTX6SBGWd+TFpG3sIA==
Date: Thu, 10 Oct 2019 16:41:56 +0000
Message-ID: <AT5PR8401MB1025DFAE60F5A5A4BCC5D2038B940@AT5PR8401MB1025.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [73.95.148.15]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: efa59bb9-46ec-4d52-d937-08d74da0c3cd
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: AT5PR8401MB0403:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AT5PR8401MB0403071AE960F866FFDBD0298B940@AT5PR8401MB0403.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(136003)(39860400002)(366004)(396003)(189003)(199004)(66476007)(66946007)(66556008)(64756008)(486006)(66446008)(81166006)(81156014)(8676002)(305945005)(14454004)(8936002)(74316002)(76116006)(7736002)(256004)(14444005)(2501003)(71200400001)(71190400001)(476003)(186003)(26005)(52536014)(5660300002)(6506007)(9686003)(7696005)(55016002)(99286004)(102836004)(6436002)(33656002)(86362001)(2906002)(4326008)(6116002)(66066001)(3846002)(478600001)(110136005)(316002)(25786009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AT5PR8401MB0403;
	H:AT5PR8401MB1025.NAMPRD84.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: hpe.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8sQS9Ty6n8qYt0p+jYpw3/SWnnVTLGxmdXVVbqcl+X04fFdNI2hpoWqiTJD37kW5kWu2KC3F3ScLcw7OTGDBshlP8lQXOJJCrmJlCU0ybWtn7YXVNDcl/S6rSKp3nlY8YqpX7Xy1daxayI+DEzcZh0K9CoQDJyH2IwVxKim6bUCzJZOibnPHUp6GQVWPEj6LIimF1tzQNjRjH2uuGFeqGCSfhObz58cpk7E4sLhZFpIh0zd7jcpbdkhKfSR3VBS8GEk0XiOaYTYolZzlICxsqv2TBAbTcNFxgsZaRLNa686sbTBqbiDkMAKAG32/y22F4CTFtudOvOkj5GZIoWj1c7Nrp+LoOYKix3O0aI3r4+XOS215Ths0Y6d5yiqmJx3+TtLNE7RJzbZcBGyboyCqfDjnY4I8x8GXl4PrzdeoNzA=
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: efa59bb9-46ec-4d52-d937-08d74da0c3cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 16:41:56.9788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X7rctspwu/F/9vEoMvdP5mmsFNW9SkayPa5eqtQnnHpmRsU/OCBlAKHMENKQnFuL7LEkpuJl+RHvIgDGcXLCOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT5PR8401MB0403
X-OriginatorOrg: hpe.com
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-10_06:2019-10-10,2019-10-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	impostorscore=0 mlxscore=0
	priorityscore=1501 adultscore=0 mlxlogscore=756 spamscore=0 bulkscore=0
	phishscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0
	suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-1908290000 definitions=main-1910100150
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.62]); Thu, 10 Oct 2019 16:43:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]);
	Thu, 10 Oct 2019 16:43:07 +0000 (UTC) for IP:'148.163.147.86'
	DOMAIN:'mx0a-002e3701.pphosted.com'
	HELO:'mx0a-002e3701.pphosted.com' FROM:'bill.hayes@hpe.com' RCPT:''
X-RedHat-Spam-Score: -0.7  (RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_PASS) 148.163.147.86 mx0a-002e3701.pphosted.com
	148.163.147.86 mx0a-002e3701.pphosted.com
	<prvs=018649e3bc=bill.hayes@hpe.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.62
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Content-Transfer-Encoding: 8bit
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9AGhCUt002573
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Thu, 10 Oct 2019 13:06:42 -0400
Cc: "Craig, Rocky \(The good-looking one\)" <rocky.craig@hpe.com>
Subject: [Cluster-devel] Interest in DAX for OCFS2 and/or GFS2?
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Thu, 10 Oct 2019 17:07:10 +0000 (UTC)

We have been experimenting with distributed file systems across multiple Linux instances connected to a shared block device.  In our setup, the "disk" is not a legacy SAN or iSCSI.  Instead it is a shared memory-semantic fabric that is being presented as a Linux block device.

We have been working with both GFS2 and OCFS2 to evaluate the suitability to work on our shared memory configuration.  Right now we have gotten both GFS2 and OCFS2 to work with block driver but each file system still does block copies.  Our goal is to extend mmap() of the file system(s) to allow true zero-copy load/store access directly to the memory fabric.  We believe adding DAX support into the OCFS2 and/or GFS2 is an expedient path to use a block device that fronts our memory fabric with DAX.

Based on the HW that OCFS2 and GFS2 were built for (iSCSI, FC, DRDB, etc) there probably has been no reason to implement DAX to date.  The advent of various memory semantic fabrics (Gen-Z, NUMAlink, etc) is driving our interest in extending OCFS2 and/or GFS2 to take advantage of DAX.  We have two platforms set up, one based on actual hardware and another based on VMs and are eager to begin deeper work.

Has there been any discussion or interest in DAX support in OCFS2?
Is there interest from the OCFS2 development community to see DAX support developed and put upstream?

Has there been any discussion or interest in DAX support in GFS2?
Is there interest from the GFS2 development community to see DAX support developed and put upstream?

Regards,
Bill

