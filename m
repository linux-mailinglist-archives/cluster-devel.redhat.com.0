Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 56922158C72
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Feb 2020 11:12:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581415937;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=nS2i4Hh/y6CboLda0vgjhiIj9txhD0u5F4L+5tRCj+s=;
	b=DCDqFWJYnQXNuFQLpZGIwsffzJCBvE+Lw3Oh+D/VsgzBkWtA+8kvczyZFY2b7QD9hBmpga
	eptB+oyo8b4hG0MsZZyL3w89ruESH/dbbtPoNIKpFCL0OmSBpD/WVH7+IUYl52zOD5uyLX
	lIYhcnnxtlv7x1qklncG33f0tfGB6ms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-NcO0gcYmOpesU_IoAmh8hA-1; Tue, 11 Feb 2020 05:12:15 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CC9E800EBB;
	Tue, 11 Feb 2020 10:12:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B18365C1B2;
	Tue, 11 Feb 2020 10:12:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C1C918089CD;
	Tue, 11 Feb 2020 10:12:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01B8KPpl006538 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 11 Feb 2020 03:20:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 15CFED0B3F; Tue, 11 Feb 2020 08:20:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D6CCD1BC3
	for <cluster-devel@redhat.com>; Tue, 11 Feb 2020 08:20:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6D70803011
	for <cluster-devel@redhat.com>; Tue, 11 Feb 2020 08:20:22 +0000 (UTC)
IronPort-SDR: TTpGiZ+CrPrMqQD08kY+UMnaQ1VC8AGR3aneqoIUUY8TfLa6+gcKWb/1LnnK2sf5VVJpNfwodD
	eprhvkWp2D1y/As6LgwFt3RkNXQxROHtkx4jMzzq2dBDB1cytEO8cGS3akB+WaKNt8yrJkbpj1
	zT0ezXDptkOTRqEcQHdOzE/cfAUd5swPx02ua+4uNLHkxGkhvTzn5PlkNbyziR0tAnVQudOrXx
	PQTfZviWsfowVKubfDgGAxm3k1l4SLnUaZ45XNsnA1nGNnC+rLBrqC2Xyf9me48/6WhV6Eh+5+
	wJY=
X-IronPort-AV: E=Sophos;i="5.70,428,1574092800"; d="scan'208";a="130107720"
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-274-ZghBQs65MO6UHewhfpPa4Q-1; Tue, 11 Feb 2020 03:20:20 -0500
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO
	NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
	by ob1.hgst.iphmx.com with ESMTP; 11 Feb 2020 16:19:16 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com (10.167.139.149) by
	SN4PR0401MB3600.namprd04.prod.outlook.com (10.167.133.31) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2707.23; Tue, 11 Feb 2020 08:19:14 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::e5f5:84d2:cabc:da32]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::e5f5:84d2:cabc:da32%5]) with mapi id 15.20.2707.030;
	Tue, 11 Feb 2020 08:19:14 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Matthew Wilcox <willy@infradead.org>, "linux-fsdevel@vger.kernel.org"
	<linux-fsdevel@vger.kernel.org>
Thread-Topic: [PATCH v5 01/13] mm: Fix the return type of
	__do_page_cache_readahead
Thread-Index: AQHV4HdLtCSr29ig40CbWBOKZ39/Iw==
Date: Tue, 11 Feb 2020 08:19:14 +0000
Message-ID: <SN4PR0401MB3598602411B75B46F5267B829B180@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200211010348.6872-1-willy@infradead.org>
	<20200211010348.6872-2-willy@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 783a7c5e-dfd1-4f05-3ff8-08d7aecb14cd
x-ms-traffictypediagnostic: SN4PR0401MB3600:
x-microsoft-antispam-prvs: <SN4PR0401MB3600BE4DF5FBBC2A07AC38609B180@SN4PR0401MB3600.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0310C78181
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(199004)(189003)(8936002)(9686003)(86362001)(110136005)(55016002)(52536014)(5660300002)(7416002)(66446008)(54906003)(8676002)(64756008)(66556008)(558084003)(81156014)(81166006)(316002)(76116006)(91956017)(66946007)(66476007)(26005)(33656002)(53546011)(6506007)(7696005)(71200400001)(478600001)(186003)(2906002)(4326008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN4PR0401MB3600;
	H:SN4PR0401MB3598.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J13A6ReA9TSTt1c6bdBpTxtzneb1Ofpyc3HHteWqvtuXD5BIp25wWX5Jj9rty+z8IuBPjt/gIuHTYUfEoYTkHZrnnDILfKSy45g6ryMvZTy61yO2Q+D6ULUDMigsCCjurNntAWZl0Xm/OPaC21h9Uhg9UsfGDU8yRR7pJp/4RtZPLu8Aa+pkHWfnddkRl+me9f0vLAAtyn91TZCvcIqa+pIWQqEAD41sQwhxTwrZ9YYK66o/AOKckkO5BFfhPOEMko2jHkIElHDKQ2xLih2gDaEWxDyXVbnwiNcDQ14fDOc61glpj0fPDXD9wLRF+uURWIoMWc/4/v/xEcylXlRAUCkkC3JGDfLGO5P1vDoTTsL8HhGcdLdCMRrLdg1L3yxaPXNcB6PpBTBIbmB1SpRGyXF5mmIccM3isWoZ/4rvj3nw9fQi+IKdlplFkQzhShVs
x-ms-exchange-antispam-messagedata: gfEyOKrwkPk8qghET5Arq6HHfBJaC0LBjYfYag1yvJsZYT4ZAH1sGnViMxzNGt5I12U+7zjXvc7zduxy+tXWxZcvuxjY2ApX92T48YFRi0PQXQLlLzOjG4KsqnzrprU7tnMP+4Gc0+BVeUyg7Qnipg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 783a7c5e-dfd1-4f05-3ff8-08d7aecb14cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2020 08:19:14.6094 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +UkunN43yImZCGMmfIBExV/09gy+m2seRDcVr8m/zRykHkafS94C2sa/Bp5+xgnFqs3xnQdRlYKfhKG8VEjtTHo39tQdr+ZsU+hlmizKQRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0401MB3600
X-MC-Unique: ZghBQs65MO6UHewhfpPa4Q-1
X-MC-Unique: NcO0gcYmOpesU_IoAmh8hA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01B8KPpl006538
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Tue, 11 Feb 2020 05:12:01 -0500
Cc: "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
	"linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH v5 01/13] mm: Fix the return type of
 __do_page_cache_readahead
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

On 11/02/2020 02:05, Matthew Wilcox wrote:
> even though I'm pretty sure we're not going to readahead more than 2^32
> pages ever.

And 640K is more memory than anyone will ever need on a computer *scnr*




