Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B78DF1A98FC
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Apr 2020 11:32:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586943165;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Ji3TGhJzDny8rGT8CoH5M2xumaxfAigUvDKGoXJlaO8=;
	b=XDNxX4y028N6W4J0T8Pu+5cVDHSLfNb6tjwBOSRm+xhMdMYevSr+Xa40foCu50yL2UGk94
	jc6NdirFrP0LjfLyJ4dEmzSYH1BH7sJ8MTMwl6eCLElDAwLsl4Aiqb1IzUGtTszcv4mnOZ
	+byFPDoaKHB5KBEFRcaG0numNFooKQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-r-8QTTqZPcek9ScBs8n93Q-1; Wed, 15 Apr 2020 05:32:42 -0400
X-MC-Unique: r-8QTTqZPcek9ScBs8n93Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC5C4800D5C;
	Wed, 15 Apr 2020 09:32:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8442C19C69;
	Wed, 15 Apr 2020 09:32:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B4E3C93068;
	Wed, 15 Apr 2020 09:32:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03F9WYec018990 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Apr 2020 05:32:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0F58B2166B2B; Wed, 15 Apr 2020 09:32:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A7DF2166B2C
	for <cluster-devel@redhat.com>; Wed, 15 Apr 2020 09:32:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFA158056A2
	for <cluster-devel@redhat.com>; Wed, 15 Apr 2020 09:32:31 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-366-U3XbNdq7M-STZ5sVRqXIxA-1; Wed, 15 Apr 2020 05:32:29 -0400
X-MC-Unique: U3XbNdq7M-STZ5sVRqXIxA-1
IronPort-SDR: eeRVIlNT7jgc5Ig8ZYnISAlMPD4ZQ9FY6eT5A/Kzo4C9xFYVNPO8mZYw1nU47bM/qi+jwjMgqs
	Jkm1w5xc0QIFmrCNltcXPYA1jgBzuZYSlkKBRReE8ZdNZ0iV7Wk8chgJsOyb+xsT27de56gsa+
	IxTUXDmASKQqo2yApvWnC9SUrNct71/VF3SHLxocRdXHNX3Hklq9nbrE//cCq9i6yRm43xOAQG
	+46gYBKDjsjJbq3IBnWH4hKnqld35SXuN+1u3lOGCEjDN44tbz4VHCpqYlpXgSXmvDpjq+vlCG
	5j4=
X-IronPort-AV: E=Sophos;i="5.72,386,1580745600"; d="scan'208";a="237794024"
Received: from mail-sn1nam02lp2050.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.50])
	by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2020 17:30:36 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN4PR0401MB3632.namprd04.prod.outlook.com
	(2603:10b6:803:46::20) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26;
	Wed, 15 Apr 2020 09:30:21 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::9854:2bc6:1ad2:f655]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::9854:2bc6:1ad2:f655%4]) with mapi id 15.20.2900.028;
	Wed, 15 Apr 2020 09:30:21 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Matthew Wilcox <willy@infradead.org>, Andrew Morton
	<akpm@linux-foundation.org>
Thread-Topic: [PATCH v11 06/25] mm: Use readahead_control to pass arguments
Thread-Index: AQHWEm3c6YkRzif5rUSh6nBZ9gJdcA==
Date: Wed, 15 Apr 2020 09:30:21 +0000
Message-ID: <SN4PR0401MB359806A3638DBDD9A20DDFA49BDB0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200414150233.24495-1-willy@infradead.org>
	<20200414150233.24495-7-willy@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 42318151-4e49-45ff-ce57-08d7e11f9e5d
x-ms-traffictypediagnostic: SN4PR0401MB3632:
x-microsoft-antispam-prvs: <SN4PR0401MB363240B9E9E1F4E5A00E26469BDB0@SN4PR0401MB3632.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 0374433C81
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(33656002)(19618925003)(9686003)(81156014)(55016002)(8676002)(8936002)(478600001)(4270600006)(71200400001)(52536014)(2906002)(558084003)(86362001)(4326008)(66476007)(7696005)(66446008)(26005)(64756008)(76116006)(316002)(66556008)(54906003)(7416002)(66946007)(5660300002)(110136005)(6506007)(91956017)(186003);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3E10msHK2KLvXhznHQ9YJSWeEyPFo8ruTznCKt9trFhmCR2ubEYYVZQ5b/qZ60py5RQMtoBOOTichvWC82eTA779GWZfMYR+n0jwC9j2a1xIBnbe09XNSwRwrMwDvIevghhMnptKQqtFqaSmu/jq0r3dODtE8PoxNftmxV+jYAdqDRMjjjwZD4jPnKAcUZW78ropg/d0uN3EWCOImEWOI9nDXWGT+cMBQGduft9DTkhoIsFGr3OSrQbdP2Sox4bWEi6wL770iXty0EB4N1Cl9XWJvJ4wffLmvT4l0Sdec7k1g3JcoF18QD7hlAR6OZOxQfuIC0aY2D1/5DFciZV3gWw9lfzVsMXD1TlNLfkcoOY6D7X/ZCzJsjwfXXhxtPqMN6+gV2hUmY1c57tvqS1cdVq0hDa6pgqY1eIXnoLUz+KcDUJQfezMtja38Q4FVPCE
x-ms-exchange-antispam-messagedata: mZpW+p+O8zplPaT/JT9mfTC0+kdX2Wm8ycHn3eyabru/ZJeiJGpXDT3S4AcOKIMjTHIna/2LeOItwYoZX63oqxV5WyxCc6oguXWZpQ4vFer6Rl9IkMhWp3vcp/+/RWaZOM9Ce+pvoAKqUGq6yA2o3g==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42318151-4e49-45ff-ce57-08d7e11f9e5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 09:30:21.2508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0pP1zzxdZl0sYzuj3YYPXddr7XLPy9tBvfWuDosAZ5ZaDo5bilbGlM3XKFZhSyUvGW08IS3GnI9W4G7ina2KBTvZbjegH1JZwCwK60YvWoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0401MB3632
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03F9WYec018990
X-loop: cluster-devel@redhat.com
Cc: "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	William Kucharski <william.kucharski@oracle.com>, Christoph,
	John Hubbard <jhubbard@nvidia.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
	"linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
	Hellwig <hch@lst.de>,
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH v11 06/25] mm: Use readahead_control to
	pass arguments
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>



