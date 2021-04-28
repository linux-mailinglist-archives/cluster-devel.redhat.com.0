Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE4036DCA1
	for <lists+cluster-devel@lfdr.de>; Wed, 28 Apr 2021 18:03:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-7vtQVkjnMfqEZweltgQcyw-1; Wed, 28 Apr 2021 12:03:27 -0400
X-MC-Unique: 7vtQVkjnMfqEZweltgQcyw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C8F69126B;
	Wed, 28 Apr 2021 16:03:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CA055C224;
	Wed, 28 Apr 2021 16:03:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 56D1A44A58;
	Wed, 28 Apr 2021 16:03:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13SG3NfB005814 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 28 Apr 2021 12:03:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 51DB32155C50; Wed, 28 Apr 2021 16:03:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C1D02155C4F
	for <cluster-devel@redhat.com>; Wed, 28 Apr 2021 16:03:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1856A28813
	for <cluster-devel@redhat.com>; Wed, 28 Apr 2021 16:03:20 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-411-cD75iKevP0-ggreoV3q9SQ-1; Wed, 28 Apr 2021 12:03:18 -0400
X-MC-Unique: cD75iKevP0-ggreoV3q9SQ-1
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	13SFjujb158799; Wed, 28 Apr 2021 16:03:17 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by aserp2120.oracle.com with ESMTP id 385ahbsbpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Apr 2021 16:03:17 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	13SFl9CG079985; Wed, 28 Apr 2021 16:03:16 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
	(mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by userp3020.oracle.com with ESMTP id 384w3uvf2c-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Apr 2021 16:03:16 +0000
Received: from SJ0PR10MB4752.namprd10.prod.outlook.com (2603:10b6:a03:2d7::19)
	by SJ0PR10MB4543.namprd10.prod.outlook.com (2603:10b6:a03:2d9::17)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22;
	Wed, 28 Apr 2021 16:03:13 +0000
Received: from SJ0PR10MB4752.namprd10.prod.outlook.com
	([fe80::7865:7d35:9cee:363f]) by
	SJ0PR10MB4752.namprd10.prod.outlook.com
	([fe80::7865:7d35:9cee:363f%5]) with mapi id 15.20.4065.027;
	Wed, 28 Apr 2021 16:03:13 +0000
To: ocfs2-devel@oss.oracle.com, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org
References: <20210426220552.45413-1-junxiao.bi@oracle.com>
	<20210426220552.45413-3-junxiao.bi@oracle.com>
From: Junxiao Bi <junxiao.bi@oracle.com>
Message-ID: <3d364174-53dd-ee07-ac3a-6ea57878f8d8@oracle.com>
Date: Wed, 28 Apr 2021 09:02:13 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
	Gecko/20100101 Thunderbird/78.10.0
In-Reply-To: <20210426220552.45413-3-junxiao.bi@oracle.com>
X-Originating-IP: [73.231.9.254]
X-ClientProxiedBy: SN7PR04CA0047.namprd04.prod.outlook.com
	(2603:10b6:806:120::22) To SJ0PR10MB4752.namprd10.prod.outlook.com
	(2603:10b6:a03:2d7::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from dhcp-10-159-154-52.vpn.oracle.com (73.231.9.254) by
	SN7PR04CA0047.namprd04.prod.outlook.com (2603:10b6:806:120::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27
	via Frontend Transport; Wed, 28 Apr 2021 16:03:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15d3c761-a299-49d2-c8c5-08d90a5f20b2
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4543:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4543FC5D560AE0C24A610B4FE8409@SJ0PR10MB4543.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:619
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: xImvS80fBsQvBsUCEOMQVFYZIvYrmYhIF75CxTkz9bWKkVzmi4uN/IaLLi8y6WuCjh0F2w59hWUCF7ascc9g3BE7rftidp/MoYtDns47uzx0M+Xp0FRwWCxPptdMeGzgclXfGQ4IFfwKqJqtCkzQhuIkGU/9rK3t6NMKbmKEqXAtsRntRwom/MHJTwyeyUezx4fp6Os3Q0gxiBY2KWr1Z1WOIr9oZ+xrl2NK/EZylE7QU6gnXK/p/0WHfThzwfESLvdhGkN2lQBE4hoshDbjZPj65pkVdHvVurQDfDCkLfKlyDgQerq+hV9400rumbF4LNvTN/5sODhKGy0ELYgJLUpjRksbVQ2TxMOZPIf40uqWEHC8uxjavXuzyrekHDsLQls8OFZxWW7SoaulNc4Op6vodhuda6P+V2TByekPRwQgoQONZlw1+qmTgrroogIWd/rG0YKX6DSoeQfJ+x/Ri80L74AatXWTxZGuNQdillvj1yqNpHZiTH9fYy0eM6mRhosjY2f9X8NwF38i/78U0FPsXG7tvaO5zXt4Ef5pcdwEYEdcG9zGr+N5yJBnq/ZC3IcuZc1kHvV4rz33obJ4dn4IxI7in79hoPFVBz+xx4qzGCNHZQZffkIfqRHgIB+0ygpLlz5+dS89nfcbBvFovaG+6Kw1bfO1LW++MZX5Sjp/+HLN1uncCCwTi4C+MG5w
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SJ0PR10MB4752.namprd10.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(39860400002)(346002)(376002)(396003)(136003)(956004)(84040400003)(36756003)(316002)(2616005)(8676002)(83380400001)(38100700002)(44832011)(16526019)(6486002)(31696002)(186003)(4326008)(86362001)(7696005)(2906002)(66946007)(53546011)(478600001)(8936002)(66476007)(66556008)(4744005)(31686004)(5660300002)(26005)(45980500001)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YlhTa3ZXK1pxQmxtQWhVYXZLTzhrWWhtYkR0N0ZIVERzT1owNFluUXF1M3Bn?=
	=?utf-8?B?dXJ3UW1BZTJZZEhHUG01Q3h3Z0NWcDl2YldQeFBwN2tnM3E5Z1VJOTRRWFdG?=
	=?utf-8?B?cVY5VEJ3MHZQckZIeGlqVWo3aTVkaHhKeUltaGVLL3NCQ1c1MHBIekVDWVpT?=
	=?utf-8?B?M0hWUnpNNGphVmJaSjc0UVJxNEE3b25sdGpFcXYvZUJra3RYUGVFcVFsdkhI?=
	=?utf-8?B?dGlwdk5GanZ1a0pTcEZ6d3YvNHFmZWlEd3VveUZoY2tCNGlXN2EvRGxMM1ND?=
	=?utf-8?B?ZWVnMkZ5K01TUGtyZnZRZEV4cXAvcmFJeGxWOHpaNTNhWlQ4M0NhWWJYMHln?=
	=?utf-8?B?MEo1T0tCNHBNTk9BMDNHUlk0Ny9Wc0F1ajJLeUoxMlhMdzc3T2RSdTNVemhn?=
	=?utf-8?B?KzM4K3lXV1pOTE9ndHR1UzQ1NG1YQy8rYzgySzNHMW0rei84dXB3cjd0ak9D?=
	=?utf-8?B?T3RnTXpmOFowcWJxWVFQcCtCWVEzZjc0cFVjdW9ub2NFb1NzdUFDR21ZdGEz?=
	=?utf-8?B?MUo5U2Ixam90YU5OemN1QnZEc2hmeEp1eHVXMFJ1MVUwMXplZzVQVUxCdDE0?=
	=?utf-8?B?VUxFNE0yMnBvMWsvbFVsZGU4WWdHMFdNcUcvbEQwWGxzRVoxeFl1M21SZ1Js?=
	=?utf-8?B?d0lKVGNqcnFFWHhuZ3ZWY09JOWZhL2crOENqZnRlUVkwWUljMXp6S2tKZ2gv?=
	=?utf-8?B?TGpsVE9XNWRNRFNENXh5QjB4cDJlMzdPTzNMTTc4Ky9uU1RiUFc0clBtZ3ha?=
	=?utf-8?B?YXgxbXdiL3hQaG5CWDFTTWlNZy8yY1kxeXpNVnJDQUljaVVqNUFqSXNKaXRS?=
	=?utf-8?B?cnpaNnIwN1Jobnl6TCtQWmQ5SUswSG9PSkpUcFp0QWtMWnhLOVBaOUFENDdq?=
	=?utf-8?B?cmZJdnlrT1FhNTJ0djE4OXNNekYyRHdvdURISGFwckdYeSs3SDFsSWFmOTJG?=
	=?utf-8?B?RlRRVTBBb0x2ai9HT2c3ZVBLYkd6OUoxc01pcTM3d3ZzNU9URHEwdVF6U1Jk?=
	=?utf-8?B?L3RxaU5ZdUwvbVlEODZpRUhZTXE3dEZONHBVYnpnTEFQblF3Qk8yNDNOcXBq?=
	=?utf-8?B?Yys3UnZlWWN0RW1nRzMyZmFybDFKaHNVR0Z1SEhjZWpYWXRJQlcwNlRBTTIy?=
	=?utf-8?B?dGh3UWVneUxBZ2sxSzljc2k3Q1M2czhDNytTQ3ZsanJEWWpBVW0rd1BOLzRt?=
	=?utf-8?B?Z1VZS01rNGtIS0dJY0RUckV6OTVtakF2R0pqNWkxdnV0U0t1MnhLY250OHgx?=
	=?utf-8?B?dHBCdGpLVWQzTndnb20vSFovM25Jd21GK0lIMzNkRnRmRmVEbkw1V1JocWlW?=
	=?utf-8?B?Vy9OVWFrR3FIbnMrWVd4Ymtvbzh5dm1rZHdvQW4vMjVtR2svRDB1d0hsSDFY?=
	=?utf-8?B?d0tSczVCc1VrRisveE9lV0tadVdjVFJDb1dmbHhveFhreVRTb1hybDNGMUNI?=
	=?utf-8?B?ODMxZ25WejA4SnJXU2x4ZVBBNDFBRFJTeFlTSGVSMm9xQ3l2NGhGOW91Qm95?=
	=?utf-8?B?ZjAvWkk3TlIyV2xoVGI2Ky9IREtIVk5YZlY3MGN3dnIyRFVobTJ5NnllRTgx?=
	=?utf-8?B?UTI1SXJVY3ZwbEVJSzZoWmdNZ3RGZlN1bHIwTUJUZmhUbzNIdnNDZWU3MTNV?=
	=?utf-8?B?NmczY3pDMVVCdkRXRDNhYnRSbzJrTjhsSEJxS0g2cGQ5UjdJQXpnQkY0eTUx?=
	=?utf-8?B?TFA2aDBqekNJZjVyRnJwMWVxTnY0RUtPU2tIaUJXSFVMamFsR0lqUWxMaEZv?=
	=?utf-8?Q?vppZLpm6Ho24fqUGKlloLEYj30RJNQwkK2D1mxk?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d3c761-a299-49d2-c8c5-08d90a5f20b2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4752.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 16:03:13.8126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZYrHrqhxWh6iK/wdJ2nV25vg1/mMfzUo/w6jGon/GeH196JRsIW6xOSfx4PS6j3kbUq8msiqg7dQ5xio7BuBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4543
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9968
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
	malwarescore=0 mlxscore=0
	mlxlogscore=999 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2104060000 definitions=main-2104280102
X-Proofpoint-GUID: fZZDLjTh9W7Hp5ZJLtZ23FNYyP7BMqQp
X-Proofpoint-ORIG-GUID: fZZDLjTh9W7Hp5ZJLtZ23FNYyP7BMqQp
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9968
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
	bulkscore=0 mlxlogscore=999
	priorityscore=1501 clxscore=1011 adultscore=0 suspectscore=0
	spamscore=0
	phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2104060000 definitions=main-2104280102
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH 3/3] gfs2: fix out of inode size
	writeback
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Bob & Andreas,

Can you help review this patch?

Thanks,

Junxiao.

On 4/26/21 3:05 PM, Junxiao Bi wrote:
> Dirty flag of buffers out of inode size will be cleared and will not
> be writeback.
>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Junxiao Bi <junxiao.bi@oracle.com>
> ---
>   fs/gfs2/aops.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
> index cc4f987687f3..cd8a87555b3a 100644
> --- a/fs/gfs2/aops.c
> +++ b/fs/gfs2/aops.c
> @@ -133,8 +133,8 @@ static int gfs2_write_jdata_page(struct page *page,
>   	if (page->index == end_index && offset)
>   		zero_user_segment(page, offset, PAGE_SIZE);
>   
> -	return __block_write_full_page(inode, page, gfs2_get_block_noalloc, wbc,
> -				       end_buffer_async_write);
> +	return __block_write_full_page_eof(inode, page, gfs2_get_block_noalloc, wbc,
> +				       end_buffer_async_write, true);
>   }
>   
>   /**

