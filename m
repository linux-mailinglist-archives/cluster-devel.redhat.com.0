Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 156C356FA20
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Jul 2022 11:13:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657530811;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=/MC3ZNG6PRZ41omW2dp6TtAGW9kEBgNOaGiTc/Z8KIc=;
	b=NZmFRrLAX3kPavIBhJT53MTXrxPQYgs7+gZpskjgF8SSwsnipMPK7+vtE0PiKXKWgNRQGR
	yixC8rr2lOvi8yxrju+xRAtCDN+X566uLDOk4fqvFDweiA8QYkLVFon2Drwl+LAvrbOO2p
	GcqJ4nM0knrM6jbLF3RZQfT6gOhC1Fg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-5ltDV40GOZm9Y2gd1ueJnA-1; Mon, 11 Jul 2022 05:13:25 -0400
X-MC-Unique: 5ltDV40GOZm9Y2gd1ueJnA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABE7D85A584;
	Mon, 11 Jul 2022 09:13:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3E730141511A;
	Mon, 11 Jul 2022 09:13:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E91981947055;
	Mon, 11 Jul 2022 09:13:22 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BCD8C194704A for <cluster-devel@listman.corp.redhat.com>;
 Mon, 11 Jul 2022 09:13:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AAEEC401E54; Mon, 11 Jul 2022 09:13:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A57AF492C3B
 for <cluster-devel@redhat.com>; Mon, 11 Jul 2022 09:13:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B5F81C0F681
 for <cluster-devel@redhat.com>; Mon, 11 Jul 2022 09:13:21 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-xk_YYKzwN6Sjnf_9eJEx7g-1; Mon, 11 Jul 2022 05:13:17 -0400
X-MC-Unique: xk_YYKzwN6Sjnf_9eJEx7g-1
X-IronPort-AV: E=Sophos;i="5.92,262,1650902400"; d="scan'208";a="317489907"
Received: from mail-dm3nam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.41])
 by ob1.hgst.iphmx.com with ESMTP; 11 Jul 2022 17:12:11 +0800
Received: from PH0PR04MB7416.namprd04.prod.outlook.com (2603:10b6:510:12::17)
 by BN7PR04MB5297.namprd04.prod.outlook.com (2603:10b6:408:d::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Mon, 11 Jul
 2022 09:12:10 +0000
Received: from PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::d54b:24e1:a45b:ab91]) by PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::d54b:24e1:a45b:ab91%9]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 09:12:10 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, "Darrick J. Wong"
 <djwong@kernel.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Naohiro Aota <Naohiro.Aota@wdc.com>
Thread-Topic: [PATCH 3/4] zonefs: remove ->writepage
Thread-Index: AQHYlQZMqTk3YdLteEyk3FxBUYosFw==
Date: Mon, 11 Jul 2022 09:12:10 +0000
Message-ID: <PH0PR04MB741619B1FC12748A889EA8189B879@PH0PR04MB7416.namprd04.prod.outlook.com>
References: <20220711041459.1062583-1-hch@lst.de>
 <20220711041459.1062583-4-hch@lst.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f44b253-97c3-4c8b-4687-08da631d6fa7
