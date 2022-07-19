Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3E05793A3
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jul 2022 08:57:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658213830;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=i1Rm4IonEpjSZ8xNtsayYuTBonwhV2tsouZUqA+NyNo=;
	b=d19UPwKCCfATuGkLA8Q0eMSlJHNBFSPzQo2hRoFl/YCLTvI0Ju+zelIU3BechOFrKB/sU9
	iN3iUn9yHDnglC0wAoRGGtRUPczr8qt6+GuA50WXXZ46XGZa9V1QBd0HILN8C/uIY0uIkN
	83KbFxMUBx+pCrGNDAAdSchN/EjbNqw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-qxRVsflZMFi0g34hVDIbuw-1; Tue, 19 Jul 2022 02:57:05 -0400
X-MC-Unique: qxRVsflZMFi0g34hVDIbuw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81E408037B3;
	Tue, 19 Jul 2022 06:57:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 73206400E894;
	Tue, 19 Jul 2022 06:57:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 01F9B194707C;
	Tue, 19 Jul 2022 06:57:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 020121945DA7 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 19 Jul 2022 06:57:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D98ED40D296B; Tue, 19 Jul 2022 06:57:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4EA240D2962
 for <cluster-devel@redhat.com>; Tue, 19 Jul 2022 06:57:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BACE2101A588
 for <cluster-devel@redhat.com>; Tue, 19 Jul 2022 06:57:02 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-EH7HyF-7N4yxlKIHA_eZKg-1; Tue, 19 Jul 2022 02:57:00 -0400
X-MC-Unique: EH7HyF-7N4yxlKIHA_eZKg-1
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by BN9PR12MB5307.namprd12.prod.outlook.com (2603:10b6:408:104::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17; Tue, 19 Jul
 2022 06:56:56 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::d01a:8f50:460:512]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::d01a:8f50:460:512%5]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 06:56:56 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, "Darrick J. Wong"
 <djwong@kernel.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Naohiro Aota <naohiro.aota@wdc.com>
Thread-Topic: [PATCH 4/4] iomap: remove iomap_writepage
Thread-Index: AQHYmyXxhK1od9xNkkO4RvdYwEAA662FQysA
Date: Tue, 19 Jul 2022 06:56:56 +0000
Message-ID: <14beaab1-ac95-cef4-3f37-005c00e9b87d@nvidia.com>
References: <20220719041311.709250-1-hch@lst.de>
 <20220719041311.709250-5-hch@lst.de>
