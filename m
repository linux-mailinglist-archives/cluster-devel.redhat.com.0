Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 455841A984F
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Apr 2020 11:19:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586942367;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Ji3TGhJzDny8rGT8CoH5M2xumaxfAigUvDKGoXJlaO8=;
	b=Q6/ghJXr+NGrNXhdoDXWEiM3+UD4r0q/UVwnzwGr7NsdpZU5QcTeeJalhohJKwSIJkPBuC
	VwsTLTl01levpd0w+/2kZqFDQK5fYfCzcUPeu9+JNDoFeHB0qONCz0rZqBOYylcwkSUN+k
	wyU2i2pe6HNkrFPZAhzKCLJfH8462js=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-KI4crQQIOhS66qDGIxjDSg-1; Wed, 15 Apr 2020 05:19:25 -0400
X-MC-Unique: KI4crQQIOhS66qDGIxjDSg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9169190B2A3;
	Wed, 15 Apr 2020 09:19:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4AB9116D96;
	Wed, 15 Apr 2020 09:19:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BBBB793068;
	Wed, 15 Apr 2020 09:19:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03F9JKjP017596 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Apr 2020 05:19:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 57570107528; Wed, 15 Apr 2020 09:19:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 520BA108BE3
	for <cluster-devel@redhat.com>; Wed, 15 Apr 2020 09:19:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 642061017E43
	for <cluster-devel@redhat.com>; Wed, 15 Apr 2020 09:19:18 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-467-SGRa3CCWOUKvz9TGnmcx7A-1; Wed, 15 Apr 2020 05:19:05 -0400
X-MC-Unique: SGRa3CCWOUKvz9TGnmcx7A-1
IronPort-SDR: 7kjzK1Ad2wI5b4+VcSOfMv6/ppyrbsci/xuhvxCYoArjjognUejG8HHW6YMl9AM5WbSDToOdLP
	X8dYv47DtU4cxM0zSGBTTCmlK8wP7DfCa/ONMGdAtkVZHrIAUlag/V94tDHZx5Uqw5rEVLtGTV
	YdIi0d+qBDUxVDxPM3/vVeBoffG4x+z2tpO+sACAhLugH1NqtrgauHv3RN5nxrFamA+IwR3B5P
	YE+2CSRf8cu8pNZHTR4rO7658OLaGp63lrzvi2P1PE8rrc2pCOuSOMxkZQ6mYnVUJEk/ZuzROQ
	VcE=
X-IronPort-AV: E=Sophos;i="5.72,386,1580745600"; d="scan'208";a="135686908"
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
	NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
	by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2020 17:19:04 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN4PR0401MB3648.namprd04.prod.outlook.com
	(2603:10b6:803:46::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26;
	Wed, 15 Apr 2020 09:19:01 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::9854:2bc6:1ad2:f655]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::9854:2bc6:1ad2:f655%4]) with mapi id 15.20.2900.028;
	Wed, 15 Apr 2020 09:19:01 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Matthew Wilcox <willy@infradead.org>, Andrew Morton
	<akpm@linux-foundation.org>
Thread-Topic: [PATCH v11 04/25] mm: Move readahead nr_pages check into
	read_pages
Thread-Index: AQHWEm4IkvFnOm+tn0ujKbHOMv4ngA==
Date: Wed, 15 Apr 2020 09:19:01 +0000
Message-ID: <SN4PR0401MB359877A9FA5F54D9B9478A409BDB0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200414150233.24495-1-willy@infradead.org>
	<20200414150233.24495-5-willy@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 34e1ef26-dcd0-432d-5d98-08d7e11e0926
x-ms-traffictypediagnostic: SN4PR0401MB3648:
x-microsoft-antispam-prvs: <SN4PR0401MB3648BFA0531D55F928A734619BDB0@SN4PR0401MB3648.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 0374433C81
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(110136005)(2906002)(6506007)(19618925003)(5660300002)(54906003)(558084003)(52536014)(81156014)(55016002)(8676002)(4270600006)(478600001)(33656002)(71200400001)(66946007)(8936002)(7696005)(186003)(316002)(66556008)(7416002)(76116006)(26005)(66476007)(91956017)(64756008)(66446008)(9686003)(4326008)(86362001);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ts4kbZfVIx3jY3ipP2XDo22PJ/uDpAUEebR5XqTR/mqTdQxW52hs+0U7TYZvRVbRm8ZHawitYkINlnyCicp/zaMoChF35gNTbuhUiNocBU1MrXuf+a4EuKOhrzn3WhczzDeOj0Acl+U++zZr5qa2Yn1SETaUqhqrQOPNDTChvu6C9bxswB787iloZ3k48x4rjZkOI25b8vl6jrAuA7VG2nARo2dQhPCadhpHzDJaglBmGHT3TBhvqWe47qXvsvQBei6VtNzbPXIoD9t7CEjgLGshUTx7oLGsxK67gsAKdpxD2PqzK7L2bvfUJG04JXMUQu7Ht06ocRyFS2WXEJRZwepDKFRy4zVwYxUppYPLEFcGmYXk56xr9oAxKyr9iMaHKripTCrf55JgxIiEs1M8z4OGHnyZfb4C6NlERG1jlclZMfgY1lUPkqLTiuyiDRe5
x-ms-exchange-antispam-messagedata: G5b00ZkXeotDfHr5faVQP7pQ8wJ3BUN2v83+0ZSaeaqLYTG62rwp0tpukyet2r/12j/07OjwMd35u20OT33lASk1RWliQXm3Y5wCN2+4chVeVuKQjJoMrbfgUiVbiMwJGAN4lrZmXEfLSfXxRIdFAg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e1ef26-dcd0-432d-5d98-08d7e11e0926
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 09:19:01.3852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7awMuL++xctXgRnNnTlkMtxoRGQgn6ttJ1Pw3s7lCSFjbymJ67INYV6uYM9IJ/lwJ2++fSVytVZUtgBEza8yH7+QrjyHiKW1mXwoRzbBDfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0401MB3648
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03F9JKjP017596
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
	Zi Yan <ziy@nvidia.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
	"linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
	Christoph Hellwig <hch@lst.de>,
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH v11 04/25] mm: Move readahead nr_pages
 check into read_pages
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>



