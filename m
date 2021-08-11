Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id ACF5F3E8EE1
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Aug 2021 12:41:40 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-MP6nlHLVOCqmcs3AYidC1A-1; Wed, 11 Aug 2021 06:41:38 -0400
X-MC-Unique: MP6nlHLVOCqmcs3AYidC1A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCE718799E0;
	Wed, 11 Aug 2021 10:41:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1B1A28559;
	Wed, 11 Aug 2021 10:41:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A2954BB7B;
	Wed, 11 Aug 2021 10:41:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17BAcgem029984 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 11 Aug 2021 06:38:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 72145115D7DF; Wed, 11 Aug 2021 10:38:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D88D115D7DA
	for <cluster-devel@redhat.com>; Wed, 11 Aug 2021 10:38:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08D81800883
	for <cluster-devel@redhat.com>; Wed, 11 Aug 2021 10:38:39 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-82-_jEr6NT8PbWe0m_AVwUqmw-1;
	Wed, 11 Aug 2021 06:38:37 -0400
X-MC-Unique: _jEr6NT8PbWe0m_AVwUqmw-1
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
	(mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-39-LA4Q2z28OeKaw9hjmvZ_rQ-1; Wed, 11 Aug 2021 12:38:34 +0200
X-MC-Unique: LA4Q2z28OeKaw9hjmvZ_rQ-1
Received: from AM6PR04MB6488.eurprd04.prod.outlook.com (2603:10a6:20b:f8::21)
	by AM6PR0402MB3720.eurprd04.prod.outlook.com (2603:10a6:209:1a::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19;
	Wed, 11 Aug 2021 10:38:33 +0000
Received: from AM6PR04MB6488.eurprd04.prod.outlook.com
	([fe80::793c:6276:4f2a:4d71]) by
	AM6PR04MB6488.eurprd04.prod.outlook.com
	([fe80::793c:6276:4f2a:4d71%4]) with mapi id 15.20.4415.015;
	Wed, 11 Aug 2021 10:38:33 +0000
From: Gang He <GHe@suse.com>
To: "cluster-devel@redhat.com" <cluster-devel@redhat.com>
Thread-Topic: Why does dlm_lock function fails when downconvert a dlm lock?
Thread-Index: AQHXjpj6m348jZlxYkOpUHBRPIh0ew==
Date: Wed, 11 Aug 2021 10:38:33 +0000
Message-ID: <AM6PR04MB6488E4D6F12BFB4B91BE9E45CFF89@AM6PR04MB6488.eurprd04.prod.outlook.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e3ffded-b786-4d05-c3fa-08d95cb42ae6
x-ms-traffictypediagnostic: AM6PR0402MB3720:
x-microsoft-antispam-prvs: <AM6PR0402MB3720D1663CCCB5F652F103D9CFF89@AM6PR0402MB3720.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: m9Gk7Oi7hChxcDb4DH9Xhp4loGlmC7YOtBFn0PvGBKZjhgolqMNx2CenZPTsy4Cf0EwU44gpV1qObWH5xEcUToHw6uoOWJDLdFFa7Ck+FKxDuZ5UTKbAncBu3OWV4XD50P4KolkyDIlx/1077O5pC/ISHZzzFwnjBHySpVpqa7EL463ReYWZAL6JwQOLwpgXkRs5+ri//LjCngNkwCtCsPeREk4l+FGZUWtVr8GNVPymNXM65N3uLS/obsHpXhuCVKzFm3YZFGyilkdPCCiiAkduApZBLfKATrjd+fG7iLENFidoOgqTyA1QCtoPAy+4nO3lW8o04xGOE0wqlTkUoEzXdCetsYsXIEcj4GoY+ZSBGkUWzwoRJ98l/je2IvxfbscTN7HpuIxwjYYvHvITLIKvV0mp1A7k9eIfwBx70mSbp/nNZpQ/RYk5CJBCJrKD/GtE0j20DgzjmNPKEYQmtoV+IEoNKmRmY/cBzp6C2cIYEvWtHi6PqgOyGLN65FfKt4EjqpWQ+D1CC0vaJVGR4G6gooC3MRUp8W29lad5XtPx4Gquc09dHucLnPNWuu7D60SGopUvN8Cdg6sW6JwbjQRVdmrINIYLbQniWmOc1iTotv08fqQjYHO/GJ612Qn34xKlrHumf1UUC2KWIxyhRW/3ZDyV1BOrQAuPFshxHiD9xdy7Rxg4fgLugfyofM+bi/NMYBH7vaFZ1YYgobAZjA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:AM6PR04MB6488.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(136003)(396003)(376002)(346002)(39860400002)(450100002)(52536014)(26005)(316002)(6916009)(186003)(86362001)(9686003)(8936002)(33656002)(7696005)(38070700005)(66446008)(55236004)(71200400001)(4326008)(8676002)(4744005)(6506007)(38100700002)(66476007)(478600001)(64756008)(66946007)(91956017)(55016002)(76116006)(2906002)(122000001)(83380400001)(5660300002)(66556008);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Vb49y1esiJ8q1hIJ4z4O9GknEUX9jCESdopQCG8NmD2w79KE0BL66Gekxo?=
	=?iso-8859-1?Q?RZHOt2yx5sHLwrsL9s/osjbky7pcKsMdUGVj+M0c8CDX6Z/WVDTNdu5Qx2?=
	=?iso-8859-1?Q?JSmywBBhqNAwIS3nHGAIAZcFkW0xBUmJGEr/bwPQ+1cU/ku48rtrFPK4yG?=
	=?iso-8859-1?Q?j4tX+msWfoDvy+TjgstiDhRy+y/D93ZgaFXYXpBC4WtT0GofxBUs3pS9/z?=
	=?iso-8859-1?Q?evrXcie9WXXcx+HS45M97HajkZYQh2ByyWfjOSeFeslWp8N1LF/FI3/62G?=
	=?iso-8859-1?Q?ZOY+OsoZyWwjVgDmgxUsph1UxpOENORC6W2oN7inHllgI4C5eYJ6pt3Dvm?=
	=?iso-8859-1?Q?Sas45BgtLr6S7Stt7J5xkXmG5A03EmRjnOie1NEr5jc2D3RWzPGuFkCTsh?=
	=?iso-8859-1?Q?WLhXyRjYtCskWwKhxoWgWmaWUuOn/HVJNcX3mwEpsanrSySfQMtqxOh8Kn?=
	=?iso-8859-1?Q?7OfHan+NBVpOldUF+4p20ajMZZGw9HH857jwd+qCoNYMHa1/uN5tIBef/U?=
	=?iso-8859-1?Q?z1LPDtkQgE5OsMrcB8E8cWpdOjm+meETDdZSwD/vE+BZe3JBw8VHBMhnN9?=
	=?iso-8859-1?Q?EL+iSXQvqnBgetQ39sRphGfR314fPTlQub+FXzuFBJDgSFH6gkKqdv4pId?=
	=?iso-8859-1?Q?MPb22jOghAK/iICtozJ1XLLiHK/n8J9Y0YGlHfIGu9MQrwxJmBsxvNWzhN?=
	=?iso-8859-1?Q?XZM2aGP1Ha62yHdMvpb4sEyqtzZQpyqvmME8ktSYT0aKtK7iVX70OwU65U?=
	=?iso-8859-1?Q?5zGJgCsgpjvxij1iWB3QcVu+DaU6O96pgnAxjdtewg0W5mcidC9zu3rvmg?=
	=?iso-8859-1?Q?AZ62pK2tHbBOJ79mlNzSW8RK/3cMsP4CL5od4jIjTEgqOKflrFYPAx4fYZ?=
	=?iso-8859-1?Q?SefyQLZXmRkKqriKFTBTcDwlXqWOFoNBEQmam+1cvY1WMku1GqVmOVXybp?=
	=?iso-8859-1?Q?8FdOf4AvlUuCsAmS4KzzUKdQDvUASc4h6Vgjf5V+/EuWG/6b6DEH/2/mWL?=
	=?iso-8859-1?Q?+4IU9xeeFTGJj4X/eWuh1tPbKFmnIvKqBBFHAbzkJOme4IXLvj/TqZfiBm?=
	=?iso-8859-1?Q?aXeGB/jEjKQNs57BCj6DoTPRmRRC7wkj25nkHR35aiELbKQICdh/07FAy0?=
	=?iso-8859-1?Q?08Kq1oZ38RZNPeMi1MTx0f1FZhb43iIC+widFtQPW26HnTcil2AjqKqkiN?=
	=?iso-8859-1?Q?4qFf38Fe2D0EeQFXsZnwXutX6AtuHOxHkLXqZnClmVvhncer+KVz9CCdIn?=
	=?iso-8859-1?Q?UjK4Js31xPUFDF9mn/MKK67cIZnCcph6Y/PmwboO5Qj+VL0oV0P/FYQnI8?=
	=?iso-8859-1?Q?u9o7oM5p/9KaOOW3I3xv1/BfdMrV5ghy10TPOgCFgvcPQ+Q=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6488.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e3ffded-b786-4d05-c3fa-08d95cb42ae6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2021 10:38:33.0882 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GNYs+MpHijhQxVrx28lHyVa89d68wgJArWISPUCtpttHo+ulTSmnRWWEAMoKp2Ts
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3720
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 17BAcgem029984
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] Why does dlm_lock function fails when downconvert a
	dlm lock?
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

Hello List,

I am using kernel 5.13.4 (some old version kernels have the same problem).
When node A acquired a dlm (EX) lock, node B tried to get the dlm lock, node A got a BAST message,
then node A downcoverted the dlm lock to NL, dlm_lock function failed with the error -16.
The function failure did not always happen, but in some case, I could encounter this failure. 
Why does dlm_lock function fails when downconvert a dlm lock? there are any documents for describe these error cases?
If the code ignores dlm_lock return error from node A, node B will not get the dlm lock permanently.
How should we handle such situation? call dlm_lock function to downconvert the dlm lock again?

Thanks
Gang

 


