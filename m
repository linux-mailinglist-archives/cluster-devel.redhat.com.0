Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3AA1A9847
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Apr 2020 11:18:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586942326;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=h1UF7RGtB1Pbog0NUMV8tDJBLwjc+mTRVhKiphrplxs=;
	b=i/th1p4ySoC9MMKh6PLxWFD1FTH+/pgtnB/Ly2n1QMH3kyPVTBsLNyzV5sAfTAI+dGnUyB
	RfWyA8bhlE9jC6DniLn1ovcVoAe9MHQnojqMzoWX1dqxlF6uJp36t4CB/FvIYggX7fBkPa
	IIaP7kTOWK5CE14Eiv9rrs9aH6LgWoc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-7nq15iOgNwScEzrLhH9qlg-1; Wed, 15 Apr 2020 05:18:44 -0400
X-MC-Unique: 7nq15iOgNwScEzrLhH9qlg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F52E800D5B;
	Wed, 15 Apr 2020 09:18:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 485EE5C1C5;
	Wed, 15 Apr 2020 09:18:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 35C9493068;
	Wed, 15 Apr 2020 09:18:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03F9Ibmi017495 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Apr 2020 05:18:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9D8E510AF43C; Wed, 15 Apr 2020 09:18:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9892F10AF42C
	for <cluster-devel@redhat.com>; Wed, 15 Apr 2020 09:18:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86BE98FF66C
	for <cluster-devel@redhat.com>; Wed, 15 Apr 2020 09:18:34 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-446-d96Lzh6KPnG3pYOkbsR7KQ-1; Wed, 15 Apr 2020 05:18:30 -0400
X-MC-Unique: d96Lzh6KPnG3pYOkbsR7KQ-1
IronPort-SDR: hk35kDGYzOWp4zYAC8ocqSZCraUa9gZssprA23p0z/WxuWkdckszKuWSUEpaPVSUQMuGXK9gF7
	ZFxhNY3Pp5d9KqaGdtDBBWj+Juyljsm4eMPXSNTB+/0ZXuR7LY6MghRyIhJEYabHwiRfXkqieC
	bKmGMh9byE8VM8rNvHtMYxIh3ohFnI+/AWxvWy/cN+Wzg5/ly165PpTnUDkvmMefgJcEgcuIfz
	i+8KTGE/0ZPH2Mh89BwQFgHPhrdu1a9uytjmys3dHaxit045sIdFsYQN6WBs765WKORYT5raDa
	Ff0=
X-IronPort-AV: E=Sophos;i="5.72,386,1580745600"; d="scan'208";a="135686820"
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
	NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
	by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2020 17:17:27 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN4PR0401MB3648.namprd04.prod.outlook.com
	(2603:10b6:803:46::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26;
	Wed, 15 Apr 2020 09:17:24 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::9854:2bc6:1ad2:f655]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::9854:2bc6:1ad2:f655%4]) with mapi id 15.20.2900.028;
	Wed, 15 Apr 2020 09:17:24 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Matthew Wilcox <willy@infradead.org>, Andrew Morton
	<akpm@linux-foundation.org>
Thread-Topic: [PATCH v11 03/25] mm: Ignore return value of ->readpages
Thread-Index: AQHWEm3kXqLq3+slIU2TSjQVADTM/A==
Date: Wed, 15 Apr 2020 09:17:24 +0000
Message-ID: <SN4PR0401MB35985342EC4B346DCF6E47129BDB0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200414150233.24495-1-willy@infradead.org>
	<20200414150233.24495-4-willy@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 57014d5b-8a85-4fd5-a7b7-08d7e11dcf55
x-ms-traffictypediagnostic: SN4PR0401MB3648:
x-microsoft-antispam-prvs: <SN4PR0401MB3648DF0AB80BA63113E1CF329BDB0@SN4PR0401MB3648.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 0374433C81
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(316002)(8936002)(7696005)(66556008)(71200400001)(66946007)(64756008)(91956017)(86362001)(4326008)(9686003)(66446008)(26005)(66476007)(76116006)(7416002)(186003)(54906003)(558084003)(19618925003)(5660300002)(55016002)(81156014)(52536014)(110136005)(2906002)(6506007)(478600001)(33656002)(8676002)(4270600006);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rniTLGXvJXgW6JK2sUR1/XLSThA6ieNtsfxl1n+cQBGxvE9ZOoqbBiwJzQMD9oGqNhjeqprWqaONYGHjYO4Q9nl+eIAU/lRG7fcAfpxdSAKAuzZUOJlyc2C3r7xIhq0+pLTdLTSHOTMzGJAaPBl9daL5Xjy8Hv0GrTqiESJpgPUUFgPOCjcW6ZbZLItjGEbmn7o9H61Og+KCuv7TMP1CU6d0Wb3LwMkR76f+fKF49BFL9M7N5XwGGt+uTm6N+iWXgqekAt1ENLeGu1NvIr++Y6uVmLkF4priioh5sEnxIK7KiobEw6c+63Gv+qiqIRNADbPQ8RHSyGLSOEtwS4sfwEan4MZs5p5n5OFBd5fMMcV1Q1oe5yf1mpRoOSpBETK7bGg9WygsdbMjdxGtXNcxGTxDvmEwcMRGur+7bEg8/RpmSH50wiD+LE4ugMJXc+3M
x-ms-exchange-antispam-messagedata: s7qYqR9eN7xrN7e9T2xU72Dtqk6WG15tS2l27vqGalrqnDj2UkfCc4ahqFKj4ArRlz3PjS82n70lx3qyoN06RmDO/7+gwNCgH8MJ7ASnohHsUjswIUgiDuYBzSAyYhqbVzHMDh+9PbX0HuWtT6BOdA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57014d5b-8a85-4fd5-a7b7-08d7e11dcf55
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 09:17:24.4123 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i5uQ67XI+LDSXRymC8i8GEceBFw3RinJNUQWorx1KZ1DYCRvfbMIZcAmJvKKEjrTNzp5CVjzSeaGPC9s3njliFb1E8oDftqzqC/YpNU8Jzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0401MB3648
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03F9Ibmi017495
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
	Christoph Hellwig <hch@lst.de>,
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH v11 03/25] mm: Ignore return value of
	->readpages
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Looks good,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>