In-Reply-To: <20220719041311.709250-5-hch@lst.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10cf3d76-7454-4a95-42ab-08da6953de90
x-ms-traffictypediagnostic: BN9PR12MB5307:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 3E6eincLJYswC4AhwiDBXSwskRImBC9+NYQtqmFmFdlVORMtw7O1DSIPLb6Q2f1001p956rRqu4N7B34NMax+zz3SrqBhEdArSThJPbpVeTZq0CmFw28dQgr/El24fw6PDwcikfZbJ8BHaZHjyfowisjWRt1AsVbBWaw/n+wNZ02z5EBbOKUzlhPCCQfUReQgKzpfL7VAPLJ9OmN3pN+DI4uzZAMBc5ggGjY20W6tH70/RSyY5bRnWIRZOPDW55vanSkwimj6NEa2JNNUWt1VCC9XFUK9GJpWxY13r+3uYh3S0mfiGu7fXeSSSa1sRKANlyJFcDsXt38D48ey4te/bUcEs1QviH062f5ZwDUT4mA++RTfFAHPhXkFq4IAvHzoyH74Fhdt1aGsORvNf6J11nMKiemZUcDqBk2x9Hw3HHUblvvo3BvsWWlevRyMpBvLlLXbNq0DVFzYw/etz5ktcjd5/4Y3qdnOSWEn0IH8lbf/aEA0qlxiQ8CG0PMVAJ3bXbLV6G56XM06B1Ev48s+5rGIR35HLe8t6/Pq7xSmwtlzTv2l+zh7+pzPtsHJRD+8O+/wHCsKBZrUQMKtxurpqsqk6WPePRDoPk1BIlBr/sgjygYLDyt+nG7mgjj2o2srFIDs3HBZmRv0WfG+okBavrs86So8/fWJI/3kGncxsU+FFZqPL8h1CYX6RQ7d9wpdimFkiL+hX+2OwZgD5CMBTgevXiw8FFWytDpddiZboPW8ergIxWKeC+e52zZkN2OH60fkUSltMDr/13NGmK2dshpuXRGp/A6XsyL2j2qWpl6tW3/NLRy2q/3dXPuiTWxHeCyBvBzxAPITnXnm/rTNu3ds15f8nNPWpwbKrJUiKmFTvwTcDPTmE0t+nEARmi8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(54906003)(64756008)(53546011)(91956017)(41300700001)(6506007)(6486002)(71200400001)(2906002)(6512007)(110136005)(8676002)(66476007)(66556008)(7416002)(66946007)(316002)(66446008)(478600001)(5660300002)(4326008)(8936002)(38100700002)(31686004)(122000001)(2616005)(36756003)(38070700005)(86362001)(76116006)(558084003)(186003)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QmtSdWt1WE1YNllqbXpXaDkwaC9MZ0Q0VjAyQ3l6d3FOYWR6YkVNU00vSDRB?=
 =?utf-8?B?YWYvWFdoT1lzRDdxZVFwclZDQmVZa2wvQWpGMGZTZ21ta00yZ01NVU9rd0py?=
 =?utf-8?B?YTFJYmJIT2xIMHVudEZuR3pxbS9SZFVzNjkwYkkvN0tUZ2VnTkhrNEZFUGsy?=
 =?utf-8?B?dG9PbC92VEpQcGpnMHVuK3pvVXZZUVlSYUd5TloxdmRJaE5MeWkzR2xUNlNO?=
 =?utf-8?B?Wit0SHIxT3laTmI0Z2k4Z0d1bjBkN0hmYVNyOG8raWxnUjd5aVdURktURkxo?=
 =?utf-8?B?bHgvbnRpdm95UlhEZERzbUMzWlVoWitjRUpqSzBSMmNKN2pnL1pmTFBxdjBI?=
 =?utf-8?B?eUM4U096cW5qKzhFNG92SmxFd2YrcjhZOHkrQ0FaOURORStBVFE5a1RSZFU2?=
 =?utf-8?B?bmFCU1BQcWxiMm5QWEZnczNZaUpmakZCVjh6QVJtdDdsUS9oVXlOa0FzUkQ3?=
 =?utf-8?B?R005WWZJNitMLys0YWRMUDdhWk4ybHpVQ2lYaHhsa1NXL1J3RWt1VTNhRXpU?=
 =?utf-8?B?U0w1UW9EYitHUko5THZqUGNFSEhuTGxiZThZRUU3ekFGTzFtRXd2K3hxOTF2?=
 =?utf-8?B?V21YVzhPMlJuVHFObEFUc3UrZkR5LzVWaDVBMGNXUnNYU0JmUHYvdXdReFMx?=
 =?utf-8?B?Qis3MkZ1dFpjRk56bXBPYm5SYkdhWURRTUxwU2RGZkY4LzlSc3Q1eHpTRGd1?=
 =?utf-8?B?RzBFeXMyMUU5NEE5dWNqSUxSQmQyQ0JGZUJlMk5aTW9yai9GNWVxZzR5Q0pE?=
 =?utf-8?B?VUlhOGhuRTZPWGV1RVM0d3lCdkd0cDlONzdVeHg3eE5SU1p3bEJKaE1hUFg0?=
 =?utf-8?B?bUEyekw1QUFpb3Z6Ty9ybGJzZ0VWbG1aZTZEejZnZVdUbXE5TTBwWE5xaS84?=
 =?utf-8?B?NmZ6ajZsM0FZQWNRMndqMXFweDBlemhPTzBCbDBUS1ZHeVM0YmNPclIzSGNJ?=
 =?utf-8?B?aW9nNUNZeFRoWG9mSmpMOWRKN3ZaWXg5YXpxNVpVTnZwYWtJWGNtcTBGeHJ4?=
 =?utf-8?B?SVlLbHBiZ0t2MGlvNW5aZ00zSXRyZVlYU21PSkVqTlNQN09LUkloWkYyV3Fi?=
 =?utf-8?B?dFpPYStqa3l5cVg5VVBFbGwwcHp1YnZRZjNRdC9Bd2QvSGpxUWhzOGVOME9u?=
 =?utf-8?B?VndRM3pMQzJadHYzTHlWR1ZFcmxOSGJtRER6OUUyR0t6Z1EybThXMUtpenRJ?=
 =?utf-8?B?YU5ETGw2bmhSMFpJWVBJTVRTNit3RjBJTFptL0d5aXlCSThkeElmQ0RVdlkw?=
 =?utf-8?B?c21KZS8xYlkzSXdtaWU5QlRUZlo5bVJUVENla3VNOSt5ZHhGTDBuODJvaVFO?=
 =?utf-8?B?a2czWmNvYlVsN3hIY2NBZTVLN290U0lLWWV2ZDk5SXUwMWluV0MrM250Y3RV?=
 =?utf-8?B?Vk1EcEdwSTE1bUJWb1NTMU1iamFtMDVDRnQrRGY4SU4zZjRyeFYwWXRGeEYx?=
 =?utf-8?B?d1YrcEl0MDlMRkRaakZaY2FDS1orMk1ha3VlRm1WaXpTSGx2dEloK1F4dE52?=
 =?utf-8?B?L21zcG05OVZhRkNlc29oRDMweGlOQjBLUXhJbnNLbmdqQjJteTBGMkowNFcw?=
 =?utf-8?B?bnRnd1VSdHN0ZGpneDNlRGplNStmdFZqd1BzRUc1bW5tRlMzZXc4RE1kYWM4?=
 =?utf-8?B?SVJRR1B2RWJRMm5ZQWpDbzk0Q0d4VWx5SWhKWVJOVWZGRTl6a2NRM3l2SVhC?=
 =?utf-8?B?TFVlV2pNbUFjS0JxbjFkU0JhSHlYNjBFTUFzb2FXYU9hK2tyQnJsYytMd0d1?=
 =?utf-8?B?a25SWHpDZDFNUExERHlUd2xCQ0NqK3h4RWFMSXJBTmxTaSt4NzVzSnFkcFdI?=
 =?utf-8?B?V3B1anY5RldySVJLa0VpWENuakVZbkFzSDJZbmtoV1g5d3d3cEJSY0pSTnY5?=
 =?utf-8?B?YkV1UVUyWUgyTGZ5ekJacUp5amZYV1ptTnE0cG4rbG04TnFkSVBvZDQ5aEZV?=
 =?utf-8?B?di9hMVA1bVhzRmVoSUpkQjVibU1Tc1Zaa1ZMMmF3cFB2VDhDMGs5WmxXeG5Y?=
 =?utf-8?B?STVSMXVMRVcxRWtTUXE5Mm5yODNVSVBDY0RINFpmczVjeHRRNDh0NGN2QVpG?=
 =?utf-8?B?b3V1ZDE1aHAzM3kvOTlGR0FaT1BMRXEyU2Z4UEZQeDRyMDM2MlVxb0N2ZzNL?=
 =?utf-8?B?TzBrN3lsY1ptVmZxK2xvVWFza29pVnhPQmtCYlE4NHNqTkI5VldtYW5KYk5H?=
 =?utf-8?Q?01A2msTHSN5a2Yjf/v5rAijTdcLCUXaddacfWYsG9jp5?=
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10cf3d76-7454-4a95-42ab-08da6953de90
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 06:56:56.3388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1T2s7OCGjmV8iK+PzRJuXOGujT0q2UHp3Ni46RwzZTbRHLFk2i02OBxrHQIXdUnxc7keHHd8mqpU/C0/vzCgaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5307
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH 4/4] iomap: remove iomap_writepage
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <5870620A071C454E980852670C1410C1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gNy8xOC8yMiAyMToxMywgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6DQo+IFVudXNlZCBub3cu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4NCj4g
UmV2aWV3ZWQtYnk6IERhbWllbiBMZSBNb2FsIDxkYW1pZW4ubGVtb2FsQG9wZW5zb3VyY2Uud2Rj
LmNvbT4NCj4gLS0tDQoNCg0KTG9va3MgZ29vZC4NCg0KUmV2aWV3ZWQtYnk6IENoYWl0YW55YSBL
dWxrYXJuaSA8a2NoQG52aWRpYS5jb20+DQoNCi1jaw0KDQoNCg==

