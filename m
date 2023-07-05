Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 09681747AE2
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Jul 2023 03:17:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688519833;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aNayui0waL47/KRgPmEBAKPKOn8Lj1objKGVkPmotaA=;
	b=Dx2aNS4HWFW9MxXenHkKBD80YyFBsLAikN1WnYC7nzBZFQhqyFb+5vPeHfr5K9SR7SQ+64
	gNasZzRbMT7knsOoZMCmNF/ng71YGM2a1S9XYVKu3IoTXxPTlaFSdW0u4Wj7HmhopmOhdQ
	PgYnn2dP3zR2y/5oAzWi965xQD4KvEw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-94-opYDVO-7Mvu57gNqpJhYIg-1; Tue, 04 Jul 2023 21:17:06 -0400
X-MC-Unique: opYDVO-7Mvu57gNqpJhYIg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE3FA101A528;
	Wed,  5 Jul 2023 01:17:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6DC9D40C206F;
	Wed,  5 Jul 2023 01:17:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2ACAB194658D;
	Wed,  5 Jul 2023 01:17:01 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B5F401946588 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Jul 2023 01:17:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6EE324067A01; Wed,  5 Jul 2023 01:17:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6607B4067A00
 for <cluster-devel@redhat.com>; Wed,  5 Jul 2023 01:17:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A21B104458F
 for <cluster-devel@redhat.com>; Wed,  5 Jul 2023 01:17:00 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2114.outbound.protection.outlook.com [40.107.255.114]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-LnNy6ujVMte_cySapt4tIg-1; Tue, 04 Jul 2023 21:16:57 -0400
