Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9135D165E3E
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Feb 2020 14:07:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582204037;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=puLu5yHBzq3jKsCMd5N0Kycb64DmGevr8f/j7XO26oc=;
	b=UMrBnEnbvGampP1+OPVhJnpQYLh+wAJnBrOgAblEkmJGndxTQXr14BtrlUxJ5auPbXxuhv
	bVX7W5kTTBOOCackREnreh3FqV6YSQ8LZ+CJYLS9dQJ+RsM3JXf9+y0JuiMdN8/dkYcuRR
	d43f8QKRFwGqGg3xL8pX6hL1bIQWjfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-INSIW3FYOHCRsO_2FUp-wg-1; Thu, 20 Feb 2020 08:07:15 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54C31107ACCD;
	Thu, 20 Feb 2020 13:07:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA7A65C553;
	Thu, 20 Feb 2020 13:07:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB7CB35AFD;
	Thu, 20 Feb 2020 13:07:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01K9hUWW006701 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 04:43:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D94471055421; Thu, 20 Feb 2020 09:43:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3E701055414
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 09:43:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F8EB800296
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 09:43:28 +0000 (UTC)
IronPort-SDR: rf4RZS02dfBh5eg/Ser8Jycy8iQvg+TkSSxAtv5u02Qd6aGnPcTczKHkApuFeUjmaa5Q0D4v/G
	gX0lLZZLqzaJ2N11xxrUjesOhwiN8ouTd7EFeqblUXEPle5mjwlk7fG4A/QEIkZ73HcNmKtn/Z
	gnntC3MWr6gkE+g7ayEIr8rHGlToGcK/GSOVSyztHtVHW73tASiB/Y7qk9ILAfg4C8S9iOwFb6
	aLC/LSjsd8LXVHUAaV+FI9R6RzXyPa4+NTU6ldgPGl5OqVPAubABx9lnaLhotPdOwVx1PiEt6u
	1Z8=
X-IronPort-AV: E=Sophos;i="5.70,463,1574092800"; d="scan'208";a="130254905"
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-347-XHc4-rPjMyCvSNzLNeAsHg-1; Thu, 20 Feb 2020 04:43:26 -0500
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
	NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
	by ob1.hgst.iphmx.com with ESMTP; 20 Feb 2020 17:42:21 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com (10.167.139.149) by
	SN4PR0401MB3712.namprd04.prod.outlook.com (10.167.140.147) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2729.34; Thu, 20 Feb 2020 09:42:19 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::e5f5:84d2:cabc:da32]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::e5f5:84d2:cabc:da32%5]) with mapi id 15.20.2729.032;
	Thu, 20 Feb 2020 09:42:19 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Matthew Wilcox <willy@infradead.org>, "linux-fsdevel@vger.kernel.org"
	<linux-fsdevel@vger.kernel.org>
Thread-Topic: [PATCH v7 14/24] btrfs: Convert from readpages to readahead
Thread-Index: AQHV52gHXOnz3eutsEej0YiVm6PhQQ==
Date: Thu, 20 Feb 2020 09:42:19 +0000
Message-ID: <SN4PR0401MB35987D7B76007B93B1C5CE5E9B130@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-15-willy@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1f9f36ad-9c2b-4615-8f76-08d7b5e92dbc
x-ms-traffictypediagnostic: SN4PR0401MB3712:
x-microsoft-antispam-prvs: <SN4PR0401MB371296C64FC8338D311C5EC19B130@SN4PR0401MB3712.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 031996B7EF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(189003)(199004)(110136005)(316002)(54906003)(7696005)(71200400001)(81166006)(86362001)(81156014)(9686003)(8936002)(8676002)(55016002)(7416002)(478600001)(6506007)(5660300002)(91956017)(76116006)(52536014)(66556008)(64756008)(66446008)(66946007)(26005)(66476007)(2906002)(186003)(4744005)(53546011)(33656002)(4326008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN4PR0401MB3712;
	H:SN4PR0401MB3598.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jUs4EXsOJ1h6Mc+meDzlGUyOWASlmGwVcRYbusjWjnYc2N384jN2exjY0BSvFVN0FbrY2HTenQi6UygtEostQlmrd0SQAAIc+uInuE+BWUKNacWm/BEB+H6kMR8IRlR0YJLAKFjSPP0MBUtybF9JS9TKOrSEona/RB9DL3WntLiiqekNqk6BLRFRpG5vk7nKbUDtj9umYVstira3cCP8LCyzU0Huu8qbMYhjogdOcam/WXhBUNpm8gZsCkTtd1+vBlY5iNQ9lJTde0UYlnkuzIch3fxsi/cwtdUY+xKnDy3qiyoUrTq29Pt4gY70yPdOKHv5H1aYjOe/ZaXIqLRGQ/ZdEV1eDkLOgN2VdthJ8MZEMkOt8uPyS0M7mG9uJC0+wHaffPZcYnLWM8FDhnYOwBP7RLfmNgPAtoxsxLIiKlfCzyOjJUevNmnvJudHquy8
x-ms-exchange-antispam-messagedata: vbv93IQYZbgJP1Z/hVNS1KpHjde+X2GbFSSagnVuEXilWwOZBJ/D3AfJnfwu/zHRERd0cukJswJ4JEgDtj3c7EzoUWFBzGEdzjVjFLKlPOOWx0C4WiG6CDu/hfH6ZouoA7OKc2KGtXg8hiDrQHZ73w==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f9f36ad-9c2b-4615-8f76-08d7b5e92dbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2020 09:42:19.3955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j4ODXpF6prvGYEa2v+nxNMmTpJxN8bgfI7Uj2C391EZvB7+MVwN/HINz4ExXRz1C9miRXVR5mYpe3HK7nZvA0+DRHnOHhAuot8u9Iw21FCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0401MB3712
X-MC-Unique: XHc4-rPjMyCvSNzLNeAsHg-1
X-MC-Unique: INSIW3FYOHCRsO_2FUp-wg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01K9hUWW006701
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Thu, 20 Feb 2020 08:07:03 -0500
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
Subject: Re: [Cluster-devel] [PATCH v7 14/24] btrfs: Convert from readpages
	to readahead
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

On 19/02/2020 22:03, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> Use the new readahead operation in btrfs.  Add a
> readahead_for_each_batch() iterator to optimise the loop in the XArray.


OK I must admit I haven't followed this series closely, but what=20
happened to said readahead_for_each_batch()?

As far as I can see it's now:

[...]
> +=09while ((nr =3D readahead_page_batch(rac, pagepool))) {