x-ms-traffictypediagnostic: BN7PR04MB5297:EE_
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: V1S6NqbV2x6B8j1HWImGPCTj/zpVsw6Bt7i3IgiAjylYQQp2TV0zRj5QwIT69pVZZJ7XfCmQGjSNAP7BSVm09hYS67HidKTsU+vPIiHGm70qDQsokT3eo9YVhgKDPgIPMhVromej02JhK1XwSNwvlBVEyILeylZnkdl8D+eGZzp+pdL27HazFQHlkxk3a2f6uYpWoDmqEqHRJbUa7L4ZM1SKSF4MJz3HTyUZ6QwbAdIIwP3vc0sjZjtiJvWWdNqrHjEyqL5uPk67E9/x8aHgjcZx0BJNAuGVoOQn5e+qTPgSaG1WbKwswLVEt4JEsGXD5zEjR/N521TSeoRMa23FNLfQfkfezyh/Q/KThN2f18ijSbZudJ+TP3gYsu9ALwNrp+guA/yPsOmWPM5EIqrdBYYdUyXLkP8NWWG+Xm2x2CxhHYUWQ01fsbxGg9xkWQ8eW+kpLJpiTZ2CXPYC31xG4h02k3x5PrWRc/+pxLogvO7nZFdm+9fFQBmzH02Jv4N1Y+rDKdObc1Guejg+MPD7vm9PT8p1VuJuArcZfTXMBqS7nBUtVLnHh4HZ6KAvrWl05DuSc9fGPWWcYAYyqqtx5+Ogqg9oHDzEOk14D9CKLDAvC+BXyvV1BEANAiQuY1F8TsdRwZ5o7Sft9qkZtYOLDYIXGmuUu2wXSM0rYhMEFC/E9bULRj+DuKPKD/SpyT2BdbcdI9wI7HqhU74Sej/UIEUNoVn1+59pi/Pdo+Fzx3NO9u7kt+xGhSyAGSYYBOnEUvRCar7fY/PEWmXKOrtYzqdKP0WT9EsuaK7XAy8OD6kwMGAwLd1L7JI5ODrsMVFH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7416.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(186003)(9686003)(4270600006)(86362001)(33656002)(55016003)(38100700002)(6506007)(19618925003)(7696005)(558084003)(122000001)(38070700005)(82960400001)(478600001)(2906002)(6636002)(8936002)(52536014)(76116006)(110136005)(54906003)(8676002)(66946007)(71200400001)(64756008)(91956017)(66556008)(5660300002)(4326008)(316002)(66476007)(41300700001)(66446008);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?li/p1wDx4F/MC4snqPX1XsgB9HzWf1nz9a/Qygqb1lRQ5wEejtPAVoYaSRhm?=
 =?us-ascii?Q?tQ3OjCGu5dDWIK3i9ICVshs5Xu0jG0o5HR7wY0mRLbGiDcrtTk+0ytg7kOOZ?=
 =?us-ascii?Q?AC3MTuTSTNcdHy1A41rCvAeT5F1i8ODjCIx0w7rd0KOKdR1X8m7ug2yz41tm?=
 =?us-ascii?Q?C+uFDpPfum22SRwhxznSfCsJtNKUk4Sl+l862+ch8dJzQ+x/NX+wG93Z90LB?=
 =?us-ascii?Q?rbuiUyUgpnnP2A0EmBWAPURpK9zkhPYhssGjLcll23Flv1O7zl6ZQ3vkpeHt?=
 =?us-ascii?Q?OC5fAw1wcKVweFtBLI9z20s6DlDGjKZ+puaaUyhOfMIxXNId3R08DOtt9Xx5?=
 =?us-ascii?Q?+0UrqJepwK937PtVsT9WJOqkzbtRf8H/CPGwUhnO9w5MpczQPGiSiSWktnua?=
 =?us-ascii?Q?OZe7pnwauvP6gl0rtMRV34Iak9+XyVF0xFUFItkHGWbgPuPHPuWDslb7LQ/Q?=
 =?us-ascii?Q?2m0zv+yJRuPuPACRw5NS2GFwngCP4CvAiz/gv/sW+P2Tu3au1Ka/hjwBAbx2?=
 =?us-ascii?Q?4wz5N5kj59eVeSWO/1l1288VqbH8dG0TzHm7YS53Yj4VxCJcGiF6T0lcodRa?=
 =?us-ascii?Q?ReSH2/aTzECTbbwMpqHUfz53Da7t2YvOJvI9/TxNp7Mr/1wLkHr33e+mVyOP?=
 =?us-ascii?Q?zD+WEWk/cUZCk1KJc3m6uC23SC8oxo+LZ2WdV2khZnO9YESIUGOzDH5sNMBx?=
 =?us-ascii?Q?5h5hmAO/NRNNalmGtQpOHb/QnM9crFMyNa4/89+8Jzo/c3Ba9/wyuZZZdarM?=
 =?us-ascii?Q?hEaPq9sQhyhFivoo1csg2Q5AdzevQXVJjuU/yPXF7+yxjmArCA65gPsN/2BM?=
 =?us-ascii?Q?Y6Q+IdlS+nloe0PpGKaCL1VtBxEHf0Dyeyl6DEl6Ru+/AIGP37fzhtAeIgIW?=
 =?us-ascii?Q?669tPdXlOJNJ0HG0JjAHcr2xZN1lrxCjHEVRdH1k95UH0nlaEIqS3d44KuQm?=
 =?us-ascii?Q?2lVaBxyA/jwisMb58CVtlbo8URFKer7ZRXVtQgn64GKgvFbiim7BcISed9Vw?=
 =?us-ascii?Q?zYlJ9CWmBEZXKTBWyjKT6hSiHBhApMHnm+H0XTkih2EU5pXzXsIZ+n5FwjOZ?=
 =?us-ascii?Q?rHNYbpfDdTM1v+QKQ2h50HJ9W4K8i4uv8HSAXdM1CfnYqOG6fQLRrztTCSvL?=
 =?us-ascii?Q?bIHfO1sxbhBHLGDZbGWWoO5dJsGA6Oq549BUyFdsi/jfnN0da2xoh7m/XmLj?=
 =?us-ascii?Q?hp5//f+cbIvPWhakTOsEwGtfi9oU0Nw3PsdJZmHYVALWoehE2tmz/ZR8icTc?=
 =?us-ascii?Q?U0En5IegjlpTUYdXRqmEcufDS7X5P5Rf/SJ/9EAPkJ553xpCCG+b8nyAXOCw?=
 =?us-ascii?Q?Map8GoS9be61MPFWsE9XRnrM3uwhCyem8Gq/N/lu9HBdDsFWN+DrwVDo1g9q?=
 =?us-ascii?Q?AlsTtKet6S5hawCzQItVkPpN5zqYrRy5WvKRn5SHbn5qiXkNwy8xjCvcrQ2Y?=
 =?us-ascii?Q?DBuuwLAbLSBjyr98cWtR8sGCVqM45/YWJn5Pn71VRyDdJKGFDw1bnl0Rk9X3?=
 =?us-ascii?Q?hpNp8KEpgbJUzQChaj4CopdQwzkY2xdqLPnyq53zspS3LpIcrJKFVOfzApAq?=
 =?us-ascii?Q?7xjyGiQLih27mCxUqnl07VHQiZCs4adWp1uAOkHjTEX4mI0ZaItuVK1k6mJd?=
 =?us-ascii?Q?nQfcdM7viqxiRE0Jm3jSpienrZMAuMPxUmaIrsx6wDhCnsIkTmOET1vGfUzC?=
 =?us-ascii?Q?A462QVl9LZxctXgNWqmKJsoICsE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7416.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f44b253-97c3-4c8b-4687-08da631d6fa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2022 09:12:10.4469 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AiGNdUHPpXkQE+mLWZtqfJVhUkNPSZY5Y+ooaC/5iPodkgTcv5BmTuJJ9FL6qgqnyWI6g2DUH9hmq1UgyGV4YWaQW+FYgjfvVtc3NYGa+rE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR04MB5297
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH 3/4] zonefs: remove ->writepage
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 Johannes Thumshirn <jth@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Looks good,=0AReviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>=
=0A