X-MC-Unique: LnNy6ujVMte_cySapt4tIg-1
Received: from SG2PR06MB3743.apcprd06.prod.outlook.com (2603:1096:4:d0::18) by
 SEYPR06MB6132.apcprd06.prod.outlook.com (2603:1096:101:dd::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.24; Wed, 5 Jul 2023 01:16:50 +0000
Received: from SG2PR06MB3743.apcprd06.prod.outlook.com
 ([fe80::7dfd:a3ed:33ca:9cc8]) by SG2PR06MB3743.apcprd06.prod.outlook.com
 ([fe80::7dfd:a3ed:33ca:9cc8%6]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 01:16:49 +0000
From: =?utf-8?B?546L5piOLei9r+S7tuW6leWxguaKgOacr+mDqA==?= <machel@vivo.com>
To: Alexander Aring <aahringo@redhat.com>
Thread-Topic: [Cluster-devel] [PATCH v1] fs:dlm:Fix NULL pointer dereference
 bug in accept_from_sock()
Thread-Index: AQHZrmYhf1bvhzMKB0iFqDDwDtQQC6+pyp6AgACU9KA=
Date: Wed, 5 Jul 2023 01:16:49 +0000
Message-ID: <SG2PR06MB37431CA356AFA63FDF67EFAABD2FA@SG2PR06MB3743.apcprd06.prod.outlook.com>
References: <20230704104725.2510-1-machel@vivo.com>
 <CAK-6q+jQcyyAtMD5tjzjrJg8Auy6HuugJomiSokwRhqRifVpCA@mail.gmail.com>
In-Reply-To: <CAK-6q+jQcyyAtMD5tjzjrJg8Auy6HuugJomiSokwRhqRifVpCA@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR06MB3743:EE_|SEYPR06MB6132:EE_
x-ms-office365-filtering-correlation-id: 4817cc8b-1cc5-4bf9-d679-08db7cf5820c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: nTvhBM/kcrQ0wpzXW3V2h8Jtk0MUS2Xp973Dk7kQJVQLgWrLB5wzIUVS66T6HpM7S6+AvkXu9wIza1DL8qs2xU8S9apELy04GjbXSqylZG3OlhEWGMGKOyHwxzbpoIM9YSz0h54quTM+zfg/HHxZeM5pog2pa1BlMXEmW5LXLCfPI+bb1QhLkp0llroBRYpyrNGaVibwsANUgX7U6sHsHA2d98Xpq9PozjRA+bKY0T9ND58ksBq0EeKjR0L2JWYdRGrxKNvxgq1MSpKAWvHaJoydDVjF6ykc67IJuv5pjFvlQUkksgZU2r2ADsJNxKHnp99ZGIslKoheJuUVe8VtwOgReeo6+taEWD+yR09r5I5dbSBhP0bTTijv6Lx9dyqZijNET8EhPLJkiIJtQPFJWZj+7e9CfOn92JyhsIaLMoS+U1ybQFlWwLFAofnGmEh1kScBQ+D8jAm9uqQL10yDIaqyHVdFb/tMYhtkcdB+yNmiprBCfU38g9fXhlcwRxIN8aDfGyYh+Ahr0Fi38+0fz4tJ6Pk1JBjRLNnJOy+RktoGcMu+V9YjFUElXssHuVoQpgLKKlu9gkLO0MmDewwqsIYwK5rzLwLCtKvN7ZXiPl4V/7Yn2pULmZCeRtMHSM+l
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3743.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(451199021)(66556008)(64756008)(6506007)(76116006)(6916009)(66476007)(55016003)(4326008)(66946007)(66446008)(478600001)(41300700001)(107886003)(38100700002)(38070700005)(316002)(83380400001)(122000001)(52536014)(53546011)(186003)(26005)(9686003)(54906003)(966005)(8936002)(224303003)(85182001)(2906002)(5660300002)(7696005)(86362001)(71200400001)(33656002);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QW0zRzJuSEJkeDl5TVdBemkwMG5UcXdyaHNOVVFQcHV1UzRBMGc1VXB6UFdp?=
 =?utf-8?B?aG13Rit1c3d4aXh0dG5MT0RCT3pqakFiU1NTQlJybTkyZXdMN0JZbW9KdHVQ?=
 =?utf-8?B?Y0xmZWNGSW9LUlEvbzJURFI1OFBySFRiUGN6WlJlUThMdTJZN3dRUEJOaUZ5?=
 =?utf-8?B?QnFENXJYd2FBd1lGU3QvZTkwTUc5dFhiQk5YaCt2UmpMQUFZS1Y4NjYwQ0RE?=
 =?utf-8?B?V3dNb3Rvc21kbXlSaENpakJBdDBJK290LzlOMEdQU2lqdDdQT2tMQ3FYSGpO?=
 =?utf-8?B?czRCR3F3OGpVM3h5MUxtcUlVN0lkcTgvQUgyK3E4ZVluSWZOVXJYbzRnTWk0?=
 =?utf-8?B?d3RNMit2d0p5Nk5OL1p2WTB5WFJPTllMVlZMSjIwbCtUYlhRNzNaeWlsTDNN?=
 =?utf-8?B?THRiVGFVaFdhR0NJNTkvTW1LakNlS3hWbWZQUXRxKytnckxWUGhLalRENzVi?=
 =?utf-8?B?M21UUVg4SHpxNENsQ3FEdkJmSU02aHhjTlZwR21ieUhmZExJc3ZuclpZbUVS?=
 =?utf-8?B?cXdzRGl6NSt0WXpkV3AwWnFrS0hzMEpWMEtrc2dySnd6aUlRUjZnRkVyY2pY?=
 =?utf-8?B?TWFUSmhhYlY3anlvWVI5U3ZvQW0zaGgvNlRtNlpURHhyM2dJUjZqR1p1aU9m?=
 =?utf-8?B?RFlSWnZEMmZCTXFYMWl5UEFDZFVQT2p2ajRlaStwa0huMHJtRVJRSmFBaVQw?=
 =?utf-8?B?M3c3b3JhYTZ1MUlDejUrWnUxRzE3NFJFais1cHJyVHpXRjFCT3hTRG5OOUkr?=
 =?utf-8?B?NDg3T3J3OU5hcmdzTkZrWGZ0dGRZSk4zMEVkTDVrNkpGc0kzUEwxTUlhUktu?=
 =?utf-8?B?VFFMeDdlbzJ3MjdrcUNWaXBON3YyR1RFdnBGbjFEUmRJa2lDSzdEL0dpSzRv?=
 =?utf-8?B?YzBNQU1xcXFKWnViT2l4TGhYbjZmeVloYWJ3UGFRSHU0Z1NLQUcwVGJTdExN?=
 =?utf-8?B?MUZ2K2JFcnZqQWNaNWdvLzFYMUt2WlV2SHFQb1k1N2JHT09mNzZYV1ArTE1D?=
 =?utf-8?B?Y3k3L1lQSGtOQ2M3anU4VDhSSWF0ZlZCYjA1dEFFK256eGhmSFBVRXJtTkNJ?=
 =?utf-8?B?akhBelVEdlB4R1FtTEpQSCtPNy96S2hLTmJuWmNWcU5HNTVxQUxBYnl2eWsv?=
 =?utf-8?B?UmxEUTFWNzNxOVlwdkR6eVpveFFsTXVnbzFpL3NhWTVWK2NpSnhHTDVFVldX?=
 =?utf-8?B?YW1neFlWWVoxQnpQNVV2RTdjUDV0RjZpbFoybE5aVUxFZHR2L1JZY0NXdy9q?=
 =?utf-8?B?SU9uNWxueTdlcmY4UzJBZGZpM1Q4WFFCQzFPZUxXdFdpeHltMU1nMzN6Ujhk?=
 =?utf-8?B?djR2SXZ2OVFYOTlrYVhhYkxRKzAzN0VOQ2NISEplcGxDcHI0Nmlrb2s1alZn?=
 =?utf-8?B?Y3RaUjN0UDJZT2RxUG1GYzhid09Hd09GL2pscExNV28xUHJzTmUvNWpBM29y?=
 =?utf-8?B?dnkybVhrWk5Xa1FxZmlpc2tYMUNlaytWTXF6RlhNY0pYS0o5M09ETVE3bzl6?=
 =?utf-8?B?SFhiZnBLcjZ6VzFlMlkzSUJMU1ZCUXplU0E4RFYwdTU0YjhBMEd6cWcvNE1J?=
 =?utf-8?B?N3pXanJTU2x3WU9RNnhXcWhvSXZnTytQS3d6YTVncE01K1krdkpicDdUNXFI?=
 =?utf-8?B?clptY2dBUktwRG5iN25uNGNkRWZ5dmN5L25nYXpZUnUvSHJhb3MrbEJFcWFC?=
 =?utf-8?B?TXhMQzlLZ0k1YzhWYUpXUVpnTEJmQmNZTEM4S0wxWS9xUE1hdEJWRVhHZ2lK?=
 =?utf-8?B?ZEk3TXlwd1hKWGtaNmZvWkRHVk1qa0x1bnNVN2JLYVdubnNZU25KWXhxOTUr?=
 =?utf-8?B?Yk82NjYwVmcrV1BKQXhwSnpVU0hyc1FFNG1vaEFDQmtUd2RRczk5UzIxaFhj?=
 =?utf-8?B?eWs1QjBYTWVyZGxoUmhhN0c2MjRSV25PdEJLYXB4QUJCWDRFczdZNTJxa2U5?=
 =?utf-8?B?MVNabWowcXVKc042Wm5tQ29CSHd2bUJZWWFUd2RLUDRjWnpKTTlKWkJRd0hV?=
 =?utf-8?B?MVdxSXBXTkJ2RjRQd1lreUpDa3M0UVRCRkpKbmc3a3ZWYzFIR0ZsdEx5SDdm?=
 =?utf-8?B?MnRpZ083WlFGN2xqV1RlSnJmbUJqaWhESzBJbjdMSmNJRWMxd01GaGpHRGZE?=
 =?utf-8?Q?qlds=3D?=
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3743.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4817cc8b-1cc5-4bf9-d679-08db7cf5820c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2023 01:16:49.3228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a+59BE93pZPYl/wAFoAnG4YNsF9AG8QqRBQ44/9JqUta3x15jPcDgZ2FnUmlyPU0xSsjC7E0uqkgo2FRVfaj6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6132
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] =?utf-8?b?5Zue5aSNOiAgW1BBVENIIHYxXSBmczpkbG06?=
 =?utf-8?q?Fix_NULL_pointer_dereference_bug_in_accept=5Ffrom=5Fsock=28=29?=
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
 "opensource.kernel" <opensource.kernel@vivo.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: vivo.com
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmsgeW91LiBJIHNlZS4gSSBoYWRuJ3Qgbm90aWNlZCB3aGF0IHRoZSBhZGRfc29jaygpIGZ1
bmN0aW9uIGRpZCBiZWZvcmUsIGJ1dCBub3cgSSB1bmRlcnN0YW5kIHRoYXQgbmV3Y29uLT5zb2Nr
IHdpbGwgbm90IGJlIGEgbnVsbCBwb2ludGVyLg0KDQotLS0tLemCruS7tuWOn+S7ti0tLS0tDQrl
j5Hku7bkuro6IEFsZXhhbmRlciBBcmluZyA8YWFocmluZ29AcmVkaGF0LmNvbT4gDQrlj5HpgIHm
l7bpl7Q6IDIwMjPlubQ35pyINeaXpSAwOjIyDQrmlLbku7bkuro6IOeOi+aYji3ova/ku7blupXl
sYLmioDmnK/pg6ggPG1hY2hlbEB2aXZvLmNvbT4NCuaKhOmAgTogQ2hyaXN0aW5lIENhdWxmaWVs
ZCA8Y2NhdWxmaWVAcmVkaGF0LmNvbT47IERhdmlkIFRlaWdsYW5kIDx0ZWlnbGFuZEByZWRoYXQu
Y29tPjsgY2x1c3Rlci1kZXZlbEByZWRoYXQuY29tOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnOyBvcGVuc291cmNlLmtlcm5lbCA8b3BlbnNvdXJjZS5rZXJuZWxAdml2by5jb20+DQrkuLvp
opg6IFJlOiBbQ2x1c3Rlci1kZXZlbF0gW1BBVENIIHYxXSBmczpkbG06Rml4IE5VTEwgcG9pbnRl
ciBkZXJlZmVyZW5jZSBidWcgaW4gYWNjZXB0X2Zyb21fc29jaygpDQoNClvkvaDpgJrluLjkuI3k
vJrmlLbliLDmnaXoh6ogYWFocmluZ29AcmVkaGF0LmNvbSDnmoTnlLXlrZDpgq7ku7bjgILor7fo
rr/pl64gaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9u77yM5Lul
5LqG6Kej6L+Z5LiA54K55Li65LuA5LmI5b6I6YeN6KaBXQ0KDQpIaSwNCg0KT24gVHVlLCBKdWwg
NCwgMjAyMyBhdCA2OjU24oCvQU0gV2FuZyBNaW5nIDxtYWNoZWxAdml2by5jb20+IHdyb3RlOg0K
Pg0KPiBuZXdjb24gLT4gc29jayBpcyBOVUxMIGJ1dCBkZXJlZmVyZW5jZWQuDQo+IEZpcnN0IGNo
ZWNrIG5ld2Nvbi4gV2hldGhlciBzb2NrIGlzIGEgbnVsbCBwb2ludGVyLg0KPiBJZiBzbywgdGhl
IHN1YnNlcXVlbnQgb3BlcmF0aW9ucyBhcmUgc2tpcHBlZC4NCj4gSWYgaXQgaXMgbm90IGVtcHR5
LCBwZXJmb3JtIHN1YnNlcXVlbnQgb3BlcmF0aW9ucy4NCj4NCg0KZGlkIHlvdSBleHBlcmllbmNl
IHNvbWUgbnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlPyBJZiBzbywgb24gd2hpY2gga2VybmVsIHdh
cyBpdD8NCg0KPiBTaWduZWQtb2ZmLWJ5OiBXYW5nIE1pbmcgPG1hY2hlbEB2aXZvLmNvbT4NCj4g
LS0tDQo+ICBmcy9kbG0vbG93Y29tbXMuYyB8IDkgKysrKysrLS0tDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZnMv
ZGxtL2xvd2NvbW1zLmMgYi9mcy9kbG0vbG93Y29tbXMuYyBpbmRleCANCj4gOWYxNGVhOWY2Li5l
YTE4Yjk0NzggMTAwNjQ0DQo+IC0tLSBhL2ZzL2RsbS9sb3djb21tcy5jDQo+ICsrKyBiL2ZzL2Rs
bS9sb3djb21tcy5jDQo+IEBAIC0xMDgxLDkgKzEwODEsMTIgQEAgc3RhdGljIGludCBhY2NlcHRf
ZnJvbV9zb2NrKHZvaWQpDQo+ICAgICAgICAgICAgICAgICBhZGRfc29jayhuZXdzb2NrLCBuZXdj
b24pOw0KPg0KDQpIZXJlIGluIGFkZF9zb2NrKCkgd2UgYXNzaWduIG5ld2Nvbi0+c29jayA9IG5l
d3NvY2suIEl0IGNhbm5vdCBmYWlsIGFuZCBuZXdzb2NrIGNhbm5vdCBiZSBudWxsLCBzbyBob2xk
aW5nIHRoZSBuZXdjb24tPnNvY2tfbG9jayB3cml0ZSBwcm90ZWN0ZWQgX3Nob3VsZF8gYmUgc2Fm
ZSB0aGF0IG90aGVycyBkb24ndCBtYW5pcHVsYXRlIG5ld2Nvbi0+c29jay4NCkl0IHNob3VsZCwg
dGhhdCdzIHdoeSBJIGFtIGFza2luZyBpZiB5b3UgZXhwZXJpZW5jZWQgc29tZSBpc3N1ZSBoZXJl
Pw0KDQo+ICAgICAgICAgICAgICAgICAvKiBjaGVjayBpZiB3ZSByZWNldmVkIHNvbWV0aGluZyB3
aGlsZSBhZGRpbmcgKi8NCj4gLSAgICAgICAgICAgICAgIGxvY2tfc29jayhuZXdjb24tPnNvY2st
PnNrKTsNCj4gLSAgICAgICAgICAgICAgIGxvd2NvbW1zX3F1ZXVlX3J3b3JrKG5ld2Nvbik7DQo+
IC0gICAgICAgICAgICAgICByZWxlYXNlX3NvY2sobmV3Y29uLT5zb2NrLT5zayk7DQoNCnNlZSBh
Ym92ZSwgbmV3Y29uLT5zb2NrIHNob3VsZCBhbHdheXMgYmUgc2V0IGF0IHRoaXMgcG9pbnQuDQoN
Cj4gKyAgICAgICAgICAgICAgIGlmIChuZXdjb24tPnNvY2spIHsNCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgbG9ja19zb2NrKG5ld2Nvbi0+c29jay0+c2spOw0KPiArICAgICAgICAgICAgICAg
ICAgICAgICBsb3djb21tc19xdWV1ZV9yd29yayhuZXdjb24pOw0KPiArICAgICAgICAgICAgICAg
ICAgICAgICByZWxlYXNlX3NvY2sobmV3Y29uLT5zb2NrLT5zayk7DQo+ICsgICAgICAgICAgICAg
ICB9DQo+ICsNCj4gICAgICAgICB9DQo+ICAgICAgICAgdXBfd3JpdGUoJm5ld2Nvbi0+c29ja19s
b2NrKTsNCj4gICAgICAgICBzcmN1X3JlYWRfdW5sb2NrKCZjb25uZWN0aW9uc19zcmN1LCBpZHgp
Ow0KDQotIEFsZXgNCg0K

