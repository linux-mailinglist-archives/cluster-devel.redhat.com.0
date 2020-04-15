Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 217C41A980D
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Apr 2020 11:11:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586941916;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=h1UF7RGtB1Pbog0NUMV8tDJBLwjc+mTRVhKiphrplxs=;
	b=Jlx+SmjU0W44/wN6UamVUzBhwZuKx8Zh6y/xntM4gWVi3tt/0uTUVMX8k6Ba0yXzrSFg6f
	e3YH/eysa9VkaNGZRMvXtyBbFYTqOnMIHLfFSalbQknPgPS2fvTpYh8b+9r5KvJldE+A3l
	avLas2CDZz3lgcFqVlp3qSW+5XLpNJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-WYR9c4J1PbGShzVIQxJh0w-1; Wed, 15 Apr 2020 05:11:55 -0400
X-MC-Unique: WYR9c4J1PbGShzVIQxJh0w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2D12800580;
	Wed, 15 Apr 2020 09:11:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D061711D2DE;
	Wed, 15 Apr 2020 09:11:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3ADA093068;
	Wed, 15 Apr 2020 09:11:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03F9Bgfs016869 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Apr 2020 05:11:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 36A692166B2C; Wed, 15 Apr 2020 09:11:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31A842166B2B
	for <cluster-devel@redhat.com>; Wed, 15 Apr 2020 09:11:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D535C868CA0
	for <cluster-devel@redhat.com>; Wed, 15 Apr 2020 09:11:39 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-413-6KuusAhlPw6naNK_kY30Bg-1; Wed, 15 Apr 2020 05:11:37 -0400
X-MC-Unique: 6KuusAhlPw6naNK_kY30Bg-1
IronPort-SDR: 95i4dpGue9eNjoYk2K/9cbOToVeWBBtkiWiQhEHO7EFSD1h2NzcPaGUo/1aPiT4V91hLq1wdEu
	JkZ8xqP4mXpXp5SOX/Xmby+I5FPE0PQGo64RvyPtXSLe1rR1eWQCBh/n5ZqGNkWddjcHlITDQ7
	Em2CIJuLg2GWAh9K46RexHbC4bfKgJSCUp2DBrlqFOy3cuWpfNvQik3ltm4DEvJSBQVOAs3W28
	tUMBtevXNEyg/7USRKfOrqenmsbSwLJ1Q0bmbVgbu7Aa3j23lF8D+9rCxEwKNKlpZ8g2eVSPTQ
	c0A=
X-IronPort-AV: E=Sophos;i="5.72,386,1580745600"; d="scan'208";a="244033359"
Received: from mail-co1nam04lp2053.outbound.protection.outlook.com (HELO
	NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.53])
	by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2020 17:10:32 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN4PR0401MB3599.namprd04.prod.outlook.com
	(2603:10b6:803:4e::16) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.28;
	Wed, 15 Apr 2020 09:10:31 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::9854:2bc6:1ad2:f655]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::9854:2bc6:1ad2:f655%4]) with mapi id 15.20.2900.028;
	Wed, 15 Apr 2020 09:10:31 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Matthew Wilcox <willy@infradead.org>, Andrew Morton
	<akpm@linux-foundation.org>
Thread-Topic: [PATCH v11 01/25] mm: Move readahead prototypes from mm.h
Thread-Index: AQHWEm/+X7EfNJ2OKkyFI+rGvCts3g==
Date: Wed, 15 Apr 2020 09:10:31 +0000
Message-ID: <SN4PR0401MB3598C4E727F07B81F75EA6719BDB0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200414150233.24495-1-willy@infradead.org>
	<20200414150233.24495-2-willy@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 65f197ce-a436-4803-b0c4-08d7e11cd958
x-ms-traffictypediagnostic: SN4PR0401MB3599:
x-microsoft-antispam-prvs: <SN4PR0401MB35994BDEBB4BCA4B125C10749BDB0@SN4PR0401MB3599.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 0374433C81
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(346002)(39860400002)(396003)(366004)(376002)(136003)(54906003)(52536014)(91956017)(4326008)(4270600006)(19618925003)(5660300002)(33656002)(110136005)(316002)(186003)(6506007)(71200400001)(76116006)(2906002)(86362001)(7416002)(7696005)(558084003)(9686003)(8936002)(66476007)(26005)(8676002)(66556008)(64756008)(55016002)(66446008)(81156014)(66946007)(478600001);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eUZe0V7dpVRe38Qbak+OXZnXMUyn2jT1GpYBt1XC9V2HJ5Xyago/PL79j8PJ7619d2CH50W5/iS8pHaam7mIgNQNZRbvaicuoSDerHprEzxgP9eZJqtrq9NCCJfQs9YMXgGl6qtzBp4d7ksbQayumPPqBS6CDrh6YZs1sL8hb29So5FmZ3+SogifY4lT5oc4Lnpiluy0Kc4JsJSjE11g2BR6gOGvCVYGdoS0ma1fhbU0L9Gqp8MJxV4b9QkZINmG1LAisy4WG3FHHVRYneSdJLQmbKvqj2qWLu2IiPYOCWSZ7VOOw6UsRiltYIMccHb81ZRxHgAeqp91etm8J71vbObfkjaVsk7VG0W1VgwAasdDG4wu0CyiIFMukSnep8TMPWZ2CEg6zwLe/HFT06TK5J3vkUI0yfY6iCBO1bdyFsmebbUmDkmrO2pLCi/Q4mzl
x-ms-exchange-antispam-messagedata: qMgzjpfOIFZuBsMKi59iqhZM4tReTMgOPKnS76raZ+3KcRbEKzSza4SbkVVNRsq7pQNw92YUmPtibdfvwNsFL6xcmfv8FsxlbXu+l+1sqzi8JXYMmslLPvDBbFkpr37lGmGMCfDrJoh7IfJfypgRvg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f197ce-a436-4803-b0c4-08d7e11cd958
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 09:10:31.7107 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZbWFK7kHx7rw59FVwqO+RfmhITfV5Zu3Iza6p3zBcbXwLKKUzSNQZljS1V+A4nBx7sdlgjD7Vb6RJQ1i/Ys64htwy3/Mpy5928efB5Ofej0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0401MB3599
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03F9Bgfs016869
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
Subject: Re: [Cluster-devel] [PATCH v11 01/25] mm: Move readahead prototypes
	from mm.h
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Looks good,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>



