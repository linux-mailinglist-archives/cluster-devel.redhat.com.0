Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D41D81A98FD
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Apr 2020 11:33:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586943180;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=h1UF7RGtB1Pbog0NUMV8tDJBLwjc+mTRVhKiphrplxs=;
	b=O7wHTTpI+FVsShttqzbe2ED3/IEQeBnY50rO6wI7YTekpfjjt2SheIhUBLFQ1B+281JtHH
	6Lb2qOYVQFtd2dOPqT8i8NOzxrh56X2QvfSrIXlP5cxqSlPWDmq9TUOIHdfCRn4UxW9WyT
	slqELovqZ0JcJoINOdgmbsRyium9XUI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-pskmBxVkOsSrjBVRdyHpVA-1; Wed, 15 Apr 2020 05:32:53 -0400
X-MC-Unique: pskmBxVkOsSrjBVRdyHpVA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9432149C1;
	Wed, 15 Apr 2020 09:32:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7434F38F;
	Wed, 15 Apr 2020 09:32:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7025B93068;
	Wed, 15 Apr 2020 09:32:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03F9WmLH019006 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Apr 2020 05:32:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EAF052166B2C; Wed, 15 Apr 2020 09:32:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5BFF2166B2B
	for <cluster-devel@redhat.com>; Wed, 15 Apr 2020 09:32:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAD88101A55A
	for <cluster-devel@redhat.com>; Wed, 15 Apr 2020 09:32:47 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-58-fd09pVtWNmC1vw14EZp0yQ-1; Wed, 15 Apr 2020 05:32:45 -0400
X-MC-Unique: fd09pVtWNmC1vw14EZp0yQ-1
IronPort-SDR: BaKMqZV9U5WwLXYLi2bhk+5+q/kczDr3LpXzfn7QKUGKGZwJ+Z2lMl45zbsrCxFFB3YsGvgPF3
	0awmKBcRWsjYUiL9wkbjpdvSzlq95ReIZHksdr5mrFXp32cC+j/qqO/EKjTmKFBgwF3Cdx0JKO
	MJuMoZJlhXgZkfneMA7ImtTlxOFv3FON6ftwuV10BFuUI6acyzvINNEnWa5gELI6J6K3CvrsGM
	/Gh/gHo5tj4TYTIcu1STx9WVbWLRv10K9qwyY+uvY/AMHBY6Kb7S1I/Csg9XPzji/fFqjEE2V6
	f2s=
X-IronPort-AV: E=Sophos;i="5.72,386,1580745600"; d="scan'208";a="135687648"
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
	NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
	by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2020 17:31:43 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN4PR0401MB3632.namprd04.prod.outlook.com
	(2603:10b6:803:46::20) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26;
	Wed, 15 Apr 2020 09:31:41 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::9854:2bc6:1ad2:f655]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::9854:2bc6:1ad2:f655%4]) with mapi id 15.20.2900.028;
	Wed, 15 Apr 2020 09:31:41 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Matthew Wilcox <willy@infradead.org>, Andrew Morton
	<akpm@linux-foundation.org>
Thread-Topic: [PATCH v11 08/25] mm: rename readahead loop variable to 'i'
Thread-Index: AQHWEnBXN8jjeMVDnk++wod6vaQDSA==
Date: Wed, 15 Apr 2020 09:31:40 +0000
Message-ID: <SN4PR0401MB3598372581D036EF768DFA4D9BDB0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200414150233.24495-1-willy@infradead.org>
	<20200414150233.24495-9-willy@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4a7f4252-07f1-4865-3c86-08d7e11fcde8
x-ms-traffictypediagnostic: SN4PR0401MB3632:
x-microsoft-antispam-prvs: <SN4PR0401MB3632C5115C84F1A1787AA3629BDB0@SN4PR0401MB3632.namprd04.prod.outlook.com>
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
x-microsoft-antispam-message-info: 9unlhB9zbhKeOGqZX91AELl9VJzJqA95l7GkPq8ATcgXaeXp/8Jcs8m7QAcefGYVwrF1AwISC+Gsv8segtTkCc7ksUjVLYfKxoeO4G27VZIJqWeMOgym4ewfOwgCGykZe998NeRInbIbJ5lELWmcsg7wXy6w8dZP11mjR7z1g7v6Fs/0bmfuCaayUW5zKduGWBTmTb23iL+PP0WVBCGN1A6vIwIEh10m+KVGCsoYWCuylH92XVIZqhIi2j+D/vrNGBoSxO7HCwmvm4Ywc8znf7ZPSL9k9YEEx3LzZpGOMUQr08LKQw6pED4ekRs3EDiqL8oAlQtf0q9n6fOK3dPQ41+cyDKZ4sJjAz9w+EDY7wTjLUuPzb4qOXn5/grqirRGLLwxt04moOAi4dRSeD69vOKQfwn8wz6CbXRGMqjZFmdXxZUz6t+G/gJP5gl3gKUK
x-ms-exchange-antispam-messagedata: uhQbOw6ZKaMUhGwm83KjCA/tI43ywZ17Yb7d+ofiLSyFC4Av+1/BjYHUgs9Si4olcDzwJY6apykh1yIp/Nq3zqtS/C+BY8HXfmEifgjowQwaMRdaQB5YJQV8Bq9mgo88QjrcsNLj9LjbCT++LncnyQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7f4252-07f1-4865-3c86-08d7e11fcde8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 09:31:40.9600 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qQpPVAPFWC51jmm2IphX52KtHY+a4IBt1a1VTBDjiMNS9WcYTo+ZllYTiF18EqbofEF+GUeemwhKFbVB54AohdffwC4b1kYlT6jjz318XJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0401MB3632
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03F9WmLH019006
X-loop: cluster-devel@redhat.com
Cc: "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	William Kucharski <william.kucharski@oracle.com>,
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
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH v11 08/25] mm: rename readahead loop
	variable to 'i'
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

Looks good,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>



